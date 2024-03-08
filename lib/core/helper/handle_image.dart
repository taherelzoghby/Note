
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../consts/strings.dart';

class HandleImageWidget extends StatelessWidget {
  const HandleImageWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    String type = checkPhotoType(image);
    switch (type) {
      case 'jpg' || 'png':
        return Image.asset(image);
      case 'svg':
        return SvgPicture.asset(image);
      default:
        return const Icon(Icons.error);
    }
  }
}

//check photo type
String checkPhotoType(String image) =>
    image.endsWith(StringsEn.jpg) && !image.startsWith(StringsEn.https)
        ? StringsEn.jpg
        : image.endsWith(StringsEn.png) && !image.startsWith(StringsEn.https)
        ? StringsEn.png
        : image.endsWith(StringsEn.svg)
        ? StringsEn.svg
        : StringsEn.network;
