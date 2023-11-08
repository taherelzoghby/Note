import 'package:get_it/get_it.dart';
import 'package:note_3/core/helper/dbHelper/local_db.dart';
import 'package:note_3/features/add_note_page/data/repos/add_note_page_repo/add_note_repo_imple.dart';
import 'package:note_3/features/edit_note_page/data/repos/edit_note_repo/edit_note_repo_imple.dart';
import 'package:note_3/features/notes_page/data/repos/notes_repo_impl.dart';

final getIt = GetIt.instance;

///init
void setupServiceLocator() {
  ///init sqlite db
  getIt.registerSingleton<SqliteDB>(SqliteDB());

  ///init NotesRepoImplementation
  getIt.registerSingleton<NotesRepoImplementation>(
    NotesRepoImplementation(db: getIt.get<SqliteDB>()),
  );

  ///init NotesRepoImplementation
  getIt.registerSingleton<AddNoteRepoImplementation>(
    AddNoteRepoImplementation(db: getIt.get<SqliteDB>()),
  );

  ///init edit notes Repo Implementation
  getIt.registerSingleton<EditNoteRepoImplementation>(
    EditNoteRepoImplementation(db: getIt.get<SqliteDB>()),
  );
}
