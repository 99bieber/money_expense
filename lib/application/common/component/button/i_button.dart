import 'package:flutter/material.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';

import '../../text/i_text.dart';
import '../theme/i_colors.dart';

class IButton extends StatelessWidget {
  final Widget Function(BuildContext context) buildButton;

  const IButton._({Key? key, required this.buildButton}) : super(key: key);

  factory IButton.primary({
    required VoidCallback? onPressed,
    required String? title,
    TextAlign? textAlign,
    Color? color,
  }) {
    return IButton._(
      buildButton: (context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6), // <-- Radius
          ),
          minimumSize: const Size(0, 56),
          backgroundColor: color ?? Palette.primary,
          textStyle: context.bigTitle?.copyWith(color: Palette.white),
        ),
        child: Center(
          child: onPressed == null
              ? IText.scaleDown(
                  title ?? "",
                  textAlign: textAlign ?? TextAlign.center,
                  style: context.bigTitle?.copyWith(color: Palette.white),
                )
              : IText.scaleDown(
                  title ?? "",
                  textAlign: textAlign ?? TextAlign.center,
                  style: context.bigTitle?.copyWith(color: Palette.white),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildButton(context);
  }
}
