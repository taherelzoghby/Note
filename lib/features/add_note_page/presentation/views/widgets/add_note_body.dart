import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_3/core/consts/style.dart';
import 'package:note_3/core/widgets/loading_widget.dart';
import 'package:note_3/core/widgets/text_field.dart';
import 'package:note_3/features/add_note_page/presentation/view_models/add_note_cubit/add_note_cubit.dart';
import 'package:note_3/generated/l10n.dart';

import '../../../../../core/consts/app_router.dart';

class AddNoteBody extends StatelessWidget {
  const AddNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          GoRouter.of(context).pop();
        } else if (state is AddNoteFailure) {
          GoRouter.of(context).pushReplacement(AppGoRouter.addNotePath);
        }
      },
      builder: (context, state) {
        if (state is AddNoteLoading) {
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
                controller: BlocProvider.of<AddNoteCubit>(context).title,
                hintStyle: const TextStyle(),
              ),

              ///content
              CustomTextField(
                hint: S.of(context).content,
                maxLines: 1000,
                style: const TextStyle(),
                controller: BlocProvider.of<AddNoteCubit>(context).content,
                hintStyle: const TextStyle(),
              ),
            ],
          ),
        );
      },
    );
  }
}
