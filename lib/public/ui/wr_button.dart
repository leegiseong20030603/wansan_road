import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WR_Button extends StatelessWidget {
  Decoration? decoration;
  EdgeInsets? margin, padding;
  Widget child;
  Alignment? alignment;
  Function() onPressed;
  double? height, width;

  WR_Button({
    required this.child,
    required this.onPressed,
    this.decoration,
    this.margin,
    this.padding,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 60,
        width: width ?? double.infinity,
        alignment: alignment ?? Alignment.center,
        margin: margin,
        decoration: decoration ?? BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white
        ),
        child: child,
      ),
    );
  }
}
