// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_period_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelectPeriodData on SelectPeriodDataBase, Store {
  Computed<DateTime>? _$selectedDateComputed;

  @override
  DateTime get selectedDate =>
      (_$selectedDateComputed ??= Computed<DateTime>(() => super.selectedDate,
              name: 'SelectPeriodDataBase.selectedDate'))
          .value;
  Computed<String>? _$printSelectedDateComputed;

  @override
  String get printSelectedDate => (_$printSelectedDateComputed ??=
          Computed<String>(() => super.printSelectedDate,
              name: 'SelectPeriodDataBase.printSelectedDate'))
      .value;
  Computed<List<int>>? _$yearOptionsComputed;

  @override
  List<int> get yearOptions =>
      (_$yearOptionsComputed ??= Computed<List<int>>(() => super.yearOptions,
              name: 'SelectPeriodDataBase.yearOptions'))
          .value;
  Computed<List<int>>? _$monthOptionsComputed;

  @override
  List<int> get monthOptions =>
      (_$monthOptionsComputed ??= Computed<List<int>>(() => super.monthOptions,
              name: 'SelectPeriodDataBase.monthOptions'))
          .value;
  Computed<bool>? _$isSelectedDateValidComputed;

  @override
  bool get isSelectedDateValid => (_$isSelectedDateValidComputed ??=
          Computed<bool>(() => super.isSelectedDateValid,
              name: 'SelectPeriodDataBase.isSelectedDateValid'))
      .value;

  late final _$selectedMonthAtom =
      Atom(name: 'SelectPeriodDataBase.selectedMonth', context: context);

  @override
  int get selectedMonth {
    _$selectedMonthAtom.reportRead();
    return super.selectedMonth;
  }

  @override
  set selectedMonth(int value) {
    if (super.selectedMonth != value) {
      _$selectedMonthAtom.reportWrite(value, super.selectedMonth, () {
        super.selectedMonth = value;
      });
    }
  }

  late final _$selectedYearAtom =
      Atom(name: 'SelectPeriodDataBase.selectedYear', context: context);

  @override
  int get selectedYear {
    _$selectedYearAtom.reportRead();
    return super.selectedYear;
  }

  @override
  set selectedYear(int value) {
    if (super.selectedYear != value) {
      _$selectedYearAtom.reportWrite(value, super.selectedYear, () {
        super.selectedYear = value;
      });
    }
  }

  @override
  String toString() {
    return '''
selectedMonth: ${selectedMonth},
selectedYear: ${selectedYear},
selectedDate: ${selectedDate},
printSelectedDate: ${printSelectedDate},
yearOptions: ${yearOptions},
monthOptions: ${monthOptions},
isSelectedDateValid: ${isSelectedDateValid}
    ''';
  }
}
