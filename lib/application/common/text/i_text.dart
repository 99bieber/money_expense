import 'package:flutter/material.dart';

class IText extends StatelessWidget {
  final Widget Function(BuildContext context) textBuilder;

  const IText._({Key? key, required this.textBuilder}) : super(key: key);

  factory IText.scaleDown(String text, {TextStyle? style, TextAlign? textAlign}) {
    return IText._(
      textBuilder: (context) {
        return _buildText(
          context,
          child: Text(
            text,
            style: style,
            textAlign: textAlign,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return textBuilder(context);
  }
}

Widget _buildText(BuildContext context, {required Widget child}) {
  return FittedBox(
    fit: BoxFit.scaleDown,
    child: child,
  );
}
