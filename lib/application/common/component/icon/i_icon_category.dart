import 'package:flutter/material.dart';

import '../../assets/assets.dart';
import '../image/i_image.dart';
import '../theme/i_colors.dart';



class IIconCategory {
  IIconCategory._();

  static Widget iconWithColorOutside(String text) {
    switch (text) {
      case "Food":
        return const ClipOval(
          child: Material(
            color: Palette.yellow,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: IImage(
                image: IAsset.iconFood,
                width: 24,
                fit: BoxFit.fitWidth,
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),
        );
      case "Education":
        return const ClipOval(
          child: Material(
            color: Palette.orange,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: IImage(
                image: IAsset.iconEducation,
                width: 24,
                fit: BoxFit.fitWidth,
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),
        );
      case "Entertainment":
        return const ClipOval(
          child: Material(
            color: Palette.blue1,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: IImage(
                image: IAsset.iconEntertainment,
                width: 24,
                fit: BoxFit.fitWidth,
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),
        );
      case "Gift":
        return const ClipOval(
          child: Material(
            color: Palette.red,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: IImage(
                image: IAsset.iconGift,
                width: 24,
                fit: BoxFit.fitWidth,
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),
        );
      case "HomeTools":
        return const ClipOval(
          child: Material(
            color: Palette.purple2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: IImage(
                image: IAsset.iconHomeTools,
                width: 24,
                fit: BoxFit.fitWidth,
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),
        );
      case "Internet":
        return const ClipOval(
          child: Material(
            color: Palette.blue3,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: IImage(
                image: IAsset.iconInternet,
                width: 24,
                fit: BoxFit.fitWidth,
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),
        );
      case "Shopping":
        return const ClipOval(
          child: Material(
            color: Palette.green2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: IImage(
                image: IAsset.iconShopping,
                width: 24,
                fit: BoxFit.fitWidth,
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),
        );
      case "Sport":
        return const ClipOval(
          child: Material(
            color: Palette.blue2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: IImage(
                image: IAsset.iconSport,
                width: 24,
                fit: BoxFit.fitWidth,
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),
        );
      case "Transport":
        return const ClipOval(
          child: Material(
            color: Palette.purple1,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: IImage(
                image: IAsset.iconTransport,
                width: 24,
                fit: BoxFit.fitWidth,
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),
        );
      default:
        return const IImage(image: '');
    }
  }

  static Widget iconWithColorInside(String text) {
    switch (text) {
      case "Food":
        return const IImage(
          image: IAsset.iconFood,
          width: 24,
          color: Palette.yellow,
          fit: BoxFit.fitWidth,
        );
      case "Education":
        return const IImage(
          image: IAsset.iconEducation,
          width: 24,
          fit: BoxFit.fitWidth,
          color: Palette.orange,
        );
      case "Entertainment":
        return const IImage(
          image: IAsset.iconEntertainment,
          width: 24,
          fit: BoxFit.fitWidth,
          color: Palette.blue1,
        );
      case "Gift":
        return const IImage(
          image: IAsset.iconGift,
          width: 24,
          fit: BoxFit.fitWidth,
          color: Palette.red,
        );
      case "HomeTools":
        return const IImage(
          image: IAsset.iconHomeTools,
          width: 24,
          fit: BoxFit.fitWidth,
          color: Palette.purple2,
        );
      case "Internet":
        return const IImage(
          image: IAsset.iconInternet,
          width: 24,
          fit: BoxFit.fitWidth,
          color: Palette.blue3,
        );
      case "Shopping":
        return const IImage(
          image: IAsset.iconShopping,
          width: 24,
          fit: BoxFit.fitWidth,
          color: Palette.green2,
        );
      case "Sport":
        return const IImage(
          image: IAsset.iconSport,
          width: 24,
          fit: BoxFit.fitWidth,
          color: Palette.blue2,
        );
      case "Transport":
        return const IImage(
          image: IAsset.iconTransport,
          width: 24,
          fit: BoxFit.fitWidth,
          color: Palette.purple1,
        );
      default:
        return const IImage(image: '');
    }
  }
}
