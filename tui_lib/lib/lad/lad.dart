import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:tui_lib/consts/endpoints.dart';
import 'package:tui_lib/king.dart';

import 'package:tui_lib/lad/bill.dart';
import 'package:tui_lib/lad/cache.dart';
import 'package:tui_lib/lad/challenge.dart';
import 'package:tui_lib/lad/charge.dart';
import 'package:tui_lib/lad/comparable.dart';
import 'package:tui_lib/lad/payment.dart';
import 'package:tui_lib/lad/place_predictions.dart';
import 'package:tui_lib/lad/plan.dart';
import 'package:tui_lib/lad/plastic.dart';
import 'package:tui_lib/lad/probius.dart';
import 'package:tui_lib/lad/project.dart';
import 'package:tui_lib/lad/property.dart';
import 'package:tui_lib/lad/surfer.dart';

export 'package:tui_lib/lad/bill.dart';
export 'package:tui_lib/lad/challenge.dart';
export 'package:tui_lib/lad/charge.dart';
export 'package:tui_lib/lad/comparable.dart';
export 'package:tui_lib/lad/payment.dart';
export 'package:tui_lib/lad/place_predictions.dart';
export 'package:tui_lib/lad/plan.dart';
export 'package:tui_lib/lad/plastic.dart';
export 'package:tui_lib/lad/probius.dart';
export 'package:tui_lib/lad/project.dart';
export 'package:tui_lib/lad/property.dart';
export 'package:tui_lib/lad/request_change.dart';
export 'package:tui_lib/lad/surfer.dart';

class Lad {
  final King king;

  late final Cache<Bill> billCache;
  late final Cache<Challenge> challengeCache;
  late final Cache<Charge> chargeCache;
  late final Cache<Comparable> comparableCache;
  late final Cache<Payment> paymentCache;
  late final Cache<Plan> planCache;
  late final Cache<Plastic> plasticCache;
  late final Cache<Probius> probiusCache;
  late final Cache<Project> projectCache;
  late final Cache<Property> propertyCache;
  late final Cache<Surfer> surferCache;

  late final BillProxy billProxy;
  late final ChallengeProxy challengeProxy;
  late final ChargeProxy chargeProxy;
  late final ComparableProxy comparableProxy;
  late final PaymentProxy paymentProxy;
  late final PlanProxy planProxy;
  late final PlasticProxy plasticProxy;
  late final ProbiusProxy probiusProxy;
  late final ProjectProxy projectProxy;
  late final PropertyProxy propertyProxy;
  late final SurferProxy surferProxy;

  late final IdListCache billIdListByProbiusIdCache;
  late final IdListCache challengeIdListBySurferIdCache;
  late final IdListCache chargeIdListByBillIdCache;
  late final IdListCache paymentIdListByProbiusIdCache;
  late final IdListCache propertyIdListBySurferIdCache;

  late Cache<ObservableList<PlacePrediction>> _placePredictionsCache;
  late PlacePredictionsProxy placePredictionsProxy;

  Lad(this.king) {
    this._placePredictionsCache = Cache<ObservableList<PlacePrediction>>(
      king,
      creator: ObservableList.new,
    );

    billCache = Cache<Bill>(
      king,
      creator: Bill.new,
      copier: BillBase.copier,
      unpackById: BillBase.unpackById,
    );

    challengeCache = Cache<Challenge>(
      king,
      creator: Challenge.new,
      copier: ChallengeBase.copier,
      unpackById: ChallengeBase.unpackById,
    );

    chargeCache = Cache<Charge>(
      king,
      creator: Charge.new,
      copier: ChargeBase.copier,
      unpackById: ChargeBase.unpackById,
    );

    comparableCache = Cache<Comparable>(
      king,
      creator: Comparable.new,
      copier: ComparableBase.copier,
      unpackById: ComparableBase.unpackById,
    );

    paymentCache = Cache<Payment>(
      king,
      creator: Payment.new,
      copier: PaymentBase.copier,
      unpackById: PaymentBase.unpackById,
    );

    planCache = Cache<Plan>(
      king,
      creator: Plan.new,
      copier: PlanBase.copier,
      unpackById: PlanBase.unpackById,
    );

    plasticCache = Cache<Plastic>(
      king,
      creator: Plastic.new,
      copier: PlasticBase.copier,
      unpackById: PlasticBase.unpackById,
    );

    probiusCache = Cache<Probius>(
      king,
      creator: Probius.new,
      copier: ProbiusBase.copier,
      unpackById: ProbiusBase.unpackById,
    );

    projectCache = Cache<Project>(
      king,
      creator: Project.new,
      copier: ProjectBase.copier,
      unpackById: ProjectBase.unpackById,
    );

    propertyCache = Cache<Property>(
      king,
      creator: Property.new,
      copier: PropertyBase.copier,
      unpackById: PropertyBase.unpackById,
    );

    surferCache = Cache<Surfer>(
      king,
      creator: Surfer.new,
      copier: SurferBase.copier,
      unpackById: SurferBase.unpackById,
    );

    billProxy = BillProxy(billCache: billCache, king: king);
    challengeProxy = ChallengeProxy(challengeCache: challengeCache, king: king);
    comparableProxy =
        ComparableProxy(comparableCache: comparableCache, king: king);
    paymentProxy = PaymentProxy(paymentCache: paymentCache, king: king);
    planProxy = PlanProxy(planCache: planCache, king: king);
    placePredictionsProxy = PlacePredictionsProxy(
        placePredictionsCache: this._placePredictionsCache);
    plasticProxy = PlasticProxy(plasticCache: plasticCache, king: king);
    probiusProxy = ProbiusProxy(probiusCache: probiusCache, king: king);
    projectProxy = ProjectProxy(projectCache: projectCache, king: king);
    propertyProxy = PropertyProxy(propertyCache: propertyCache, king: king);
    surferProxy = SurferProxy(surferCache: surferCache, king: king);

    billIdListByProbiusIdCache = IdListCache(
      king,
      EndpointsV2.billsGetByProbiusId,
      'ProbiusId',
    );

    paymentIdListByProbiusIdCache = IdListCache(
      king,
      EndpointsV2.paymentsGetByProbiusId,
      'ProbiusId',
    );

    challengeIdListBySurferIdCache = IdListCache(
      king,
      EndpointsV2.challengesGetBySurferId,
      'SurferId',
    );

    chargeIdListByBillIdCache = IdListCache(
      king,
      EndpointsV2.chargesGetByBillId,
      'BillId',
    );

    propertyIdListBySurferIdCache = IdListCache(
      king,
      EndpointsV2.propertiesGetBySurferId,
      'SurferId',
    );
  }

  static Lad of(BuildContext context) {
    return King.of(context).lad;
  }
}
