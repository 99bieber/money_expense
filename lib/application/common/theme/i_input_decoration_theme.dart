import 'package:flutter/material.dart';

import '../component/theme/i_colors.dart';

class IInputDecorationTheme{
  static InputDecorationTheme primary(){
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide:  const BorderSide(color: Palette.gray5, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      suffixIconColor: Palette.gray4,
      prefixIconColor: Palette.gray4,
      iconColor: Palette.gray4,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    );
  }
}