import 'dart:async';

import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

// Recommended Proxy functions:
// getFresh
// getBlocking

bool isTimeCachedExpired(King king, int timeCached) {
  int timeNow = nowStamp();
  int cacheAge = timeNow - timeCached;
  if (cacheAge > king.conf.cacheExpireMilliseconds) {
    return true;
  } else {
    return false;
  }
}

bool isTimeCachedThrottled(King king, int timeCached) {
  int timeNow = nowStamp();
  int cacheAge = timeNow - timeCached;
  if (king.conf.cacheThrottleMilliseconds > cacheAge) {
    return true;
  } else {
    return false;
  }
}

class Cache<T> {
  Cache(
    this.king, {
    required this.creator,
    this.copier,
    this.unpackById,
  });
  King king;
  final T Function() creator;
  //NOTE: next iteration, try dropping the copier
  final Function(T, T)? copier;
  final Function(Map<String, dynamic>, T)? unpackById;

  ObservableMap<String, T> cachedItems = ObservableMap<String, T>();
  // cachedTimes is last time an id was called; always the last success
  Map<String, int> cachedTimes = {};
  //NOTE: erroredTimes is not implemented. the normal cache throttle should be
  // sufficient in most cases
  Map<String, int> erroredTimes = {};
  Set<String> flaggedForUpdate = {};

  List<T> copyValues() {
    cachedItems.remove('');
    return List.from(cachedItems.values);
  }

  T _makeNewCacheItemWrapper(String id) {
    final item = creator();
    _cacheItemInitWrapper(item, id, king);
    return item;
  }

  // when we try to access an item, it is immediately initalized
  T getItem(String id) {
    T item = cachedItems.putIfAbsent(id, () => _makeNewCacheItemWrapper(id));
    return item;
  }

  List<T> getItemsAsList(List<String> ids) {
    List<T> itemList = [];
    for (String id in ids) {
      T item = cachedItems.putIfAbsent(id, () => _makeNewCacheItemWrapper(id));
      itemList.add(item);
    }
    return itemList;
  }

  // when we set an item, we do not set it directly - we copy it into the cache
  void setItemFromT(String id, T item) {
    T dest = getItem(id)!;
    copier!(dest, item);
    cachedTimes[id] = nowStamp();
    erroredTimes.remove(id);
    flaggedForUpdate.remove(id);
  }

  void setItemFromJson(String id, Map<String, dynamic> jason) {
    unpackById!(jason, getItem(id)!);
    cachedTimes[id] = nowStamp();
    erroredTimes.remove(id);
    flaggedForUpdate.remove(id);
  }

  void setItemsFromT(List<String> ids, List<T> items) {
    ids.asMap().forEach((index, id) {
      var item = items[index];
      setItemFromT(id, item);
    });
  }

  void setItemsFromJson(List<String> ids, List items) {
    ids.asMap().forEach((index, id) {
      var item = items[index];
      setItemFromJson(id, item);
    });
  }

  void setItemsFromKV(ApiResponse ares) {
    if (ares.body.containsKey('KV')) {
      Map<String, dynamic> kv = ares.body['KV'];
      for (MapEntry entry in kv.entries) {
        String id = entry.key;
        Map<String, dynamic> value = entry.value;
        erroredTimes.remove(id);
        cachedTimes[id] = nowStamp();
        unpackById!(value, getItem(id));
      }
    } else {
      king.plog.e('map KV not found in response');
    }
  }

  bool needsUpdate(String id) {
    if (id == '') {
      print('needsUpdate false since id is blank');
      return false;
    }

    if (flaggedForUpdate.contains(id)) {
      print('needsUpdate true since flagged');
      return true;
    }

    int timeCached = cachedTimes[id] ?? 0;
    if (isTimeCachedThrottled(king, timeCached)) {
      print('needsUpdate false since last request was too recent');
      return false;
    }

    if (isTimeCachedExpired(king, timeCached)) {
      print('needsUpdate true since cachedTime expired');
      return true;
    }

    print('needsUpdate false since no reason found');
    return false;
  }

