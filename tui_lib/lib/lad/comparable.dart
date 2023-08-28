import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'comparable.g.dart';

class ComparableProxy {
  ComparableProxy({
    required this.comparableCache,
    required this.king,
  });
  final Cache<Comparable> comparableCache;
  final King king;

  Comparable getById(
    String comparableId, {
    bool disableApi = false,
    bool forceApi = false,
  }) {
    if (!disableApi) {
      comparableCache.apiGetById(
          url: EndpointsV2.comparableGetById,
          idName: 'ComparableId',
          id: comparableId,
          forceApi: forceApi);
    }

    return comparableCache.getItem(comparableId);
  }

  static ComparableProxy of(BuildContext context) {
    return King.of(context).lad.comparableProxy;
  }
}

class Comparable = ComparableBase with _$Comparable;

abstract class ComparableBase with Store {
  @observable
  String comparableId = '';
  @observable
  String surferId = '';
  @observable
  String targetPropertyId = '';

  @observable
  String challengeDocName = '';
  @observable
  String comparableDocName = '';
  @observable
  String fullAddress = '';
  @observable
  int timeCreated = 0;

  bool isLoaded = false;

  //void clear() {
  //comparableId = '';
  //surferId = '';
  //targetPropertyId = '';
  //timeCreated = 0;
  //}

  static Comparable unpackById(Map<String, dynamic> body, Comparable tt) {
    tt.comparableId = readString(body, 'ComparableId');
    tt.surferId = readString(body, 'SurferId');
    tt.targetPropertyId = readString(body, 'TargetPropertyId');
    tt.challengeDocName = readString(body, 'ChallengeDocName');
    tt.comparableDocName = readString(body, 'ComparableDocName');
    tt.fullAddress = readString(body, 'FullAddress');
    tt.timeCreated = readInt(body, 'TimeCreated');

    tt.isLoaded = true;
    return tt;
  }

  static copier(Comparable dest, Comparable alt) {
    dest.loadFromAltComparable(alt);
  }

  void loadFromAltComparable(Comparable alt) {
    comparableId = alt.comparableId;
    surferId = alt.surferId;
    targetPropertyId = alt.targetPropertyId;

    challengeDocName = alt.challengeDocName;
    comparableDocName = alt.comparableDocName;
    fullAddress = alt.fullAddress;
    timeCreated = alt.timeCreated;

    isLoaded = true;
  }

  String shortId() {
    return comparableId.split('-').first;
  }
}
