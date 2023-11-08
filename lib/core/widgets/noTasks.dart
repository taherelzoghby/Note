import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_3/core/consts/assets.dart';
import 'package:note_3/core/consts/style.dart';
import 'package:note_3/generated/l10n.dart';

import 'package:svg_flutter/svg.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///image no tasks
          SvgPicture.asset(
            AppAssets.noTasks,
            height: size.height * .2.h,
          ),
          const SizedBox(height: 25),
          ///you don't have any notes
          Text(
            S.of(context).you_dont_have_any_notes,
            style: AppConsts.style21,
          )
        ],
      ),
    );
  }
}
