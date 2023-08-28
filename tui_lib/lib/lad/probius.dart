import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'probius.g.dart';

class ProbiusProxy {
  ProbiusProxy({
    required this.probiusCache,
    required this.king,
  });
  final Cache<Probius> probiusCache;
  final King king;

  Probius getById(
    String probiusId, {
    bool disableApi = false,
    bool forceApi = false,
  }) {
    if (!disableApi) {
      probiusCache.apiGetById(
          url: EndpointsV2.probiusGetById,
          idName: 'ProbiusId',
          id: probiusId,
          forceApi: forceApi);
    }

    return probiusCache.getItem(probiusId);
  }

  loadByProjectId(
    String projectId, {
    bool disableApi = false,
    bool forceApi = false,
  }) async {
    if (projectId == '') {
      return;
    }

    if (!disableApi) {
      ApiResponse ares = await king.lip.api(
        EndpointsV2.probiusGetByProjectId,
        payload: {'ProjectId': projectId},
      );

      var probius = ProbiusBase.unpackById(ares.body, Probius());
      probiusCache.setItemFromT(probius.probiusId, probius);
    }
  }

  static ProbiusProxy of(BuildContext context) {
    return King.of(context).lad.probiusProxy;
  }
}

class Probius = ProbiusBase with _$Probius;

abstract class ProbiusBase with Store {
  @observable
  String probiusId = '';
  @observable
  String creatorId = '';
  @observable
  String defaultPlasticId = '';
  @observable
  String projectId = '';
  @observable
  String stripeCustomerId = '';

  @observable
  int credit = 0;
  @observable
  int debt = 0;
  @observable
  int firstPeriod = 0;
  @observable
  bool isAutopayEnabled = false;
  @observable
  bool isBillOverdue = false;
  @observable
  bool isClosed = false;
  @observable
  bool isInArrears = false;
  @observable
  String notes = '';
  @observable
  int timeLastBillIssued = 0;
  @observable
  int timeLastPaidOff = 0;
  @observable
  int timeCreated = 0;
  @observable
  int tokensBought = 0;
  @observable
  int tokensUsed = 0;

  bool isLoaded = false;

  int getMaxCredit(int price) {
    if (price > credit) {
      return credit;
    } else {
      return price;
    }
  }

  static Probius unpackById(Map<String, dynamic> body, Probius tt) {
    tt.probiusId = readString(body, 'ProbiusId');
    tt.creatorId = readString(body, 'CreatorId');
    tt.projectId = readString(body, 'ProjectId');
    tt.defaultPlasticId = readString(body, 'DefaultPlasticId');
    tt.stripeCustomerId = readString(body, 'StripeCustomerId');

    tt.credit = readInt(body, 'Credit');
    tt.debt = readInt(body, 'Debt');
    tt.isAutopayEnabled = readBool(body, 'IsAutopayEnabled');
    tt.firstPeriod = readInt(body, 'FirstPeriod');
    tt.isClosed = readBool(body, 'IsClosed');
    tt.isBillOverdue = readBool(body, 'IsBillOverdue');
    tt.isInArrears = readBool(body, 'IsInArrears');
    tt.notes = readString(body, 'Notes');
    tt.timeLastBillIssued = readInt(body, 'TimeLastBillIssued');
    tt.timeLastPaidOff = readInt(body, 'TimeLastPaidOff');
    tt.timeCreated = readInt(body, 'TimeCreated');
    tt.tokensBought = readInt(body, 'TokensBought');
    tt.tokensUsed = readInt(body, 'TokensUsed');

    tt.isLoaded = true;
    return tt;
  }

  static copier(Probius dest, Probius alt) {
    dest.loadFromAltProbius(alt);
  }

  @action
  void loadFromAltProbius(Probius alt) {
    probiusId = alt.probiusId;
    creatorId = alt.creatorId;
    defaultPlasticId = alt.defaultPlasticId;
    projectId = alt.projectId;
    stripeCustomerId = alt.stripeCustomerId;

    credit = alt.credit;
    debt = alt.debt;
    isAutopayEnabled = alt.isAutopayEnabled;
    firstPeriod = alt.firstPeriod;
    isBillOverdue = alt.isBillOverdue;
    isClosed = alt.isClosed;
    isInArrears = alt.isInArrears;
    notes = alt.notes;
    timeLastBillIssued = alt.timeLastBillIssued;
    timeLastPaidOff = alt.timeLastPaidOff;
    timeCreated = alt.timeCreated;
    tokensBought = alt.tokensBought;
    tokensUsed = alt.tokensUsed;

    isLoaded = true;
  }

  @computed
  String get firstBillingPeriodAsString {
    return DateFormat('y-m')
        .format(DateTime.fromMillisecondsSinceEpoch(timeCreated * 1000));
  }

  @computed
  int get firstBillingMonth {
    return DateTime.fromMillisecondsSinceEpoch(timeCreated * 1000).month;
  }

  @computed
  int get firstBillingYear {
    final year = DateTime.fromMillisecondsSinceEpoch(timeCreated * 1000).year;
    return year >= 2020 ? year : 2020;
    //return DateTime.fromMillisecondsSinceEpoch(timeCreated * 1000).year;
  }

  @computed
  String get isAutopayEnabledString {
    return isAutopayEnabled ? 'Enabled' : 'Disabled';
  }

  @computed
  int get tokensRemaining {
    return tokensBought - tokensUsed;
  }
}
