import 'package:note_3/core/models/note.dart';
import 'package:note_3/features/edit_note_page/data/repos/edit_note_repo/edit_note_repo.dart';

import '../../../../../core/helper/dbHelper/local_db.dart';

class EditNoteRepoImplementation extends EditNotePageRepo {
  SqliteDB db;

  EditNoteRepoImplementation({required this.db});

  @override
  deleteNote({required Note note}) async {
    try {
      int response = await db.delete(note: note);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  editNote({required Note note}) async {
    try {
      int response = await db.update(note: note);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
