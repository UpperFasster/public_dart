import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:food_court/core/services/services.dart';
import 'package:provider/provider.dart';

class MainApplicationPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainApplicationPage({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDark = context.watch<ThemeService>().isDark;

    if (isDark) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: theme.colorScheme.onPrimary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: theme.colorScheme.surface,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ));
    }

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: SafeArea(
        child: navigationShell,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _onTap(context, index);
        },
        currentIndex: navigationShell.currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.home_24_regular),
            activeIcon: Icon(FluentIcons.home_24_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.cart_24_regular),
            activeIcon: Icon(FluentIcons.cart_24_filled),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.settings_24_regular),
            activeIcon: Icon(FluentIcons.settings_24_filled),
            label: 'Settings',
          ),
        ],
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
