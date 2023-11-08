import 'package:note_3/core/helper/dbHelper/local_db.dart';
import 'package:note_3/core/models/note.dart';
import 'package:note_3/features/add_note_page/data/repos/add_note_page_repo/add_note_repo.dart';

class AddNoteRepoImplementation extends AddNotePageRepo {
  SqliteDB db;

  AddNoteRepoImplementation({required this.db});

  ///add note
  @override
  Future<int> addNote({required Note note}) async {
    try {
      int response = await db.insert(note: note);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
