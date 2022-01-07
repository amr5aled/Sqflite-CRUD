import '../models/item_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

// Get a location using getDatabasesPath
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // When creating the db, create the table
  Future _createDB(Database db, int version) async {
    //dataType//
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableItems ( 
  ${ItemsFields.id} $idType, 
  ${ItemsFields.title} $textType,
  ${ItemsFields.description} $textType,
  ${ItemsFields.createdAt} $textType,
  ${ItemsFields.time} $textType,
  ${ItemsFields.image} $textType
   ${ItemsFields.status} $textType,
  )
''');
  }

  // Insert some records
  Future create(Items note) async {
    final db = await instance.database;

    final id = await db.insert(tableItems, note.toMap());
    print('inserted: $id');
  }

// Get the records by Id
  Future<Items> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableItems,
      columns: ItemsFields.values,
      where: '${ItemsFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Items.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

// Get the records
  Future<List<Items>> readAllNotes() async {
    final db = await instance.database;

    const orderBy = '${ItemsFields.createdAt} ASC';

    final result = await db.query(tableItems, orderBy: orderBy);

    return result.map((json) => Items.fromMap(json)).toList();
  }

// Update some record
// print('updated: $count');
  Future<int> update(Items note) async {
    final db = await instance.database;

    return db.update(
      tableItems,
      note.toMap(),
      where: '${ItemsFields.id} = ?',
      whereArgs: [note.id],
    );
  }

// Delete a record
  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableItems,
      where: '${ItemsFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
