import 'package:flutter/material.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';

class IAppBar extends AppBar {
  IAppBar._(
      {required Key? key,
      required List<Widget>? actions,
      required Widget? title,
      required bool? centerTitle,
      bool automaticallyImplyLeading = true,
      required PreferredSizeWidget? bottom,
      required Color? backgroundColor,
      required Widget? leading,
      required Widget? flexibleSpace,
      required IconThemeData? iconTheme,
      Color? shadowColor,
      double? elevation})
      : super(
            key: key,
            actions: actions,
            title: title,
            centerTitle: centerTitle,
            backgroundColor: backgroundColor,
            automaticallyImplyLeading: automaticallyImplyLeading,
            leading: leading,
            bottom: bottom,
            iconTheme: iconTheme,
            shadowColor: shadowColor,
            elevation: elevation,
            flexibleSpace: flexibleSpace);

  ///ini app bar dengan title nya di tengah
  factory IAppBar.center(
    BuildContext context, {
    Key? key,
    List<Widget>? actions,
    required String title,
    PreferredSizeWidget? bottom,
  }) {
    return IAppBar._(
      backgroundColor: null,
      leading: GestureDetector(
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      key: key,
      actions: actions,
      title: Builder(builder: (context) {
        return Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: context.bigTitle,
        );
      }),
      centerTitle: true,
      bottom: bottom,
      flexibleSpace: null,
      iconTheme: null,
    );
  }
}
