import 'package:flutter/material.dart';

import 'package:tui_lib/tui_lib.dart';

class ColorBlock extends StatelessWidget {
  const ColorBlock({
    this.colorString = '',
    this.color,
    this.height = 30,
    this.width = 50,
  });
  final String colorString;
  final Color? color;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    Color showColor = color ?? colorFromString(colorString);
    return Container(
      height: height,
      width: width,
      color: showColor,
    );
  }
}
