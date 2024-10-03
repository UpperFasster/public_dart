import 'package:flutter/material.dart';

import '../widgets.dart';

class MoneyWhiteWidget extends StatelessWidget {
  final double money;
  final TextStyle? moneyTextStyle;
  final String? currency;
  final TextStyle? currencyTextStyle;
  final double height;
  final double minWidth;
  final double maxWidth;
  final BorderRadius borderRadius;
  final Color? bgColor;
  final Color? textColor;
  final List<BoxShadow>? boxShadow;

  const MoneyWhiteWidget(
    this.money, {
    super.key,
    this.moneyTextStyle,
    this.currency,
    this.currencyTextStyle,
    this.minWidth = 90,
    this.maxWidth = double.infinity,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.bgColor,
    this.textColor,
    this.height = 32,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height,
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: bgColor ?? theme.colorScheme.primary,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      alignment: Alignment.center,
      child: MoneyText(
        money,
        textColor: textColor,
      ),
    );
  }
}
