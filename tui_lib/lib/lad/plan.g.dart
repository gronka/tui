// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Plan on PlanBase, Store {
  Computed<bool>? _$isSmallComputed;

  @override
  bool get isSmall => (_$isSmallComputed ??=
          Computed<bool>(() => super.isSmall, name: 'PlanBase.isSmall'))
      .value;
  Computed<String>? _$priceForDisplaySentenceComputed;

  @override
  String get priceForDisplaySentence => (_$priceForDisplaySentenceComputed ??=
          Computed<String>(() => super.priceForDisplaySentence,
              name: 'PlanBase.priceForDisplaySentence'))
      .value;
  Computed<String>? _$priceAsUsdStringComputed;

  @override
  String get priceAsUsdString => (_$priceAsUsdStringComputed ??=
          Computed<String>(() => super.priceAsUsdString,
              name: 'PlanBase.priceAsUsdString'))
      .value;
  Computed<String>? _$priceForDisplayTableComputed;

  @override
  String get priceForDisplayTable => (_$priceForDisplayTableComputed ??=
          Computed<String>(() => super.priceForDisplayTable,
              name: 'PlanBase.priceForDisplayTable'))
      .value;
  Computed<IconData>? _$iconComputed;

  @override
  IconData get icon => (_$iconComputed ??=
          Computed<IconData>(() => super.icon, name: 'PlanBase.icon'))
      .value;
  Computed<String>? _$subscriptionPriceTextComputed;

  @override
  String get subscriptionPriceText => (_$subscriptionPriceTextComputed ??=
          Computed<String>(() => super.subscriptionPriceText,
              name: 'PlanBase.subscriptionPriceText'))
      .value;
  Computed<String>? _$tokenPriceTextComputed;

  @override
  String get tokenPriceText =>
      (_$tokenPriceTextComputed ??= Computed<String>(() => super.tokenPriceText,
              name: 'PlanBase.tokenPriceText'))
          .value;

  late final _$planIdAtom = Atom(name: 'PlanBase.planId', context: context);

  @override
  String get planId {
    _$planIdAtom.reportRead();
    return super.planId;
  }

  @override
  set planId(String value) {
    if (super.planId != value) {
      _$planIdAtom.reportWrite(value, super.planId, () {
        super.planId = value;
      });
    }
  }

  late final _$sortIdAtom = Atom(name: 'PlanBase.sortId', context: context);

  @override
  int get sortId {
    _$sortIdAtom.reportRead();
    return super.sortId;
  }

  @override
  set sortId(int value) {
    if (super.sortId != value) {
      _$sortIdAtom.reportWrite(value, super.sortId, () {
        super.sortId = value;
      });
    }
  }

  late final _$bundledTokensAtom =
      Atom(name: 'PlanBase.bundledTokens', context: context);

  @override
  int get bundledTokens {
    _$bundledTokensAtom.reportRead();
    return super.bundledTokens;
  }

  @override
  set bundledTokens(int value) {
    if (super.bundledTokens != value) {
      _$bundledTokensAtom.reportWrite(value, super.bundledTokens, () {
        super.bundledTokens = value;
      });
    }
  }

  late final _$monthsAtom = Atom(name: 'PlanBase.months', context: context);

  @override
  int get months {
    _$monthsAtom.reportRead();
    return super.months;
  }

  @override
  set months(int value) {
    if (super.months != value) {
      _$monthsAtom.reportWrite(value, super.months, () {
        super.months = value;
      });
    }
  }

  late final _$priceAtom = Atom(name: 'PlanBase.price', context: context);

  @override
  int get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(int value) {
    if (super.price != value) {
      _$priceAtom.reportWrite(value, super.price, () {
        super.price = value;
      });
    }
  }

  late final _$priceCurrencyAtom =
      Atom(name: 'PlanBase.priceCurrency', context: context);

  @override
  String get priceCurrency {
    _$priceCurrencyAtom.reportRead();
    return super.priceCurrency;
  }

  @override
  set priceCurrency(String value) {
    if (super.priceCurrency != value) {
      _$priceCurrencyAtom.reportWrite(value, super.priceCurrency, () {
        super.priceCurrency = value;
      });
    }
  }

  late final _$adminNotesAtom =
      Atom(name: 'PlanBase.adminNotes', context: context);

  @override
  String get adminNotes {
    _$adminNotesAtom.reportRead();
    return super.adminNotes;
  }

  @override
  set adminNotes(String value) {
    if (super.adminNotes != value) {
      _$adminNotesAtom.reportWrite(value, super.adminNotes, () {
        super.adminNotes = value;
      });
    }
  }

  late final _$descriptionAtom =
      Atom(name: 'PlanBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    if (super.description != value) {
      _$descriptionAtom.reportWrite(value, super.description, () {
        super.description = value;
      });
    }
  }

  late final _$isAvailableAtom =
      Atom(name: 'PlanBase.isAvailable', context: context);

  @override
  bool get isAvailable {
    _$isAvailableAtom.reportRead();
    return super.isAvailable;
  }

  @override
  set isAvailable(bool value) {
    if (super.isAvailable != value) {
      _$isAvailableAtom.reportWrite(value, super.isAvailable, () {
        super.isAvailable = value;
      });
    }
  }

  late final _$isTailoredAtom =
      Atom(name: 'PlanBase.isTailored', context: context);

  @override
  bool get isTailored {
    _$isTailoredAtom.reportRead();
    return super.isTailored;
  }

  @override
  set isTailored(bool value) {
    if (super.isTailored != value) {
      _$isTailoredAtom.reportWrite(value, super.isTailored, () {
        super.isTailored = value;
      });
    }
  }

  late final _$rulesAtom = Atom(name: 'PlanBase.rules', context: context);

  @override
  String get rules {
    _$rulesAtom.reportRead();
    return super.rules;
  }

  @override
  set rules(String value) {
    if (super.rules != value) {
      _$rulesAtom.reportWrite(value, super.rules, () {
        super.rules = value;
      });
    }
  }

  late final _$titleAtom = Atom(name: 'PlanBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    if (super.title != value) {
      _$titleAtom.reportWrite(value, super.title, () {
        super.title = value;
      });
    }
  }

  @override
  String toString() {
    return '''
planId: ${planId},
sortId: ${sortId},
bundledTokens: ${bundledTokens},
months: ${months},
price: ${price},
priceCurrency: ${priceCurrency},
adminNotes: ${adminNotes},
description: ${description},
isAvailable: ${isAvailable},
isTailored: ${isTailored},
rules: ${rules},
title: ${title},
isSmall: ${isSmall},
priceForDisplaySentence: ${priceForDisplaySentence},
priceAsUsdString: ${priceAsUsdString},
priceForDisplayTable: ${priceForDisplayTable},
icon: ${icon},
subscriptionPriceText: ${subscriptionPriceText},
tokenPriceText: ${tokenPriceText}
    ''';
  }
}
