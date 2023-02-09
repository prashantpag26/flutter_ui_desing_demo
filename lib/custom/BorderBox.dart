import 'package:flutter/material.dart';
import 'package:flutter_ui_desing_demo/utils/constants.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double width, height;

  const BorderBox(this.width, this.height,
      {super.key,
      this.padding = const EdgeInsets.all(8.0),
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: COLOR_WHITE,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2)),
      padding: padding,
      child: Center(
        child: child,
      ),
    );
  }
}
