import 'package:flutter/material.dart';

import 'package:tui_lib/tui_lib.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    this.abbrev,
    this.colorBackground,
    this.colorText,
    this.fontSize = 20,
    this.saveKey,
    this.height = 80,
    this.width = 80,
  });
  final String? abbrev;
  final Color? colorBackground;
  final Color? colorText;
  final double fontSize;
  final GlobalKey? saveKey;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    String abbrevOut = abbrev ?? '';
    Color colorBackgroundOut = colorBackground ?? Colors.blue;
    Color colorTextOut = colorText ?? Colors.amber;

    return RepaintBoundary(
      key: saveKey ?? GlobalKey(),
      child: SizedBox(
        height: height,
        width: width,
        child: BasedFadeInImage(
          altText: abbrevOut,
          colorBackground: colorBackgroundOut,
          colorText: colorTextOut,
          fontSize: fontSize,
          height: height,
          width: width,
          src: '',
        ),
      ),
    );
  }
}
