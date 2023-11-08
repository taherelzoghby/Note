import 'package:note_3/core/models/note.dart';

abstract class EditNotePageRepo{
  ///Edit(update) note
  editNote({required Note note});
  ///delete note
  deleteNote({required Note note});
}