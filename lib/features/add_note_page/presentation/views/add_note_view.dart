import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_3/core/consts/app_router.dart';
import 'package:note_3/features/add_note_page/presentation/view_models/add_note_cubit/add_note_cubit.dart';
import 'package:note_3/features/add_note_page/presentation/views/widgets/add_note_body.dart';
import 'package:note_3/features/notes_page/presentation/view_models/get_notes_cubit/get_notes_cubit.dart';
import 'package:note_3/generated/l10n.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_note),
        centerTitle: true,
      ),
      body: const AddNoteBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ///add note
          BlocProvider.of<AddNoteCubit>(context).addNote();
          ///get notes
          BlocProvider.of<GetNotesCubit>(context).getNotes();
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
