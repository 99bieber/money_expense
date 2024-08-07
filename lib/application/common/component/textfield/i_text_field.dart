import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_expense/application/common/assets/assets.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';

import '../../../style/input_style/i_input_decoration.dart';
import '../../utils/i_show_date_picker.dart';
import '../image/i_image.dart';
import '../theme/i_colors.dart';

class ITextField extends StatelessWidget {
  final String label;
  final String note;
  final String? erorText;
  final TextStyle? labelStyle;
  final bool fieldRequired;
  final Widget Function(BuildContext context) textFieldBuilder;

  const ITextField({
    Key? key,
    required this.label,
    this.note = "",
    this.erorText,
    this.labelStyle,
    this.fieldRequired = false,
    required this.textFieldBuilder,
  }) : super(key: key);

  factory ITextField._template(
      {Key? key,
      required String label,
      String note = "",
      String? erorText,
      VoidCallback? onTap,
      TextInputType? keyboardType,
      bool autofocus = false,
      bool readOnly = false,
      String? Function(String?)? validator,
      TextInputAction? textInputAction,
      required TextEditingController? controller,
      int? maxLine = 1,
      int? maxLength,
      TextCapitalization textCapitalization = TextCapitalization.words,
      InputDecorationType inputDecorationType = InputDecorationType.outline,
      Function(String value)? onChanged,
      Function(String value)? onFieldSubmitted,
      TextStyle? labelStyle,
      List<TextInputFormatter>? inputFormatters,
      TextAlign textAlign = TextAlign.start,
      InputDecoration? decoration,
      TextStyle? style,
      bool fieldRequired = false,
      bool obscureText = false}) {
    return ITextField(
      key: key,
      label: label,
      note: note,
      erorText: erorText,
      labelStyle: labelStyle,
      fieldRequired: fieldRequired,
      textFieldBuilder: (BuildContext context) {
        return TextFormField(
          textAlign: textAlign,
          // textAlignVertical: TextAlignVertical.center,
          readOnly: readOnly,
          cursorHeight: 23,
          autofocus: autofocus,
          decoration: decoration,
          inputFormatters: inputFormatters ??
              [
                FilteringTextInputFormatter.deny(
                  RegExp(
                    r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|'
                    r'\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                  ),
                )
              ],
          style: style ?? context.paragraphMedium?.copyWith(color: Palette.gray1),
          key: key,
          validator: validator,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          controller: controller,
          textCapitalization: textCapitalization,
          onTap: onTap,
          obscureText: obscureText,
          onChanged: (value) {
            if (value.endsWith("  ")) {
              var data = value.substring(0, value.length - 1);
              controller?.text = data;
              controller?.selection = TextSelection.collapsed(offset: data.length);
            }
            if (onChanged != null) {
              onChanged(value);
            }
          },
          maxLines: maxLine,
          maxLength: maxLength,
          autocorrect: true,
          onFieldSubmitted: onFieldSubmitted,
        );
      },
    );
  }

  factory ITextField.primary({
    Key? key,
    required String label,
    String note = "",
    String? erorText,
    VoidCallback? onTap,
    TextInputType? keyboardType,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool fieldRequired = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    required TextEditingController? controller,
    int? maxLine = 1,
    int? maxLength,
    TextCapitalization textCapitalization = TextCapitalization.words,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    Function(String value)? onChanged,
    Function(String value)? onFieldSubmitted,
    TextStyle? labelStyle,
    List<TextInputFormatter>? inputFormatters,
    String? errorText,
    TextStyle? style,
    Color colorBgTextField = Palette.white,
    Color borderColor = Palette.gray5,
  }) {
    return ITextField._template(
      inputFormatters: inputFormatters,
      key: key,
      label: label,
      note: note,
      erorText: erorText,
      onTap: onTap,
      obscureText: false,
      maxLine: maxLine,
      keyboardType: keyboardType,
      autofocus: autofocus,
      readOnly: readOnly,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      inputDecorationType: inputDecorationType,
      decoration: IInputDecoration.primary(
        hintText: hintText,
        suffixIcon: suffixIcon,
        inputDecorationType: inputDecorationType,
        borderColor: borderColor,
        fillColor: onTap != null
            ? colorBgTextField
            : readOnly
                ? Palette.gray4
                : colorBgTextField,
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
      fieldRequired: fieldRequired,
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: maxLength,
      style: style,
    );
  }

  factory ITextField.currency({
    TextAlign textAlign = TextAlign.start,
    Key? key,
    required String label,
    String note = "",
    String? erorText,
    VoidCallback? onTap,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool required = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    required TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.none,
    Function(String value)? onChanged,
    TextStyle? labelStyle,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    int? maxLine = 1,
    int? maxLength,
    TextAlignVertical? textAlignVertical,
    String? errorText,
    String symbolMataUang = "Rp",
    Color borderColor = Palette.gray5,
    TextStyle? style,
  }) {
    return ITextField._template(
      textAlign: textAlign,
      key: key,
      label: label,
      note: note,
      erorText: erorText,
      maxLine: maxLine,
      onTap: onTap,
      keyboardType: TextInputType.number,
      autofocus: autofocus,
      readOnly: readOnly,
      obscureText: false,
      onChanged: onChanged,
      inputDecorationType: inputDecorationType,
      textCapitalization: textCapitalization,
      decoration: IInputDecoration.primary(
        borderColor: borderColor,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: onTap != null
            ? Palette.white
            : readOnly
                ? Palette.gray4
                : Palette.white,
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
      fieldRequired: required,
      inputFormatters: [
        FilteringTextInputFormatter.deny('-'),
        CurrencyTextInputFormatter.currency(
          decimalDigits: 0,
          locale: 'id_ID',
          name: '',
          symbol: symbolMataUang,
        ),
      ],
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: maxLength,
      style: style,
    );
  }

  factory ITextField.dateTime(
    BuildContext context, {
    Key? key,
    required String label,
    String note = "",
    String? erorText,
    bool autofocus = false,
    String? Function(String?)? validator,
    bool required = false,
    TextInputAction? textInputAction,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? errorText,
    required TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.words,
    Function(String value)? onChanged,
    required Function(DateTime? dateTime) onSubmitted,
    TextStyle? labelStyle,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    String? hinText,
    bool readOnly = false,
    void Function()? onTap,
    BoxConstraints? suffixIconConstraints,
  }) {
    return ITextField._template(
      key: key,
      label: label,
      note: note,
      erorText: erorText,
      maxLine: null,
      obscureText: false,
      keyboardType: TextInputType.number,
      autofocus: autofocus,
      inputDecorationType: inputDecorationType,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      inputFormatters: [
// ITextInputFormatterDate(),
        FilteringTextInputFormatter.deny(RegExp('[^/0-9]')),
// MaskTextInputFormatter(
//     mask: "##-##-####",
//     filter: { "#": RegExp('^[0-9]') },
//     type: MaskAutoCompletionType.lazy
// )
      ],
      decoration: IInputDecoration.primary(
        hintText: hinText,
        suffixIconConstraints: suffixIconConstraints,
        suffixIcon: suffixIcon ??
            Container(
              width: context.mQWidth(0.05),
              height: context.mQWidth(0.05),
              margin: EdgeInsets.only(
                top: context.padding1 + 2,
                right: context.padding2,
                bottom: context.padding1 + 2,
              ),
              child: const IImage(
                image: IAsset.iconCalendar,
                fit: BoxFit.fitHeight,
              ),
            ),
        fillColor: Palette.white,
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
      fieldRequired: required,
      style: context.paragraphMedium?.copyWith(
        color: Palette.gray1,
      ),
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: 10,
      onTap: () {
        IShowDatePicker.dateOfBirth(context, initialEntryMode: DatePickerEntryMode.calendarOnly)
            .then((value) {
          onSubmitted(value);
        });
      },
      readOnly: readOnly,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(context),
        context.sbHeight(size: context.padding1),
        textFieldBuilder(context),
        Align(alignment: Alignment.centerRight, child: _errorText(context)),
        Align(alignment: Alignment.centerRight, child: _note(context)),
      ],
    );
  }

  Widget _label(BuildContext context) {
    return label.isEmpty
        ? const SizedBox()
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: labelStyle ?? context.captionMedium,
              ),
              fieldRequired
                  ? Text(
                      "*",
                      style: context.captionMedium,
                    )
                  : const SizedBox()
            ],
          );
  }

  Widget _note(BuildContext context) {
    return note.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              context.sbHeight(size: context.padding0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
// Text("Note: ", style: context.bodySmall),
                  Expanded(
                    child: Text(
                      note,
                      style: context.paragraphMedium?.copyWith(fontSize: 10, color: Palette.gray4),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            ],
          );
  }

  Widget _errorText(BuildContext context) {
    return erorText == null
        ? const SizedBox()
        : Column(
            children: [
              context.sbHeight(size: context.padding0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
// Text("Note: ", style: context.bodySmall),
                  Expanded(
                    child: Text(
                      erorText!,
                      style: context.paragraphMedium?.copyWith(fontSize: 10, color: Palette.red),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            ],
          );
  }
}
