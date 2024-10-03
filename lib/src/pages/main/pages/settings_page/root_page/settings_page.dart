import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_court/core/services/services.dart';
import 'package:provider/provider.dart';

import '../ui/ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SettingsParameterCardUi(
                "Темная тема",
                onTap: () {
                  context.read<ThemeService>().toggleTheme();
                },
              ),
              const SizedBox(height: 14),
              SettingsParameterCardUi(
                "Подсказки",
                onTap: () {},
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              context.read<UserStateService>().logoutUser();
              final d = context.read<UserStateService>().user;
              log('User is null? ${d == null ? 'yes' : 'no'}');
            },
            child: Text(
              'Logout',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: Colors.red[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
