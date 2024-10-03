import 'package:flutter/material.dart';
import 'package:food_court/core/services/services.dart';
import 'package:provider/provider.dart';

class SettingsParameterCardUi extends StatefulWidget {
  final String settingsLabel;
  final VoidCallback? onTap;

  const SettingsParameterCardUi(
    this.settingsLabel, {
    super.key,
    this.onTap,
  });

  @override
  State<SettingsParameterCardUi> createState() =>
      _SettingsParameterCardUiState();
}

class _SettingsParameterCardUiState extends State<SettingsParameterCardUi> {
  bool _toggleValue = false;

  _toggle() {
    setState(() {
      _toggleValue = !_toggleValue;
      if (widget.onTap != null) {
        widget.onTap!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(15);
    final theme = Theme.of(context);
    bool isDark = context.watch<ThemeService>().isDark;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor,
            blurRadius: 13,
            spreadRadius: -10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Material(
        color: isDark
            ? const Color.fromRGBO(50, 50, 50, 1)
            : const Color.fromARGB(255, 200, 200, 200),
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: _toggle,
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.settingsLabel,
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Switch(
                    value: _toggleValue,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) {
                      setState(() {
                        _toggleValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
