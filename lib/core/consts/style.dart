import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppConsts {
  static const Color white = Colors.white;

  static const Color backDialog = Color.fromRGBO(254, 253, 253, 1);
  static const Color mainColor = Color.fromRGBO(255, 187, 0, 1);
  static const Color sWhite = Color.fromRGBO(239, 255, 245, 1);
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color orange = Color.fromRGBO(255, 221, 79, 1);
  static const Color red = Colors.red;
  static const Color blue = Colors.blue;
  static const Color lightBlue = Colors.lightBlue;
  static const Color previewColor = Color.fromRGBO(239, 130, 98, 1);
  static BoxDecoration decorationNoteTile = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        mainColor.withOpacity(.3),
        mainColor.withOpacity(.1),
      ],
    ),
    borderRadius: BorderRadius.circular(15.sp),
  );
  static OutlineInputBorder decorationField = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromRGBO(133, 133, 133, 1),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(15),
  );
  static OutlineInputBorder decorationFieldNormal = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromRGBO(133, 133, 133, 1),
      width: 1,
    ),
    borderRadius: BorderRadius.circular(15),
  );
  static OutlineInputBorder decorationFieldError = OutlineInputBorder(
    borderSide: const BorderSide(
      color: red,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(15),
  );
  static const List<BoxShadow> boxShadows = [
    BoxShadow(
      color: AppConsts.grey,
      blurRadius: 6,
      spreadRadius: .001,
      offset: Offset(1, 2),
    )
  ];
  static const List<BoxShadow> boxShadowsItemTrack = [
    BoxShadow(
      color: AppConsts.grey,
      blurRadius: 6,
      spreadRadius: .001,
      offset: Offset(1, 2),
    )
  ];
  static  TextStyle style18Grey = TextStyle(
    fontSize: 14,
    color: black.withOpacity(.5),
  );
  static  TextStyle styleDate = TextStyle(
    fontSize: 14,
    color: black.withOpacity(.5),
  );
  static const style18 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: sWhite,
  );
  static const style21 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 21,
  );
  static const style23 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 21,
  );
}
