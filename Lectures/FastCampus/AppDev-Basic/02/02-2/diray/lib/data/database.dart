import 'package:diray/data/diary.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "diary.db";
  static const _databaseVersion = 1;
  static const diaryTable = "diary";

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  _initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS $diaryTable (
      date INTEGER DEFAULT 0, 
      title String,
      memo String,
      image String,
      status INTEGER DEFAULT 0
    )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  /* 입력, 수정, 불러오기 */
  Future<int> insertDiary(Diary diary) async {
    Database db = await instance.database;

    List<Diary> d = await getDiaryByDate(diary.date);

    if (d.isEmpty) {
      /* 새로 추가 */
      Map<String, dynamic> row = {
        "title": diary.title,
        "date": diary.date,
        "memo": diary.memo,
        "status": diary.status,
        "image": diary.image,
      };
      return await db.insert(diaryTable, row);
    } else {
      /* 내용 불러오기 */
      Map<String, dynamic> row = {
        "title": diary.title,
        "date": diary.date,
        "memo": diary.memo,
        "status": diary.status,
        "image": diary.image,
      };
      return await db
          .update(diaryTable, row, where: "date = ?", whereArgs: [diary.date]);
    }
  }

  Future<List<Diary>> getAllDiary() async {
    Database db = await instance.database;
    List<Diary> diarys = [];

    var queries = await db.query(diaryTable);

    for (var q in queries) {
      diarys.add(Diary(
        title: q["title"] as String,
        date: q["date"] as int,
        memo: q["memo"] as String,
        image: q["image"] as String,
        status: q["status"] as int,
      ));
    }

    return diarys;
  }

  Future<List<Diary>> getDiaryByDate(int date) async {
    Database db = await instance.database;
    List<Diary> diarys = [];

    var queries =
        await db.query(diaryTable, where: "date = ?", whereArgs: [date]);

    for (var q in queries) {
      diarys.add(Diary(
        title: q["title"] as String,
        date: q["date"] as int,
        memo: q["memo"] as String,
        image: q["image"] as String,
        status: q["status"] as int,
      ));
    }

    return diarys;
  }
}
