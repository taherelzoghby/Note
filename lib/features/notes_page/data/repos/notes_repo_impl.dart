import 'package:note_3/core/helper/dbHelper/local_db.dart';
import 'package:note_3/core/models/note.dart';
import 'package:note_3/features/notes_page/data/repos/notes_repo.dart';

class NotesRepoImplementation extends NotesRepo {
  SqliteDB db;

  NotesRepoImplementation({required this.db});

  @override
  Future<List<Note>> getNotes() async {
    try {
      List<Note> notes = await db.read();
      return notes;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future deleteDatabases() async {
    try {
      await db.deleteMyDatabase(table: "Notes");
    } catch (e) {
      throw Exception(e);
    }
  }


}
