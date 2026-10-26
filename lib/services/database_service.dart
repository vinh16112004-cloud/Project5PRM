import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/photo.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;

  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('photos_app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE PhoTo(
        id INTEGER PRIMARY KEY,
        title TEXT,
        url TEXT,
        thumbnailUrl TEXT
      )
    ''');
  }

  Future<void> insertPhoto(Photo photo) async {
    final db = await database;
    await db.insert(
      'PhoTo',
      photo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deletePhoto(int id) async {
    final db = await database;
    await db.delete(
      'PhoTo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Photo>> getWishlistPhotos() async {
    final db = await database;
    final result = await db.query('PhoTo');
    return result.map((map) => Photo.fromMap(map)).toList();
  }

  Future<bool> isFavorite(int id) async {
    final db = await database;
    final result = await db.query(
      'PhoTo',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }
}