import 'package:flutter/material.dart';
import 'package:note_3/core/consts/style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    this.onChanged,
    this.obscureText = false,
    this.perfixIcon,
    this.readOnly = false,
    this.maxLines = 1,
    this.perfixText = '',
    required this.style,
    required this.controller,
    required this.hintStyle,
  }) : super(key: key);
  final String hint;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Widget? perfixIcon;
  final bool readOnly;
  final int maxLines;
  final String perfixText;
  final TextStyle style;
  final TextEditingController controller;
  final TextStyle hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      readOnly: readOnly,
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      cursorColor: AppConsts.mainColor,
      style: style,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hint == 'Title' ? AppConsts.style21 : hintStyle,
        prefixIcon: perfixIcon,
        prefixText: perfixText,
        border: InputBorder.none,
      ),
    );
  }
}
