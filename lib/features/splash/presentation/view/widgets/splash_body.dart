
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_3/core/consts/assets.dart';
import 'package:note_3/core/consts/style.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * .3.h),
        SizedBox(
          height: size.height * .3.h,
          child: Image.asset(
            AppAssets.logo,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: size.height * .05.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: LinearProgressIndicator(
            backgroundColor: AppConsts.grey,
            color: AppConsts.sWhite,
            minHeight: size.height * .003.h,
          ),
        ),
      ],
    );
  }
}
