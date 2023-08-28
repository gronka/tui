import 'package:intl/intl.dart' as intl;
import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'plastic.g.dart';

// a Plastic is a credit card saved on Stripe

class PlasticProxy {
  PlasticProxy({
    required this.plasticCache,
    required this.king,
  });
  final Cache<Plastic> plasticCache;
  final King king;
  final ObservableList nonDefaultPlastics = ObservableList();
  final ObservableList allPlastics = ObservableList();
  String defaultPlasticId = '';
  int timeAllPlasticsCached = 0;

  //NOTE: getById does not call the api; the plastic should already be in the
  // cache
  Plastic getById(
    String plasticId, {
    bool disableApi = false,
    bool forceApi = false,
  }) {
    if (!disableApi) {
      king.plog.wtf('made a call to api for plasticId: $plasticId');
      //planCache.apiGetById(
      //url: EndpointsV2.planGetById,
      //idName: 'PlanId',
      //id: planId,
      //forceApi: forceApi);
    }

    return plasticCache.getItem(plasticId);
  }

  Future<ObservableList> fetchAllPlastics({
    required String probiusId,
    bool forceApi = false,
  }) async {
    () async {
      if (probiusId.isEmpty ||
          isTimeCachedThrottled(king, timeAllPlasticsCached)) {
        return;
      }

      timeAllPlasticsCached = nowStamp();

      ApiResponse ares = await king.lip.api(
        EndpointsV2.probiusPlasticsGetAllByProbiusId,
        payload: {'ProbiusId': probiusId},
      );

      if (ares.isOk) {
        plasticCache.setItemsFromKV(ares);
      } else {
        king.plog.wtf('Failed plastics request');
      }

      allPlastics.clear();
      var allPlasticsTemp = plasticCache.copyValues();
      allPlastics.addAll(allPlasticsTemp);

      nonDefaultPlastics.clear();
      for (var plastic in allPlasticsTemp) {
        if (plastic.isDefault) {
          defaultPlasticId = plastic.plasticId;
        } else {
          nonDefaultPlastics.add(plastic);
        }
      }
    }();

    return allPlastics;
  }

  Plastic get defaultPlastic {
    return plasticCache.getItem(defaultPlasticId);
  }

  static PlasticProxy of(BuildContext context) {
    return King.of(context).lad.plasticProxy;
  }
}

class Plastic = PlasticBase with _$Plastic;

abstract class PlasticBase with Store {
  @observable
  String plasticId = '';
  @observable
  String brand = '';
  @observable
  String country = '';
  @observable
  int expMonth = 0;
  @observable
  int expYear = 0;
  @observable
  bool isDefault = false;
  @observable
  String last4 = '';

  bool isLoaded = false;

  static Plastic unpackById(Map<String, dynamic> body, Plastic tt) {
    tt.plasticId = readString(body, 'PlasticId');
    tt.brand = readString(body, 'Brand');
    tt.country = readString(body, 'Country');
    tt.expMonth = readInt(body, 'ExpMonth');
    tt.expYear = readInt(body, 'ExpYear');
    tt.isDefault = readBool(body, 'IsDefault');
    tt.last4 = readString(body, 'Last4');

    tt.isLoaded = true;
    return tt;
  }

  static copier(Plastic dest, Plastic alt) {
    dest.loadFromAltPlastic(alt);
  }

  void loadFromAltPlastic(Plastic alt) {
    plasticId = alt.plasticId;
    brand = alt.brand;
    country = alt.country;
    expMonth = alt.expMonth;
    expYear = alt.expYear;
    isDefault = alt.isDefault;
    last4 = alt.last4;
    isLoaded = true;
  }

  String get brandDisplay {
    return intl.toBeginningOfSentenceCase(brand) ?? brand;
  }

  String get brandImageSrc {
    switch (brand) {
      case 'amex':
        return 'assets/based/amex_72.png';
      case 'cartes_bancaires':
        return 'assets/based/cartes_bancaires_72.png';
      case 'diners_club':
        return 'assets/based/diners_club_72.png';
      case 'discover':
        return 'assets/based/discover_72.png';
      case 'jcb':
        return 'assets/based/jcb_72.png';
      case 'mastercard':
        return 'assets/based/mastercard_72.png';
      case 'unionpay':
        return 'assets/based/unionpay_72.png';
      case 'visa':
        return 'assets/based/visa_72.png';
      default:
        return 'assets/based/loading.webp';
    }
  }

  Image get brandImage {
    return Image.asset(brandImageSrc, package: 'tui_lib');
  }

  String get expDate {
    return '${expMonth.pad02}/${expYear.pad02}';
  }
}
