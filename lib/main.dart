import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_court/core/router/router.dart';
import 'package:food_court/core/services/services.dart';
import 'package:food_court/core/theme/theme.dart';
import 'package:food_court/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    _router = AppRouter.routes;
    super.initState();
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getIt.get<LocaleService>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt.get<ThemeService>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt.get<UserStateService>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt.get<ProductsDataService>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            themeMode: context.watch<ThemeService>().themeMode,
            theme: TThemeData.lightTheme(),
            darkTheme: TThemeData.darkTheme(),
            debugShowCheckedModeBanner: false,
            locale: context.watch<LocaleService>().locale,
            supportedLocales: context
                .read<LocaleService>()
                .supportedLanguages
                .map((lang) => Locale(lang)),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routeInformationParser: _router.routeInformationParser,
            routeInformationProvider: _router.routeInformationProvider,
            routerDelegate: _router.routerDelegate,
            backButtonDispatcher: RootBackButtonDispatcher(),
          );
        },
      ),
    );
  }
}
