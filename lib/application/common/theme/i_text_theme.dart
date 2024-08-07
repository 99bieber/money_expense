import 'package:flutter/material.dart';

import '../../../core/extensions/i_custom_text_data_extensions.dart';
import '../component/theme/i_colors.dart';

class ITextTheme {
  static TextStyle? fromString(String text) {
    var textTheme2 = textThemeMaterial2;
    switch (text) {
      case "BigTitle":
        return textTheme2.bigTitle;
      case "Paragraph/Medium":
        return textTheme2.paragraphMedium;
      case "Paragraph/SemiBold":
        return textTheme2.paragraphSemiBold;
      case "Paragraph/Bold":
        return textTheme2.paragraphBold;
      case "Paragraph/Regular":
        return textTheme2.paragraphRegular;
      case "Caption/Medium":
        return textTheme2.captionMedium;
      case "Caption/Bold":
        return textTheme2.captionBold;
      default:
        return null;
    }
  }

  static ICustomTextDataExtension textThemeMaterial2 = ICustomTextDataExtension(
    bigTitle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: Palette.black,
    ),
    paragraphMedium: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Palette.gray3,
    ),
    paragraphSemiBold: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Palette.gray3,
    ),
    paragraphBold: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: Palette.gray1,
    ),
    paragraphRegular: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Palette.gray2,
    ),
    captionMedium: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Palette.gray3,
    ),
    captionBold: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: Palette.gray1,
    ),
  );
}
