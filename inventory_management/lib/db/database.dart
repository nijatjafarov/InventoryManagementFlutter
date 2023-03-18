import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:inventory_management/models/goods.dart';
import 'package:inventory_management/models/report.dart';

class MyDatabase {
  static final MyDatabase instance = MyDatabase._init();

  static Database? _database;

  MyDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('goods.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const varcharType = 'VARCHAR NOT NULL';
    const floatType = 'FLOAT NOT NULL';
    const nullableFloatType = 'FLOAT';

  await db.execute('''
CREATE TABLE $tableGoods ( 
  ${GoodsFields.id} $idType, 
  ${GoodsFields.name} $varcharType,
  ${GoodsFields.measurementUnit} $varcharType,
  ${GoodsFields.quantity} $floatType,
  ${GoodsFields.purchasePrice} $floatType,
  ${GoodsFields.salesPrice} $nullableFloatType
  )
''');

  await db.execute('''
CREATE TABLE $tableReports ( 
  ${ReportFields.id} $idType, 
  ${ReportFields.date} $varcharType,
  ${ReportFields.purchaseAmount} $floatType,
  ${ReportFields.salesAmount} $floatType,
  ${ReportFields.benefit} $floatType
  )
''');

  }

  Future<Goods> createGoods(Goods goods) async {
    final db = await database;
    
    final id = await db.insert(tableGoods, goods.toJson());
    return goods.copy(id: id);
  }

  // Future<Goods> readGoods(int id) async {
  //   final db = await instance.database;

  //   final maps = await db.query(
  //     tableGoods,
  //     columns: GoodsFields.values,
  //     where: '${GoodsFields.id} = ?',
  //     whereArgs: [id],
  //   );

  //   if (maps.isNotEmpty) {
  //     return Goods.fromJson(maps.first);
  //   } else {
  //     throw Exception('ID $id not found');
  //   }
  // }

  Future<List<Goods>> readGoods() async {
  final db = await instance.database;

    // Make sure the database is still open
    if (db.isOpen) {
      final result = await db.query(tableGoods);

      return result.map((json) => Goods.fromJson(json)).toList();
    } else {
      throw Exception('Database is closed');
    }
  }

  Future<int> updateGoods(Goods goods) async {
    final db = await instance.database;

    return db.update(
      tableGoods,
      goods.toJson(),
      where: '${GoodsFields.id} = ?',
      whereArgs: [goods.id],
    );
  }

  Future<int> deleteGoods(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableGoods,
      where: '${GoodsFields.id} = ?',
      whereArgs: [id],
    );
  }

  //Reports


  Future<Report> createReport(Report report) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableGoods, report.toJson());
    return report.copy(id: id);
  }

  // Future<Report> readReport(int id) async {
  //   final db = await instance.database;

  //   final maps = await db.query(
  //     tableReports,
  //     columns: ReportFields.values,
  //     where: '${ReportFields.id} = ?',
  //     whereArgs: [id],
  //   );

  //   if (maps.isNotEmpty) {
  //     return Report.fromJson(maps.first);
  //   } else {
  //     throw Exception('ID $id not found');
  //   }
  // }

  Future<List<Report>> readReports() async {
    final db = await instance.database;

    //final orderBy = '${GoodsFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableReports, /*orderBy: orderBy*/);

    return result.map((json) => Report.fromJson(json)).toList();
  }

  Future<int> update(Report report) async {
    final db = await instance.database;

    return db.update(
      tableGoods,
      report.toJson(),
      where: '${ReportFields.id} = ?',
      whereArgs: [report.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableReports,
      where: '${ReportFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}