import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_3/core/consts/app_router.dart';
import 'package:note_3/core/consts/style.dart';
import 'package:note_3/core/models/note.dart';
import 'package:note_3/features/edit_note_page/presentation/view/widgets/edit_note_body.dart';
import 'package:note_3/features/notes_page/presentation/view_models/notes_cubit/notes_cubit.dart';
import 'package:note_3/features/notes_page/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:note_3/generated/l10n.dart';


class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S
            .of(context)
            .edit_note),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            position: PopupMenuPosition.under,
            icon: const Icon(Icons.more_vert),
            onSelected: (val) {
              if (val == 0) {
                ///delete note
                BlocProvider.of<NotesCubit>(context)
                    .deleteNote(note: note);

                ///get Notes
                BlocProvider.of<NotesCubit>(context).getNotes();

                ///go back
                GoRouter.of(context).pushReplacement(AppGoRouter.homePath);
              }
            },
            itemBuilder: (context) =>
            [

              ///delete note
              PopupMenuItem(
                value: 0,
                child: Text(
                  S
                      .of(context)
                      .delete,
                  style: AppConsts.style21.copyWith(fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
      body: EditNoteBody(note: note),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ///stop searching
          BlocProvider.of<SearchCubit>(context).stopSearching();

          ///update note
          BlocProvider.of<NotesCubit>(context).editNote(note: note);

          ///get notes
          BlocProvider.of<NotesCubit>(context).getNotes();
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
