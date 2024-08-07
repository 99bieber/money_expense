import 'package:flutter/material.dart';

import '../theme/i_colors.dart';


class IDivider extends StatelessWidget {
  final Widget divider;

  const IDivider({Key? key, required this.divider}) : super(key: key);

  factory IDivider.line({double? thickness, Color? color, double? height}) {
    return IDivider(
      divider: Divider(
        height: height,
        thickness: thickness,
        color: color,
      ),
    );
  }

  factory IDivider.bold({double? thickness, Color? color}) {
    return IDivider(
      divider: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IDivider.line(
            thickness: 2,
            height: 2,
            color: Palette.gray3,
          ),
          IDivider.line(
            thickness: 8,
            height: 8,
            color: Palette.gray4,
          ),
        ],
      ),
    );
  }

  factory IDivider.dash(
      {double height = 1,
      Color color = Palette.gray3,
      double dashWidth = 4}) {
    return IDivider(divider: LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (index) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    ));
  }

  factory IDivider.dashVertical(
      {double height = 5,
      Color color = Palette.gray3,
      double dashWidth = 2}) {
    return IDivider(divider: LayoutBuilder(
      builder: (context, constraints) {
        final boxHeight = constraints.constrainHeight();
        final dashHeight = height;
        final dashCount = (boxHeight / (2 * dashHeight)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          direction: Axis.vertical,
          children: List.generate(dashCount, (index) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    ));
  }

  factory IDivider.fromString(String data, {Color color = Palette.gray3, double? height}) {
    switch (data.toLowerCase()) {
      case "dash":
        return IDivider.dash(
          color: color,
        );
      case "bold":
        return IDivider.bold(
          color: color,
        );
      case "line":
        return IDivider.line(
          color: color,
          height: height,
        );
      default:
        return IDivider.line(
          color: color,
          height: height,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return divider;
  }
}
