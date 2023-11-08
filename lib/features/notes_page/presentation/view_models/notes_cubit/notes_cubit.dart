import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:note_3/core/models/note.dart';
import 'package:note_3/features/add_note_page/data/repos/add_note_page_repo/add_note_repo.dart';
import 'package:note_3/features/edit_note_page/data/repos/edit_note_repo/edit_note_repo.dart';
import 'package:note_3/features/notes_page/data/repos/notes_repo.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesRepo notesRepo;
  EditNotePageRepo editNoteRepo;
  AddNotePageRepo addNotePageRepo;

  NotesCubit({
    required this.notesRepo,
    required this.editNoteRepo,
    required this.addNotePageRepo,
  }) : super(GetNotesInitial());
  List<Note> notes = [];
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
        datatimeEdited: DateFormat("MMM dd yyy hh:mm a").format(DateTime.now()),
      ),
    );
  }

  ///edit note implementation
  editNoteImpl({required Note note}) async {
    try {
      emit(EditNoteLoading());
      int response = await editNoteRepo.editNote(note: note);
      emit(EditNoteSuccess());
    } catch (e) {
      emit(EditNoteFailure(message: e.toString()));
    }
  }

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

  ///delete note
  deleteNote({required Note note}) async {
    int result = await editNoteRepo.deleteNote(note: note);
  }

  ///delete all notes
  deleteAllNotes() async {
    try {
      emit(DeleteAllNotesLoading());
      await notesRepo.deleteDatabases();
      emit(DeleteAllNotesSuccess());
    } catch (e) {
      emit(DeleteAllNotesError(message: e.toString()));
    }
  }
}
