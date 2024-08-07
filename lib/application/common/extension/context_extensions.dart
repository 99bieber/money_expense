import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../../core/extensions/i_custom_text_data_extensions.dart';
import '../../constant/i_constant.dart';
import '../component/dialog/i_dialog.dart';
import '../component/theme/i_colors.dart';

extension ISizeExtensions on BuildContext {
  //=========== color ===================
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get disableColor => Theme.of(this).disabledColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  //=========== Typography =============

  TextStyle? get bigTitle => Theme.of(this).extension<ICustomTextDataExtension>()?.bigTitle;

  TextStyle? get paragraphMedium =>
      Theme.of(this).extension<ICustomTextDataExtension>()?.paragraphMedium;

  TextStyle? get paragraphSemiBold =>
      Theme.of(this).extension<ICustomTextDataExtension>()?.paragraphSemiBold;

  TextStyle? get paragraphBold => Theme.of(this).extension<ICustomTextDataExtension>()?.paragraphBold;

  TextStyle? get paragraphRegular =>
      Theme.of(this).extension<ICustomTextDataExtension>()?.paragraphRegular;

  TextStyle? get captionMedium => Theme.of(this).extension<ICustomTextDataExtension>()?.captionMedium;

  TextStyle? get captionBold => Theme.of(this).extension<ICustomTextDataExtension>()?.captionBold;

  //======= Size =========
  MediaQueryData get iMediaQuery => MediaQuery.of(this);

  Size get iSize => MediaQuery.of(this).size;

  //kenapa ini tidak di awali dengan i karna untuk mempermudah pemanggilan saja
  double get padding0 => IConstant.padding / 2;

  double get padding1 => IConstant.padding * 1;

  double get padding2 => IConstant.padding * 2;

  double get padding3 => IConstant.padding * 3;

  double get padding4 => IConstant.padding * 4;

  double get padding5 => IConstant.padding * 5;

  double get padding6 => IConstant.padding * 6;

  double get padding7 => IConstant.padding * 7;

  double get padding8 => IConstant.padding * 8;

  double get padding9 => IConstant.padding * 9;

  double get padding10 => IConstant.padding * 10;

  double mQWidth(double number) => iSize.width * number;

  double mQHeight(double number) => iSize.height * number;

  ///ini merupakan SizeBox dengat height. [size] defaultnya adalah [padding2]
  Widget sbHeight({double? size}) {
    return SizedBox(height: size ?? padding2);
  }

  ///ini merupakan SizeBox dengat width. [size] defaultnya adalah [padding2]
  Widget sbWidth({double? size}) {
    return SizedBox(width: size ?? padding2);
  }

  Future showDialogWarningSimple({
    required String description,
    Widget? icon,
    List<Widget>? actions,
    bool barrierDismissible = false,
    VoidCallback? onTapOk,
    Widget? additionalWidget,
    Future<bool> Function()? onWillPop,
    bool nonButtonOk = false,
  }) {
    return IDialog.instance.warningSimple(
      this,
      description: description,
      icon: icon,
      actions: actions,
      additionalWidget: additionalWidget,
      barrierDismissible: barrierDismissible,
      onTapOk: onTapOk,
      onWillPop: onWillPop,
      nonButtonOk: nonButtonOk,
    );
  }

  void toastSimple(
    BuildContext context, {
    required String label,
    Color? primaryColor,
    Color? backgroundColor,
    ToastificationStyle? style,
  }) {
    toastification.show(
      context: context,
      alignment: Alignment.bottomCenter,
      title: Text(label),
      autoCloseDuration: const Duration(seconds: 5),
      backgroundColor: primaryColor ?? Palette.primary,
      primaryColor: backgroundColor ?? Palette.primary,
      style: style ?? ToastificationStyle.fillColored,
      closeOnClick: true,
      dragToClose: true,
      showIcon: false,
    );
  }

  Object? get arguments => ModalRoute.of(this)?.settings.arguments;

