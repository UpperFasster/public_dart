import 'package:flutter/material.dart';

class TextLabelUi extends StatelessWidget {
  final double paddingSize;
  final String text;
  final TextStyle? style;
  final EdgeInsets? margin;
  static const double fontSize = 25;

  const TextLabelUi(
    this.text, {
    super.key,
    this.paddingSize = 10,
    this.style,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(horizontal: paddingSize),
      child: Align(
        alignment: Alignment.centerLeft,
        child: IntrinsicHeight(
          child: Text(
            text,
            style: style ?? theme.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
