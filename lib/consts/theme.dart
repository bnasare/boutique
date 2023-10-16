import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: const Color(0xFFFFFFFF),
            secondary: const Color(0xFF333333),
            tertiary: const Color(0xFFC9F66F),
            background: const Color.fromRGBO(1, 122, 152, 1),
          ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          color: Color(0xFF333333),
        ),
        bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins',
          color: Color(0xFFFFFFFF),
          letterSpacing: 1.2,
          overflow: TextOverflow.ellipsis,
        ),
        bodySmall: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins',
          color: Color(0xFF333333),
          letterSpacing: 0.7,
        ),
      ),
    );
  }
}
