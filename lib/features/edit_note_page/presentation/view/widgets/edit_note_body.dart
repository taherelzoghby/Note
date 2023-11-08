import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_3/core/consts/app_router.dart';
import 'package:note_3/core/consts/style.dart';
import 'package:note_3/core/models/note.dart';
import 'package:note_3/core/widgets/loading_widget.dart';
import 'package:note_3/core/widgets/text_field.dart';
import 'package:note_3/features/edit_note_page/presentation/view_model/edit_note_cubit/update_note_cubit.dart';
import 'package:note_3/generated/l10n.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    UpdateNoteCubit bloc = BlocProvider.of<UpdateNoteCubit>(context);
    return BlocConsumer<UpdateNoteCubit, UpdateNoteState>(
      listener: (context, state) {
        if (state is EditNoteSuccess) {
          ///success
          GoRouter.of(context).pop();
        } else if (state is EditNoteFailure) {
          ///failure
          GoRouter.of(context).pushReplacement(AppGoRouter.editNotePath);
        }
      },
      builder: (context, state) {
        if (state is EditNoteLoading) {
          ///loading
          return const LoadingWidget();
        }
        return Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              ///title
              CustomTextField(
                hint: S.of(context).title,
                maxLines: 1,
                style: AppConsts.style21,
                controller: bloc.title,
                hintStyle: const TextStyle(),
              ),

              ///content
              CustomTextField(
                hint: S.of(context).content,
                maxLines: 1000,
                style: const TextStyle(),
                controller: bloc.content,
                hintStyle: const TextStyle(),
              ),
            ],
          ),
        );
      },
    );
  }
}
