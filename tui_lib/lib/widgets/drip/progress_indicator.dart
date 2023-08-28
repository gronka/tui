import 'package:flutter/material.dart';

class ProgressIndicatorDrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 24,
          width: 24,
          margin: const EdgeInsets.fromLTRB(0, 16, 12, 16),
          child: Theme(
            data: Theme.of(context),
            child: const CircularProgressIndicator(
              backgroundColor: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
