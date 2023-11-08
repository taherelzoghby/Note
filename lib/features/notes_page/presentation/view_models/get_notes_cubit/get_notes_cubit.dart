import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_3/core/models/note.dart';
import 'package:note_3/features/notes_page/data/repos/notes_repo.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  NotesRepo notesRepo;

  GetNotesCubit({required this.notesRepo}) : super(GetNotesInitial());
  List<Note> notes = [];

  ///get all notes
  getNotes() async {
    try {
      ///emit loading
      emit(GetNotesLoading());
      notes = await notesRepo.getNotes();

      ///emit list of notes
      emit(GetNotesLoaded(notes: notes));
    } catch (e) {
      ///emit failure
      emit(GetNotesFailure(message: e.toString()));
    }
  }
}
