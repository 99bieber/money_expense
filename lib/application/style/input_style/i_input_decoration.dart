import 'package:flutter/material.dart';

import '../../common/component/theme/i_colors.dart';


enum InputDecorationType { outline, underLine }

class IInputDecoration extends InputDecoration {
  const IInputDecoration({
    required String? hintText,
    required Widget? suffixIcon,
    required Widget? prefixIcon,
    required InputBorder? border,
    required InputBorder? errorBorder,
    required InputBorder? enableBorder,
    required BoxConstraints? suffixIconConstraints,
    required Color fillColor,
    required EdgeInsetsGeometry contentPadding,
    required String? errorText,
  }) : super(
          hintText: hintText,
          suffixIcon: suffixIcon,
          border: border,
          focusedErrorBorder: border,
          disabledBorder: border,
          enabledBorder: enableBorder,
          errorBorder: errorBorder,
          focusedBorder: border,
          fillColor: fillColor,
          counterText: "",
          prefixIcon: prefixIcon,
          isDense: true,
          contentPadding: contentPadding,
          filled: true,
          suffixIconConstraints: suffixIconConstraints,
          errorText: errorText,
          // isCollapsed: true,
        );

  factory IInputDecoration.primary({
    required String? hintText,
    required String? errorText,
    required Widget? suffixIcon,
    required Widget? prefixIcon,
    BoxConstraints? suffixIconConstraints,
    required Color fillColor,
    Color borderColor = Palette.gray5,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
  }) {
    InputBorder? border = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1),
      borderRadius: BorderRadius.circular(8.0),
    );
    InputBorder? errorBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Palette.primary, width: 1),
      borderRadius: BorderRadius.circular(8.0),
    );
    if (inputDecorationType == InputDecorationType.underLine) {
      border = UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      );
    }
    return IInputDecoration(
      hintText: hintText,
      suffixIcon: suffixIcon,
      fillColor: fillColor,
      border: border,
      errorBorder: errorBorder,
      enableBorder: border,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      prefixIcon: prefixIcon,
      suffixIconConstraints: suffixIconConstraints,
      errorText: errorText,
    );
  }
}


class IInputDecorationSearch extends InputDecoration {
  const IInputDecorationSearch({
    required String? hintText,
    required Widget? suffixIcon,
    required InputBorder? border,
    required InputBorder? enableBorder,
    required BoxConstraints? suffixIconConstraints,
    required Color fillColor,
    required EdgeInsetsGeometry contentPadding,
    required String? errorText,
    TextStyle? hintStyle,
  }) : super(
          hintText: hintText,
          hintStyle: hintStyle,
          suffixIcon: suffixIcon,
          border: border,
          focusedErrorBorder: border,
          disabledBorder: border,
          enabledBorder: enableBorder,
          errorBorder: border,
          focusedBorder: border,
          fillColor: fillColor,
          counterText: "",
          isDense: true,
          contentPadding: contentPadding,
          filled: true,
          suffixIconConstraints: suffixIconConstraints,
          errorText: errorText,
          // isCollapsed: true,
        );

  factory IInputDecorationSearch.search({
    required String? hintText,
    required String? errorText,
    required Widget? suffixIcon,
    BoxConstraints? suffixIconConstraints,
    required Color fillColor,
    double borderRadiusSize = 8.0,
    Color colorBorder = Palette.gray5,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? hintStyle,
  }) {
    InputBorder? border = OutlineInputBorder(
      borderSide: BorderSide(color: colorBorder, width: 1),
      borderRadius: BorderRadius.circular(borderRadiusSize),
    );
    if (inputDecorationType == InputDecorationType.underLine) {
      border = UnderlineInputBorder(
        borderSide: BorderSide(color: colorBorder, width: 1),
        borderRadius: BorderRadius.circular(borderRadiusSize),
      );
    }
    return IInputDecorationSearch(
      hintText: hintText,
      suffixIcon: suffixIcon,
      fillColor: fillColor,
      border: border,
      enableBorder: border,
      contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      suffixIconConstraints: suffixIconConstraints,
      errorText: errorText,
      hintStyle: hintStyle,
    );
  }
}