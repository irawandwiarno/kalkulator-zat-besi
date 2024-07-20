import 'dart:async';
import 'package:intl/intl.dart';
import 'package:kalkulator_zat_besi/models/konsumsi_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _dbName = 'konsumsi.db';
  static const _dbVersion = 1;
  static const _tableName = 'konsumsi';
  static const columnId = '_id';
  static const columnDate = 'date';
  static const columnDataKonsumsi = 'dataKonsumsi';
  static const columnKebutuhanIron = 'kebutuhanIron';

  // Singleton class instance
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Database reference
  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database!;
  }




  _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _dbName);

    return await openDatabase(path,
        version: _dbVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnDate TEXT NOT NULL,
            $columnDataKonsumsi TEXT NOT NULL,
            $columnKebutuhanIron REAL NOT NULL
          )
          ''');
  }

  Future<int> insert(Konsumsi konsumsi) async {
    Database db = await instance.database;
    // Hapus 'id' dari daftar kolom dalam query INSERT
    return await db.insert(
        _tableName,
        konsumsi.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace // Atau gunakan ConflictAlgorithm.ignore jika Anda ingin mengabaikan konflik
    );
  }


  Future<Konsumsi?> getAllByDate(DateTime date) async {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    String formattedDate = dateFormat.format(date);
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName,
        where: '$columnDate = ?',
        whereArgs: [formattedDate]);

    // Jika tidak ada entri yang cocok, maps akan kosong
    if (maps.isEmpty) {
      return null;
    } else {
      // Jika ada entri, ambil yang pertama dan ubahnya menjadi Konsumsi
      return Konsumsi.fromMap(maps.first);
    }
  }

  Future<List<Konsumsi>> getAllData() async {
    try {
      final List<Map<String, dynamic>> maps = await _database!.query('$_tableName');
      return List.generate(maps.length, (i) => Konsumsi.fromMap(maps[i]));
    } catch (e) {
      print('Failed to query mangas: $e');
      return [];
    }
  }


  Future<int> updateByDate(Konsumsi newKonsumsi) async {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    String formattedDate = dateFormat.format(newKonsumsi.date);
    Database db = await instance.database;
    try {
      return await db.update(
          _tableName,
          newKonsumsi.toMap(),
          where: '$columnDate = ?',
          whereArgs: [formattedDate],
          conflictAlgorithm: ConflictAlgorithm.replace // Atur sesuai kebutuhan
      );
    } catch (e) {
      print("Gagal memperbarui data: $e");
      throw e; // Aturan: lepaskan kesalahan jika Anda ingin menanggapinya lebih tinggi di aplikasi
    }
  }

  Future<void> deleteAll() async {
    Database db = await instance.database;
    try {
      await db.delete(_tableName); // Menghapus semua data dari tabel
    } catch (e) {
      print("Gagal menghapus semua data: $e");
      throw e; // Aturan: lepaskan kesalahan jika Anda ingin menanggapinya lebih tinggi di aplikasi
    }
  }
}
