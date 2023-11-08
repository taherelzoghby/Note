import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_3/core/consts/style.dart';
import 'package:note_3/core/models/note.dart';
import 'package:note_3/core/widgets/loading_dialog.dart';
import 'package:note_3/core/widgets/loading_widget.dart';
import 'package:note_3/core/widgets/noTasks.dart';
import 'package:note_3/features/notes_page/presentation/view_models/delete_all_notes_cubit/delete_all_notes_cubit.dart';
import 'package:note_3/features/notes_page/presentation/view_models/get_notes_cubit/get_notes_cubit.dart';
import 'package:note_3/features/notes_page/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:note_3/features/notes_page/presentation/views/widgets/notes_body.dart';
import 'package:note_3/generated/l10n.dart';

class NotesProcess extends StatelessWidget {
  const NotesProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        if (state is GetNotesLoading) {
          ///loading
          return const LoadingWidget();
        } else if (state is GetNotesLoaded) {
          List<Note> notes = state.notes;
          return BlocConsumer<DeleteAllNotesCubit, DeleteAllNotesState>(
            listener: (context, state) {
              if (state is DeleteAllNotesSuccess) {
                //Toast.show("Toast plugin app", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                Fluttertoast.showToast(
                  msg: S.of(context).successDeleted,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppConsts.mainColor,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              } else if (state is DeleteAllNotesError) {
                Fluttertoast.showToast(
                  msg: S.of(context).somethingError,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppConsts.mainColor,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            },
            builder: (context, state) {
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
            },
          );
        } else {
          return const NoTasksWidget();
        }
      },
    );
  }
}
