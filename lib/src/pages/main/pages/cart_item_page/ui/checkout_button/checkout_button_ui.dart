import 'package:flutter/material.dart';

class CheckOutButtonUi extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final TextStyle? textStyle;
  final BorderRadius borderRadius;
  final double height;
  const CheckOutButtonUi(
    this.text, {
    super.key,
    required this.onTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(25)),
    this.height = 74,
    this.textStyle,
  });

  @override
  State<CheckOutButtonUi> createState() => _CheckOutButtonUiState();
}

class _CheckOutButtonUiState extends State<CheckOutButtonUi> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color buttonColor = theme.colorScheme.primary;

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          buttonColor = const Color.fromRGBO(40, 40, 40, 1);
        });
      },
      onTapUp: (_) {
        setState(() {
          buttonColor = theme.colorScheme.primary;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          buttonColor = theme.colorScheme.primary;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          color: buttonColor,
        ),
        height: widget.height,
        width: double.infinity,
        child: Center(
          child: Text(
            widget.text,
            style: widget.textStyle ??
                theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimary,
                ),
          ),
        ),
      ),
    );
  }
}
