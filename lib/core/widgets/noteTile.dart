import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:note_3/core/consts/app_router.dart';
import 'package:note_3/core/consts/style.dart';
import 'package:note_3/core/models/note.dart';
import 'package:note_3/features/notes_page/presentation/view_models/notes_cubit/notes_cubit.dart';
import 'package:note_3/generated/l10n.dart';

import 'dialog.dart';

class NoteTile extends StatelessWidget {
  final Note note;

  const NoteTile({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => GoRouter.of(context).push(
          AppGoRouter.editNotePath,
          extra: note,
        ),
        onLongPress: () {
          ///delete note
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialogWidget(
                contentText: S.of(context).areYouSureDeleteNote,
                confirmFunction: () {
                  ///delete all databases
                  BlocProvider.of<NotesCubit>(context)
                      .deleteNote(note: note);

                  ///get Notes
                  BlocProvider.of<NotesCubit>(context).getNotes();

                  ///go back
                  GoRouter.of(context).pushReplacement(AppGoRouter.homePath);
                },
                declineFunction: () => GoRouter.of(context).pop(),
              );
            },
          );
        },
        borderRadius: BorderRadius.circular(15.sp),
        child: Container(
          height: size.height * .13.h,
          decoration: AppConsts.decorationNoteTile,
          child: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///title
                    SizedBox(
                      width: size.width * .8.w,
                      child: Text(
                        note.title!,
                        style: AppConsts.style23,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    ///content
                    Text(
                      note.content!,
                      style: AppConsts.style18Grey,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                Text(
                  note.datatimeEdited!,
                  style: AppConsts.styleDate,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
