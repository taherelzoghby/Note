import 'package:note_3/core/models/note.dart';

abstract class AddNotePageRepo{
  ///add note to "Notes" table in database
  Future<int> addNote({required Note note});
}