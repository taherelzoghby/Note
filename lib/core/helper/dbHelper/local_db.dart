import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/note.dart';

class SqliteDB {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      return _db = await initDB();
    } else {
      return _db;
    }
  }

  ///init database
  initDB() async {
    // Get a location using getDatabasesPath
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'taher.db');
    // open the database
    Database? database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
    return database;
  }

  ///create table
  Future<FutureOr<void>> onCreate(Database db, int version) async {
    await db.execute("""
 CREATE TABLE 'Notes'(
 'id' INTEGER NOT NULL PRIMARY KEY  AUTOINCREMENT,
 title TEXT NOT NULL,
 content TEXT NOT NULL,
 datatimeEdited TEXT NOT NULL,
 datatimeCreated TEXT NOT NULL
 )
 """);
    print("created table.....");
  }
  FutureOr<void> onUpgrade(Database db, int oldVersion, int newVersion) {
      print("------------On upgared------------");
  }

  ///insert note
  Future<int> insert({required Note note}) async {
    Database? dbb = await db;
    int response = await dbb!.insert("Notes", note.toMap());
    print(response);
    return response;
  }

  ///read notes
  Future<List<Note>> read() async {
    List<Note> notes = [];
    Database? dbb = await db;
    if (dbb != null) {
      List<Map<String, Object?>> response = await dbb.query("Notes");
      notes = response.map((note) => Note.fromJson(note)).toList();
    }
    print(notes);
    return notes;
  }

  ///update note
  Future<int> update({required Note note}) async {
    Database? dbb = await db;
    print(note.id);
    int response = await dbb!.update(
      "Notes",
      note.toMap(),
      where: "id = ?",
      whereArgs: [note.id],
    );
    print(response);
    return response;
  }

  ///delete note
  Future<int> delete({required Note note}) async {
    Database? dbb = await db;
    int response = await dbb!.delete(
      "Notes",
      where: "id = ?",
      whereArgs: [note.id],
    );
    print(response);
    return response;
  }

  ///delete all database
  Future<void> deleteAllDatabase() async {
    // Get a location using getDatabasesPath
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'taher.db');
    return await deleteDatabase(path);
  }

  ///delete table from  database
  Future<int> deleteMyDatabase({required String table}) async {
    Database? dbb = await db;
    return await dbb!.delete(table);
  }


}
