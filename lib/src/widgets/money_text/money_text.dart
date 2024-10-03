import 'package:flutter/material.dart';
import 'package:food_court/core/utils/utils.dart';

class MoneyText extends StatelessWidget {
  final double money;
  final TextStyle? moneyTextStyle;
  final String? currency;
  final TextStyle? currencyTextStyle;
  final Color? textColor;

  const MoneyText(
    this.money, {
    super.key,
    this.moneyTextStyle,
    this.currency,
    this.currencyTextStyle,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Util.formatMoney(money),
          style: moneyTextStyle ??
              theme.textTheme.labelLarge!.copyWith(
                color: textColor ?? theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w900,
              ),
        ),
        Text(
          currency ?? ' сом',
          style: currencyTextStyle ??
              theme.textTheme.labelLarge!.copyWith(
                color: textColor ?? theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w900,
              ),
        ),
      ],
    );
  }
}
