// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BasketItem on BasketItemBase, Store {
  Computed<Map<String, dynamic>>? _$asJsonComputed;

  @override
  Map<String, dynamic> get asJson =>
      (_$asJsonComputed ??= Computed<Map<String, dynamic>>(() => super.asJson,
              name: 'BasketItemBase.asJson'))
          .value;

  late final _$adminNotesAtom =
      Atom(name: 'BasketItemBase.adminNotes', context: context);

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

  late final _$itemIdAtom =
      Atom(name: 'BasketItemBase.itemId', context: context);

  @override
  String get itemId {
    _$itemIdAtom.reportRead();
    return super.itemId;
  }

  @override
  set itemId(String value) {
    if (super.itemId != value) {
      _$itemIdAtom.reportWrite(value, super.itemId, () {
        super.itemId = value;
      });
    }
  }

  late final _$itemTypeAtom =
      Atom(name: 'BasketItemBase.itemType', context: context);

  @override
  BasketItemType get itemType {
    _$itemTypeAtom.reportRead();
    return super.itemType;
  }

  @override
  set itemType(BasketItemType value) {
    if (super.itemType != value) {
      _$itemTypeAtom.reportWrite(value, super.itemType, () {
        super.itemType = value;
      });
    }
  }

  late final _$nameAtom = Atom(name: 'BasketItemBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    if (super.name != value) {
      _$nameAtom.reportWrite(value, super.name, () {
        super.name = value;
      });
    }
  }

  late final _$priceAtom = Atom(name: 'BasketItemBase.price', context: context);

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

  late final _$BasketItemBaseActionController =
      ActionController(name: 'BasketItemBase', context: context);

  @override
  dynamic setPriceWithDouble(double priceAsDouble) {
    final _$actionInfo = _$BasketItemBaseActionController.startAction(
        name: 'BasketItemBase.setPriceWithDouble');
    try {
      return super.setPriceWithDouble(priceAsDouble);
    } finally {
      _$BasketItemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
adminNotes: ${adminNotes},
itemId: ${itemId},
itemType: ${itemType},
name: ${name},
price: ${price},
asJson: ${asJson}
    ''';
  }
}
