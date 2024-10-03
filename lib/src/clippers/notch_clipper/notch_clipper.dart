import 'package:flutter/material.dart';

class NotchShapeClipper extends CustomClipper<Path> {
  final double bottomOffset;
  final double topOffset;
  final double notchWiderSpace;
  final double clip;

  NotchShapeClipper({
    super.reclip,
    this.bottomOffset = 0.9,
    this.topOffset = 0.1,
    this.notchWiderSpace = 0.25,
    this.clip = 0.05,
  });

  @override
  Path getClip(Size size) {
    double xWidth = size.width;
    double yHeight = size.height;

    double topOffset = yHeight * this.topOffset;
    double bottomOffset = yHeight * this.bottomOffset;

    double lVal = 0 + notchWiderSpace;
    double rVal = 1 - notchWiderSpace;

    double leftF = xWidth * (lVal + (clip * 0));
    double leftS = xWidth * (lVal + (clip * 1));
    double leftT = xWidth * (lVal + (clip * 2));

    double rightF = xWidth * (rVal - (clip * 0));
    double rightS = xWidth * (rVal - (clip * 1));
    double rightT = xWidth * (rVal - (clip * 2));

    Path path_0 = Path();
    path_0.moveTo(leftF, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, yHeight);
    path_0.cubicTo(0, yHeight, 0, yHeight, leftF, yHeight);
    path_0.cubicTo(leftS, yHeight, leftS, bottomOffset, leftT, bottomOffset);
    path_0.cubicTo(0, bottomOffset, 0, bottomOffset, rightT, bottomOffset);
    path_0.cubicTo(rightS, bottomOffset, rightS, yHeight, rightF, yHeight);
    path_0.lineTo(0, yHeight);
    path_0.cubicTo(0, yHeight, 0, yHeight, xWidth, yHeight);
    path_0.lineTo(xWidth, 0);
    path_0.cubicTo(xWidth, 0, 0, 0, rightF, 0);
    path_0.cubicTo(rightS, 0, rightS, topOffset, rightT, topOffset);
    path_0.lineTo(leftT, topOffset);
    path_0.cubicTo(leftS, topOffset, leftS, 0, leftF, 0);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
