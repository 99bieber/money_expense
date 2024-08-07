import 'package:flutter/material.dart';

class ICustomTextDataExtension extends ThemeExtension<ICustomTextDataExtension> {
  TextStyle? bigTitle;

  TextStyle? paragraphMedium;

  TextStyle? paragraphSemiBold;

  TextStyle? paragraphBold;

  TextStyle? paragraphRegular;

  TextStyle? captionMedium;

  TextStyle? captionBold;

  ICustomTextDataExtension({
    this.bigTitle,
    this.paragraphMedium,
    this.paragraphSemiBold,
    this.paragraphBold,
    this.paragraphRegular,
    this.captionMedium,
    this.captionBold,
  });

  @override
  ThemeExtension<ICustomTextDataExtension> copyWith({
    TextStyle? bigTitle,
    TextStyle? paragraphMedium,
    TextStyle? paragraphSemiBold,
    TextStyle? paragraphBold,
    TextStyle? paragraphRegular,
    TextStyle? captionMedium,
    TextStyle? captionBold,
  }) {
    return ICustomTextDataExtension(
      bigTitle: bigTitle ?? this.bigTitle,
      paragraphMedium: paragraphMedium ?? this.paragraphMedium,
      paragraphSemiBold: paragraphSemiBold ?? this.paragraphSemiBold,
      paragraphBold: paragraphBold ?? this.paragraphBold,
      paragraphRegular: paragraphRegular ?? this.paragraphRegular,
      captionMedium: captionMedium ?? this.captionMedium,
      captionBold: captionBold ?? this.captionBold,
    );
  }

  @override
  ThemeExtension<ICustomTextDataExtension> lerp(
      ThemeExtension<ICustomTextDataExtension>? other, double t) {
    return this;
  }
}
