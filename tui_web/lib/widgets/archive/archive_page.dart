import 'package:flutter/material.dart';

import 'package:tui_lib/tui_lib.dart';

class ArchivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 24),
            Text(
              'Your Tax Challenges',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(),
                2: FixedColumnWidth(64),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                //
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 40,
                      color: Colors.green,
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        height: 40,
                        color: Colors.green,
                        child: const Center(
                          child: Text18('Address'),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      color: Colors.blue,
                      child: const Text('date'),
                    ),
                  ],
                ),

                TableRow(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  children: <Widget>[
                    Container(
                      height: 64,
                      width: 128,
                      color: Colors.purple,
                    ),
                    Container(
                      height: 32,
                      color: Colors.yellow,
                    ),
                    Center(
                      child: Container(
                        height: 32,
                        width: 32,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
