import 'package:note_3/core/models/note.dart';

abstract class NotesRepo {
  ///get all notes
  Future<List<Note>> getNotes();

  ///delete all database
  Future deleteDatabases();
}
