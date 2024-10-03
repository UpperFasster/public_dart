import 'package:flutter/material.dart';

class QuantityAdjustButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor;
  final Color color;
  final BorderRadius borderRadius;
  static const double iconSize = 18;

  const QuantityAdjustButton(
    this.icon, {
    super.key,
    required this.onTap,
    this.iconColor = Colors.black,
    this.color = Colors.grey,
    BorderRadius? borderRadius,
  }) : borderRadius =
            borderRadius ?? const BorderRadius.all(Radius.circular(5));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
          ),
          child: Center(
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
