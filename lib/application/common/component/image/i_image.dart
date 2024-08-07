import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../theme/i_colors.dart';

class IImage extends StatelessWidget {
  final dynamic image;
  final double? height, width;
  final BoxFit? fit;
  final BorderRadius borderRadius;
  final Color? loadingColor;
  final Widget? loadingWidget;
  final Color? color;

  ///widget Image ini sudah di bikin fleksibel untuk menampilkan image dari File, assets dan internet
  const IImage(
      {Key? key,
      required this.image,
      this.height,
      this.width,
      this.loadingWidget,
      this.loadingColor,
      this.fit = BoxFit.cover,
      this.color,
      this.borderRadius = BorderRadius.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image is String) {
      var image = this.image as String;
      if (image.isNotEmpty) {
        if (image.startsWith("http")) {
          return ClipRRect(
            borderRadius: borderRadius,
            child: CachedNetworkImage(
              imageUrl: image,
              width: width,
              height: height,
              fit: fit,
              color: color,
              // imageBuilder: (context, image){
              //   return Container(
              //     decoration: BoxDecoration(
              //         borderRadius: borderRadius,
              //         image: DecorationImage(image: image,fit: fit)
              //     ),
              //   );
              // },
              placeholder: (context, url) {
                return Container();
                // return loadingWidget ??
                //     Center(
                //       child: CircularProgressIndicator(
                //         color: loadingColor,
                //       ),
                //     );
              },
              errorWidget: (context, _, x) {
                return const Icon(Icons.image_not_supported);
              },
            ),
          );
        } else if (image.startsWith("assets")) {
          if (image.endsWith(".json")) {
            return LottieBuilder.asset(
              image,
              height: height,
              width: width,
            );
          }
          return ClipRRect(
            borderRadius: borderRadius,
            child: Image.asset(
              image,
              height: height,
              width: width,
              fit: fit,
              color: color,
            ),
          );
        }
      }
    }
    if (image is File) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: Image.file(
          image,
          height: height,
          width: width,
          fit: fit,
          color: color,
        ),
      );
    }
    return Icon(
      Icons.image_not_supported_outlined,
      size: width,
      color: color ?? Palette.gray1,
    );
  }
}

Future<void> loadImage(BuildContext context, String imageUrl) async {
  try {
    // load network image example
    return await precacheImage(NetworkImage(imageUrl), context);
    // or
    // Load assets image example
    // await precacheImage(AssetImage(imagePath), context);
  } catch (e) {
    log('Failed to load and cache the image: $e');
  }
}