  Future<T> apiGetById(
      {required String url,
      required String idName,
      required String id,
      bool forceApi = false}) async {
    if (forceApi || needsUpdate(id)) {
      cachedTimes[id] = nowStamp();
      Map<String, String> payload = {idName: id};
      ApiResponse ares = await king.lip.api(url, payload: payload);

      if (ares.isOk) {
        erroredTimes.remove(id);
        unpackById!(ares.body, getItem(id));
      } else {
        erroredTimes[id] = nowStamp();
      }
    }
    return getItem(id);
  }

  Future<T> apiGetByPayload(
      {required String url,
      required String id,
      required Map<String, dynamic> payload,
      required Function(Map<String, dynamic>, dynamic) unpackByPayload,
      bool forceApi = false}) async {
    if (forceApi || needsUpdate(id)) {
      cachedTimes[id] = nowStamp();
      ApiResponse ares = await king.lip.api(url, payload: payload);

      if (ares.isOk) {
        erroredTimes.remove(id);
        unpackByPayload(ares.body, getItem(id));
      } else {
        erroredTimes[id] = nowStamp();
      }
    }
    return getItem(id);
  }

  Future<List<T>> apiGetByIdsAsList(
      {required String url,
      required String idsName,
      required List<String> ids,
      bool forceApi = false}) async {
    List<String> idsForApi = [];
    if (forceApi) {
      idsForApi = ids;
    } else {
      for (String id in ids) {
        if (needsUpdate(id)) {
          idsForApi.add(id);
        }
      }
    }

    if (idsForApi.isNotEmpty) {
      Map<String, List<String>> payload = {idsName: idsForApi};
      ApiResponse ares = await king.lip.api(url, payload: payload);
      setItemsFromKV(ares);
    }
    return getItemsAsList(ids);
  }
}

//NOTE: not sure if this will be used
class IdListCache {
  IdListCache(this.king, this.getUrl, this.idName);
  King king;
  String getUrl;
  String idName;

  ObservableMap<String, ObservableList> cachedLists =
      ObservableMap<String, ObservableList>();
  Map<String, int> cachedTimes = {};
  Map<String, int> erroredTimes = {};
  Set<String> flaggedForUpdate = {};

  // when we try to access an item, it is immediately initalized
  ObservableList<dynamic> getList(String id) {
    ObservableList<dynamic> list =
        cachedLists.putIfAbsent(id, () => ObservableList<dynamic>());
    return list;
  }

  copier(String id, List alt) {
    var dest = getList(id);
    dest.clear();
    dest.addAll(alt);
  }

  bool needsUpdate(String id) {
    if (id == '') {
      print('needsUpdate false since id is blank');
      return false;
    }

    if (flaggedForUpdate.contains(id)) {
      print('needsUpdate true since flagged');
      return true;
    }

    int timeCached = cachedTimes[id] ?? 0;
    if (isTimeCachedThrottled(king, timeCached)) {
      print('needsUpdate false since last request was too recent');
      return false;
    }

    if (isTimeCachedExpired(king, timeCached)) {
      print('needsUpdate true since cachedTime expired');
      return true;
    }

    print('needsUpdate false since no reason found');
    return false;
  }

  ObservableList<dynamic> apiGetById({
    required String id,
    bool forceApi = false,
    Cache? collectionCache,
  }) {
    if (forceApi || needsUpdate(id)) {
      () async {
        cachedTimes[id] = nowStamp();
        Map<String, String> payload = {idName: id};
        ApiResponse ares = await king.lip.api(getUrl, payload: payload);
        if (ares.isOk) {
          erroredTimes.remove(id);
          List<String> idList = ares.body['IdList'].cast<String>();
          copier(id, idList);

          collectionCache?.setItemsFromJson(
              idList, ares.body['Collection'] ?? []);
        } else {
          erroredTimes[id] = nowStamp();
        }
      }();
    }
    return getList(id);
  }
}

void _cacheItemInitWrapper(dynamic item, String id, King king) async {
  switch (item.runtimeType) {
    //case Chat:
    //item.king = king;
    //item.loadLocal();
    //break;

    //case NetworkSub:
    //item.king = king;
    //item.loadLocal();
    //break;

    default:
      break;
  }
}
