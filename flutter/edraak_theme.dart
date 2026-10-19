// Edraak Engineering — Flutter theme (v1.1.0)
// Mirrors tokens.css. Fonts must be declared in pubspec.yaml (see edraak_pubspec_fonts.yaml).
import 'package:flutter/material.dart';

abstract class EdraakColors {
  static const navy950 = Color(0xFF0B1D2E);
  static const navy900 = Color(0xFF112C46);
  static const navy700 = Color(0xFF2B4A66);
  static const navy300 = Color(0xFF8FA6BA);
  static const orange500 = Color(0xFFED6725);
  static const orange700 = Color(0xFFC94D12);
  static const orange300 = Color(0xFFFF9A66);
  static const gray50 = Color(0xFFF3F6F9);
  static const gray200 = Color(0xFFD5DEE7);
  static const gray600 = Color(0xFF4A5D70);
  static const error = Color(0xFFB42318);
  static const errorDark = Color(0xFFFF8A80);
  static const focus = Color(0xFF1F5FA8);
  static const focusDark = Color(0xFF8FB8E0);
  static const textDark = Color(0xFFF3F6F9);
  static const text2Dark = Color(0xFFB8C7D5);
}

class EdraakTheme {
  static const fontFamily = 'ThmanyahSans';

  static ThemeData light() => _build(Brightness.light);
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final bg = isDark ? EdraakColors.navy950 : Colors.white;
    final text = isDark ? EdraakColors.textDark : EdraakColors.navy900;
    final text2 = isDark ? EdraakColors.text2Dark : EdraakColors.gray600;
    final border = isDark ? EdraakColors.navy700 : EdraakColors.gray200;
    final action = isDark ? EdraakColors.orange500 : EdraakColors.orange700;
    final onAction = isDark ? EdraakColors.navy950 : Colors.white;
    final accent = isDark ? EdraakColors.orange300 : EdraakColors.orange700;
    final errorColor = isDark ? EdraakColors.errorDark : EdraakColors.error;
    final focus = isDark ? EdraakColors.focusDark : EdraakColors.focus;

    final scheme = ColorScheme(
      brightness: brightness,
      primary: action,
      onPrimary: onAction,
      secondary: accent,
      onSecondary: onAction,
      error: errorColor,
      onError: onAction,
      surface: bg,
      onSurface: text,
      outline: border,
    );

    TextStyle style(double size, double lineHeight, FontWeight weight, Color color) => TextStyle(
          fontFamily: fontFamily,
          fontSize: size,
          height: lineHeight / size,
          fontWeight: weight,
          color: color,
        );

    final textTheme = TextTheme(
      displayLarge: style(56, 64, FontWeight.w900, text),
      headlineLarge: style(40, 48, FontWeight.w900, text),
      headlineMedium: style(32, 40, FontWeight.w700, text),
      headlineSmall: style(24, 32, FontWeight.w700, text),
      bodyLarge: style(18, 30, FontWeight.w400, text),
      bodyMedium: style(16, 26, FontWeight.w400, text2),
      bodySmall: style(14, 22, FontWeight.w400, text2),
      labelLarge: style(13, 20, FontWeight.w500, text),
    );

    final radius = BorderRadius.circular(8);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: bg,
      fontFamily: fontFamily,
      textTheme: textTheme,
      focusColor: isDark ? const Color(0x338FB8E0) : const Color(0x331F5FA8),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: action,
          foregroundColor: onAction,
          minimumSize: const Size(44, 44),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: const TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: text,
          side: BorderSide(color: text, width: 1.5),
          minimumSize: const Size(44, 44),
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: bg,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(borderRadius: radius, borderSide: BorderSide(color: border, width: 1.5)),
        enabledBorder: OutlineInputBorder(borderRadius: radius, borderSide: BorderSide(color: border, width: 1.5)),
        focusedBorder: OutlineInputBorder(borderRadius: radius, borderSide: BorderSide(color: focus, width: 2)),
        errorBorder: OutlineInputBorder(borderRadius: radius, borderSide: BorderSide(color: errorColor, width: 1.5)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: radius, borderSide: BorderSide(color: errorColor, width: 2)),
        labelStyle: TextStyle(color: text2),
      ),
    );
  }
}
