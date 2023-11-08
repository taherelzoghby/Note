import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_3/core/models/note.dart';
import 'package:note_3/core/widgets/loading_dialog.dart';
import 'package:note_3/core/widgets/loading_widget.dart';
import 'package:note_3/core/widgets/noTasks.dart';
import 'package:note_3/features/notes_page/presentation/view_models/notes_cubit/notes_cubit.dart';
import 'package:note_3/features/notes_page/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:note_3/features/notes_page/presentation/views/widgets/notes_body.dart';

class NotesProcess extends StatelessWidget {
  const NotesProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is GetNotesLoading) {
          ///loading
          return const LoadingWidget();
        } else if (state is GetNotesLoaded) {
          List<Note> notes = state.notes;
          if (state is DeleteAllNotesLoading) {
            return const LoadingDialog();
          }
          return BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is FilteringSearch) {
                return state.filteringSearch.isEmpty
                    ? const NoTasksWidget()
                    : NotesBody(notes: state.filteringSearch);
              } else {
                return notes.isEmpty
                    ? const NoTasksWidget()
                    : NotesBody(notes: notes);
              }
            },
          );
        } else {
          return const NoTasksWidget();
        }
      },
    );
  }
}
