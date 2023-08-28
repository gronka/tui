import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';

import 'package:tui_lib/tui_lib.dart';

part 'select_period_data.g.dart';

class SelectPeriodData = SelectPeriodDataBase with _$SelectPeriodData;

abstract class SelectPeriodDataBase with Store {
  final DateTime now = DateTime.now();
  final int currentYear = DateTime.now().year;
  final int currentMonth = DateTime.now().month;
  Probius probius = Probius();

  @observable
  int selectedMonth = 0;
  @observable
  int selectedYear = 0;

  @computed
  DateTime get selectedDate {
    return DateTime(selectedYear, selectedMonth);
  }

  @computed
  String get printSelectedDate {
    return DateFormat.yMMMM().format(selectedDate);
  }

  @computed
  List<int> get yearOptions {
    List<int> years = [];
    for (int i = probius.firstBillingYear; i <= currentYear; i++) {
      years.add(i);
    }
    return years;
  }

  @computed
  List<int> get monthOptions {
    late final int startMonth;
    late final int endMonth;

    if (selectedYear == probius.firstBillingYear) {
      startMonth = probius.firstBillingMonth;
    } else {
      startMonth = 1;
    }

    if (selectedYear == currentYear) {
      endMonth = currentMonth;
    } else {
      endMonth = 12;
    }

    List<int> months = [];
    for (int i = startMonth; i <= endMonth; i++) {
      months.add(i);
    }
    return months;
  }

  @computed
  bool get isSelectedDateValid {
    if (selectedYear == 0 || selectedMonth == 0) {
      return false;
    }
    return true;
  }
}
