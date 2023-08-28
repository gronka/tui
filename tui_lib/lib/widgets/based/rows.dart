import 'package:flutter/material.dart';

import 'package:tui_lib/widgets/based/text.dart';

class SimpleRow extends StatelessWidget {
  const SimpleRow({required this.left, required this.right});
  final String left;
  final String right;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BaText(left),
              BaText(right),
            ]),
      ),
    );
  }
}

class SimpleRow18 extends StatelessWidget {
  const SimpleRow18({required this.left, required this.right});
  final String left;
  final String right;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text18(left),
              Text18(right),
            ]),
      ),
    );
  }
}

class SimpleRow18Selectable extends StatelessWidget {
  const SimpleRow18Selectable({required this.left, required this.right});
  final String left;
  final String right;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text18(left),
              SelectableText(right, style: const TextStyle(fontSize: 18)),
            ]),
      ),
    );
  }
}
