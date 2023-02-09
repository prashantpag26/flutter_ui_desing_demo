import 'package:flutter/material.dart';
import 'package:flutter_ui_desing_demo/utils/constants.dart';
import 'package:flutter_ui_desing_demo/utils/widget_functions.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const OptionButton(
      {super.key, required this.text, required this.icon, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: MaterialButton(
          onPressed: () {},
          color: COLOR_DARK_BLUE,
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Row(
            children: [Icon(icon,color: COLOR_WHITE,), addHorizontalSpace(10), Text(text,style: TextStyle(color: COLOR_WHITE),)],
          )),
    );
  }
}
