import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF8F9FA),
    );
  }
}
