import 'package:flutter/material.dart';

import '../component/theme/i_colors.dart';
import 'i_text_theme.dart';

class IButtonTheme {
  static TextButtonThemeData textButtonThemeData() {
    return TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        textStyle: ITextTheme.textThemeMaterial2.bigTitle,
        foregroundColor: Palette.primary,
        minimumSize: const Size(double.minPositive, 64),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
    );
  }
}
