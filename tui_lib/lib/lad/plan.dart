import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'plan.g.dart';

//enum PlanTypes { free, small, medium, large, contact }

class PlanProxy {
  PlanProxy({
    required this.planCache,
    required this.king,
  });
  final Cache<Plan> planCache;
  final King king;
  final ObservableList allPlans = ObservableList();
  final ObservableList selectablePlans = ObservableList();

  ObservableList getAllPlans({
    bool forceApi = false,
    bool filterSelectable = false,
  }) {
    () async {
      await planCache.apiGetByIdsAsList(
          url: EndpointsV2.plansGetAll,
          idsName: '',
          ids: [],
          forceApi: forceApi);

      allPlans.clear();
      var allPlansTemp = planCache.copyValues();
      allPlansTemp.sort((a, b) => a.sortId.compareTo(b.sortId));
      allPlans.addAll(allPlansTemp);

      selectablePlans.clear();
      for (var plan in allPlansTemp) {
        if (plan.isAvailable) {
          selectablePlans.add(plan);
        }
      }
    };

    if (filterSelectable) {
      return selectablePlans;
    } else {
      return allPlans;
    }
  }

  Plan getById(
    String planId, {
    bool disableApi = false,
    bool forceApi = false,
  }) {
    if (!disableApi) {
      planCache.apiGetById(
          url: EndpointsV2.planGetById,
          idName: 'PlanId',
          id: planId,
          forceApi: forceApi);
    }

    return planCache.getItem(planId);
  }

  static PlanProxy of(BuildContext context) {
    return King.of(context).lad.planProxy;
  }
}

class Plan = PlanBase with _$Plan;

abstract class PlanBase with Store {
  @observable
  String planId = '';
  @observable
  int sortId = 0;

  @observable
  int bundledTokens = 0;
  @observable
  int months = 12;
  @observable
  int price = 0;
  @observable
  String priceCurrency = 'USD';

  @observable
  String adminNotes = '';
  @observable
  String description = '';
  @observable
  bool isAvailable = false;
  @observable
  bool isTailored = false;
  @observable
  String rules = '';
  @observable
  String title = '';

  bool isLoaded = false;

  static Plan unpackById(Map<String, dynamic> body, Plan tt) {
    String s = readString(body, 'PlanId');
    s != tt.planId ? tt.planId = s : null;
    int i = readInt(body, 'SortId');
    i != tt.sortId ? tt.sortId = i : null;

    i = readInt(body, 'BundledTokens');
    i != tt.bundledTokens ? tt.bundledTokens = i : null;
    i = readInt(body, 'Months');
    i != tt.months ? tt.months = i : null;
    i = readInt(body, 'Price');
    i != tt.price ? tt.price = i : null;
    s = readString(body, 'PriceCurrency');
    s != tt.priceCurrency ? tt.priceCurrency = s : null;

    s = readString(body, 'AdminNotes');
    s != tt.adminNotes ? tt.adminNotes = s : null;
    s = readString(body, 'Description');
    s != tt.description ? tt.description = s : null;
    var b = readBool(body, 'IsAvailable');
    b != tt.isAvailable ? tt.isAvailable = b : null;
    b = readBool(body, 'IsTailored');
    b != tt.isTailored ? tt.isTailored = b : null;
    s = readString(body, 'Rules');
    s != tt.rules ? tt.rules = s : null;
    s = readString(body, 'Title');
    s != tt.title ? tt.title = s : null;

    tt.isLoaded = true;
    return tt;
  }

  static copier(Plan dest, Plan alt) {
    dest.loadFromAltPlan(alt);
  }

  void loadFromAltPlan(Plan alt) {
    planId = alt.planId;
    sortId = alt.sortId;
    bundledTokens = alt.bundledTokens;
    months = alt.months;
    price = alt.price;
    priceCurrency = alt.priceCurrency;

    adminNotes = alt.adminNotes;
    description = alt.description;
    isAvailable = alt.isAvailable;
    isTailored = alt.isTailored;
    rules = alt.rules;
    title = alt.title;

    isLoaded = true;
  }

  @computed
  bool get isSmall {
    return planId == 'small';
  }

  @computed
  String get priceForDisplaySentence {
    if (price == 0) {
      return 'The plan you have selected is free.';
    }
    return 'The plan you have selected will cost \$$priceAsUsdString every $months months.';
  }

  @computed
  String get priceAsUsdString {
    return (price / 100).toStringAsFixed(2);
  }

  @computed
  String get priceForDisplayTable {
    if (price == 0) {
      return 'Free';
    }
    String per = '';
    if (months == 12) {
      per = 'year';
    } else {
      throw Exception('Unknown period of months');
    }
    return '\$$priceAsUsdString / $per';
  }

  @computed
  IconData get icon {
    switch (planId) {
      case 'free':
        return Icons.web_asset_off;
      case 'small':
        return Icons.man;
      case 'medium':
        return Icons.maps_home_work;
      case 'large':
        return Icons.location_city;
      case 'contact':
        return Icons.engineering;
      default:
        return Icons.album;
    }
  }

  @computed
  String get subscriptionPriceText {
    switch (planId) {
      case 'free':
        return '';
      case 'small':
        return '\$105 for 3 years';
      case 'medium':
        return '\$50 annually';
      case 'large':
        return '\$1000 annually';
      case 'contact':
        return 'Negotiated';
      default:
        return '';
    }
  }

  @computed
  String get tokenPriceText {
    switch (planId) {
      case 'free':
        return '';
      case 'small':
        return 'Cannot purchase more comparables & challenges';
      case 'medium':
        return '\$10 per comparables & challenges';
      case 'large':
        return 'Unlimited comparables & challenges';
      case 'contact':
        return '';
      default:
        return '';
    }
  }
}
