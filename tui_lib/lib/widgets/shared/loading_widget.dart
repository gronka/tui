import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      margin: const EdgeInsets.fromLTRB(0, 16, 12, 16),
      child: const CircularProgressIndicator(
        color: Colors.white,
        backgroundColor: Colors.green,
      ),
    );
  }
}
