import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:note_3/core/models/note.dart';

import '../../../data/repos/add_note_page_repo/add_note_repo.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNotePageRepo addNotePageRepo;

  AddNoteCubit({required this.addNotePageRepo}) : super(AddNoteInitial());
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  addNote() {
    addNoteImpl(
      note: Note(
        title: title.text,
        content: content.text,
        datatimeCreated:
            DateFormat("MMM dd yyy hh:mm a").format(DateTime.now()),
        datatimeEdited: DateFormat("MMM dd yyy hh:mm a").format(DateTime.now()),
      ),
    );
  }

  ///add note
  addNoteImpl({required Note note}) async {
    try {
      emit(AddNoteLoading());
      int response = await addNotePageRepo.addNote(note: note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(message: e.toString()));
    }
  }
}
