import 'package:flutter/material.dart';
import 'package:note_3/core/consts/style.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppConsts.mainColor,
      ),
    );
  }
}
