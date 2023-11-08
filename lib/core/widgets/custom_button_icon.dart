
import 'package:flutter/material.dart';
import 'package:note_3/core/consts/style.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({
    Key? key,
    required this.widget,
    required this.onTap,
  }) : super(key: key);

  final Widget widget;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * .07,
        width: size.width * .3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppConsts.mainColor,
          ),
        ),
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
