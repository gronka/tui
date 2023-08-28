import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:tui_lib/tui_lib.dart';

class SelectPeriod extends StatefulWidget {
  const SelectPeriod({required this.data, this.onChange});
  final SelectPeriodData data;
  final Function? onChange;

  @override
  SelectPeriodState createState() => SelectPeriodState();
}

class SelectPeriodState extends State<SelectPeriod> {
  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Observer(builder: (_) {
          final length = data.yearOptions.length;

          return GridView.count(
            shrinkWrap: true,
            childAspectRatio: 1.9,
            crossAxisCount: 6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(length, (index) {
              final showYear = data.yearOptions[index];

              return ButtonCard(
                  isSelected: data.selectedYear == showYear,
                  text: showYear.toString(),
                  onTap: () {
                    data.selectedYear = showYear;
                    widget.onChange!();
                  });
            }),
          );
        }),
        //
        const SizedBox(height: 10),

        Observer(builder: (_) {
          final length = data.monthOptions.length;
          return data.selectedYear == 0
              ? const SizedBox.shrink()
              : GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: 1.9,
                  crossAxisCount: 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(length, (index) {
                    final showMonth = data.monthOptions[index];

                    DateTime monthDate = DateTime(1970, showMonth);

                    return ButtonCard(
                        isSelected: data.selectedMonth == showMonth,
                        text: DateFormat.MMMM().format(monthDate),
                        onTap: () {
                          data.selectedMonth = showMonth;
                          widget.onChange!();
                        });
                  }),
                );
        }),
      ],
    );
  }
}

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    this.isDisabled = false,
    required this.isSelected,
    required this.onTap,
    required this.text,
  });
  final bool isDisabled;
  final bool isSelected;
  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(color: Colors.grey);
    if (isSelected) {
      style = const TextStyle(color: Colors.green);
    }

    if (isDisabled) {
      style = const TextStyle(color: Colors.red, fontStyle: FontStyle.italic);
    }

    return Card(
      elevation: 1,
      child: InkWell(
        onTap: isSelected || isDisabled
            ? null
            : () {
                onTap();
              },
        child: Center(
          child: Text18(text, style: style),
        ),
      ),
    );
  }
}
