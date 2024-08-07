import 'package:flutter/material.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';

import '../button/i_button.dart';
import '../theme/i_colors.dart';

class IDialog {
  static final instance = IDialog._internal();

  IDialog._internal();

  factory IDialog() {
    return instance;
  }

  Future warningSimple(
    BuildContext context, {
    required String description,
    Widget? icon,
    List<Widget>? actions,
    bool barrierDismissible = false,
    VoidCallback? onTapOk,
    Widget? additionalWidget,
    bool nonButtonOk = false,
    double? width,
    Future<bool> Function()? onWillPop,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Palette.white,
          surfaceTintColor: Palette.white,
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ?? Container(),
                Text(
                  description,
                  style: context.bigTitle?.copyWith(fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                additionalWidget ?? const SizedBox(),
              ],
            ),
          ),
          actions: !nonButtonOk
              ? actions ??
                  [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.padding4),
                      child: SizedBox(
                        width: context.mQWidth(1),
                        child: IButton.primary(
                            onPressed: () {
                              Navigator.pop(context);
                              if (onTapOk != null) {
                                onTapOk();
                              }
                            },
                            title: "OK"),
                      ),
                    )
                  ]
              : null,
        );
      },
    );
  }
}

class WarningInfoModel {
  final String title;
  final String description;

  WarningInfoModel({required this.title, required this.description});
}