  Map<String, dynamic>? get argumentsMap {
    var args = ModalRoute.of(this)?.settings.arguments;
    if (args is Map<String, dynamic>?) return args;
    return null;
  }

// show dialog info
// Future showDialogInfo({
//   required String title,
//   required String description,
//   String? image,
//   WarningInfoModel? warningInfo,
//   List<Widget>? actions,
//   Widget? additionalWidget,
//   bool barrierDismissible = false,
//   VoidCallback? onTapOk,
//   double? width,
//   double? height,
//   EdgeInsetsGeometry? padding,
//   Widget? bottomTitleWidget,
// }) {
//   return IDialog.instance.info(
//     this,
//     title: title,
//     description: description,
//     image: image,
//     warningInfo: warningInfo,
//     actions: actions,
//     additionalWidget: additionalWidget,
//     barrierDismissible: barrierDismissible,
//     onTapOk: onTapOk,
//     height: height,
//     width: width,
//     padding: padding,
//     bottomTitleWidget: bottomTitleWidget,
//   );
// }
//
// // show dialog warning
// Future showDialogWarning({
//   String? title,
//   required String description,
//   String? image,
//   List<Widget>? actions,
//   bool barrierDismissible = false,
//   VoidCallback? onTapOk,
//   Widget? additionalWidget,
// }) {
//   return IDialog.instance.warning(
//     this,
//     title: title,
//     description: description,
//     image: image,
//     actions: actions,
//     additionalWidget: additionalWidget,
//     barrierDismissible: barrierDismissible,
//     onTapOk: onTapOk,
//   );
// }
//
// // show dialog warning Simple
// Future showDialogWarningSimple({
//   required String description,
//   String? icon,
//   List<Widget>? actions,
//   bool barrierDismissible = false,
//   VoidCallback? onTapOk,
//   Widget? additionalWidget,
//   Future<bool> Function()? onWillPop,
//   bool nonButtonOk = false,
//
// }) {
//   return IDialog.instance.warningSimple(
//     this,
//     description: description,
//     icon: icon,
//     actions: actions,
//     additionalWidget: additionalWidget,
//     barrierDismissible: barrierDismissible,
//     onTapOk: onTapOk,
//     onWillPop: onWillPop,
//     nonButtonOk: nonButtonOk,
//   );
// }
//
// Future showDialogWarningSimpleBlue({
//   required String description,
//   String? icon,
//   List<Widget>? actions,
//   bool barrierDismissible = false,
//   VoidCallback? onTapOk,
//   Widget? additionalWidget,
//   bool nonButtonOk = false,
//   double? widthImage,
//   String? buttonTitle
// }) {
//   return IDialog.instance.warningSimpleBlue(
//     this,
//     title: buttonTitle,
//     description: description,
//     icon: icon,
//     actions: actions,
//     additionalWidget: additionalWidget,
//     barrierDismissible: barrierDismissible,
//     onTapOk: onTapOk,
//     nonButtonOk: nonButtonOk,
//   );
// }
//
// // show dialog warning with confirmation yes or not
// Future showDialogWarningConfirmation({
//   required String description,
//   String? icon,
//   bool barrierDismissible = false,
//   VoidCallback? onTapOk,
//   VoidCallback? onTapCancel,
//   Widget? additionalWidget,
//   String? title,
//   bool? withIcon = true,
//   String? textButtonCancel,
//   String? textButtonOk,
// }) {
//   return IDialog.instance.warningSimpleConfirmation(
//     this,
//     title: title,
//     withIcon: withIcon,
//     description: description,
//     icon: icon,
//     additionalWidget: additionalWidget,
//     barrierDismissible: barrierDismissible,
//     onTapOk: onTapOk,
//     onTapCancel: onTapCancel,
//     textButtonCancel: textButtonCancel,
//     textButtonOk : textButtonOk,
//   );
// }
//
// Future showDialogComingSoon() {
//   return showDialogInfo(
//     title: "textFiturComingSoon".tr,
//     description: "",
//   );
// }
//
// // show dialog warning Simple Span
// Future showDialogWarningSimpleSpan({
//   required TextSpan description,
//   String? icon,
//   List<Widget>? actions,
//   bool barrierDismissible = false,
//   VoidCallback? onTapOk,
//   Widget? additionalWidget,
// }) {
//   return IDialog.instance.warningSimpleSpan(
//     this,
//     description: description,
//     icon: icon,
//     actions: actions,
//     additionalWidget: additionalWidget,
//     barrierDismissible: barrierDismissible,
//     onTapOk: onTapOk,
//   );
// }
//
// void iShowSnackBar({
//   required String title,
//   String subTitle = "",
//   Widget? action,
//   bool success = false,
//   Color? color,
// }) {
//   ScaffoldMessenger.of(this).showSnackBar(
//     SnackBar(
//       padding: const EdgeInsets.all(0),
//       backgroundColor: color ?? (success ? Palette.secondary : Palette.primary),
//       content: Row(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(padding2),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     title,
//                     style: bodyLarge,
//                   ),
//                   subTitle.isEmpty
//                       ? const SizedBox()
//                       : Text(
//                           subTitle,
//                           style: bodyLarge,
//                         ),
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               ScaffoldMessenger.of(this).hideCurrentSnackBar();
//             },
//             child: Padding(
//               padding: EdgeInsets.all(padding2),
//               child: const IIcon(
//                 icon: Icons.close,
//                 color: Palette.neutral10,
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
}
