import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:note_3/features/edit_note_page/data/repos/edit_note_repo/edit_note_repo.dart';

import '../../../../../core/models/note.dart';

part 'update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  EditNotePageRepo editNotePageRepo;

  UpdateNoteCubit({required this.editNotePageRepo})
      : super(UpdateNoteInitial());
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  ///init title , content
  init({required Note note}) {
    title.text = note.title!;
    content.text = note.content!;
  }

  ///edit note
  editNote({required Note note}) {
    editNoteImpl(
      note: Note(
        id: note.id,
        title: title.text,
        content: content.text,
        datatimeCreated: note.datatimeCreated,
        datatimeEdited:  DateFormat("MMM dd yyy hh:mm a").format(DateTime.now()),
      ),
    );
  }

  ///edit note implementation
  editNoteImpl({required Note note}) async {
    try {
      emit(EditNoteLoading());
      int response = await editNotePageRepo.editNote(note: note);
      emit(EditNoteSuccess());
    } catch (e) {
      emit(EditNoteFailure(message: e.toString()));
    }
  }
}
