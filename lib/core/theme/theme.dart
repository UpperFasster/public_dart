import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TThemeData {
  static String _getFontFamily() {
    // return GoogleFonts.ibmPlexSans().fontFamily!;
    // return GoogleFonts.montserrat().fontFamily!;
    // return GoogleFonts.poppins().fontFamily!;
    return GoogleFonts.inter().fontFamily!;
  }

  static Color get darkColor => const Color.fromRGBO(26, 26, 26, 1);
  static Color get lightColor => const Color.fromRGBO(233, 233, 233, 1);

  static FontWeight _getFontWeight() {
    return FontWeight.w500;
  }

  static TextTheme _getTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      displayMedium: TextStyle(
        fontSize: 30,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      displaySmall: TextStyle(
        fontSize: 28,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      headlineLarge: TextStyle(
        fontSize: 26,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      titleMedium: TextStyle(
        fontSize: 21,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        color: textColor,
        fontWeight: _getFontWeight(),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      fontFamily: _getFontFamily(),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: TThemeData.lightColor,
        onPrimary: TThemeData.darkColor,
        secondary: const Color(0xFF1A2A3D),
        onSecondary: Colors.transparent,
        error: Colors.transparent,
        onError: Colors.transparent,
        surface: TThemeData.darkColor,
        onSurface: TThemeData.lightColor,
      ),
      shadowColor: Colors.transparent,
      textTheme: _getTextTheme(Colors.white),
      buttonTheme: const ButtonThemeData(
        alignedDropdown: true,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: const Color.fromARGB(255, 119, 130, 147),
        indicatorColor: const Color.fromARGB(255, 107, 113, 136),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 107, 113, 136),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 20.0,
              offset: Offset(0, 0),
            ),
          ],
        ),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
          side: WidgetStateProperty.all(
            const BorderSide(color: Colors.black),
          ),
          elevation: WidgetStateProperty.all<double>(0),
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        headerForegroundColor: Colors.black,
        dayForegroundColor: WidgetStateProperty.all(Colors.black),
        yearForegroundColor: WidgetStateProperty.all(Colors.black),
      ),
      iconTheme: IconThemeData(
        color: TThemeData.lightColor,
      ),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: _getFontFamily(),
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: TThemeData.darkColor,
        onPrimary: TThemeData.lightColor,
        secondary: const Color.fromARGB(255, 181, 177, 177),
        onSecondary: Colors.transparent,
        error: Colors.transparent,
        onError: Colors.transparent,
        surface: Colors.white,
        onSurface: TThemeData.lightColor,
      ),
      shadowColor: Colors.black.withOpacity(0.15),
      textTheme: _getTextTheme(TThemeData.darkColor),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
          side: WidgetStateProperty.all(
            const BorderSide(color: Colors.black),
          ),
          elevation: WidgetStateProperty.all<double>(0),
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        headerForegroundColor: Colors.black,
        dayForegroundColor: WidgetStateProperty.all(Colors.black),
        yearForegroundColor: WidgetStateProperty.all(Colors.black),
      ),
      iconTheme: IconThemeData(
        color: TThemeData.darkColor,
      ),
    );
  }
}
