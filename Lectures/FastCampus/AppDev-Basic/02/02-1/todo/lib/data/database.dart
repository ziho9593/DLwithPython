import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/data/todo.dart';

class DatabaseHelper {
  static final _databaseName = "todo.db";
  static final _databaseVersion = 1;
  static final todoTable = "todo";

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
    CREATE TABLE IF NOT EXISTS $todoTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      date INTEGER DEFAULT 0, 
      done INTEGER DEFAULT 0,
      title String,
      memo String,
      color INTEGER,
      category String
    )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  /* 입력, 수정, 불러오기 */
  Future<int> insertTodo(Todo todo) async {
    Database db = await instance.database;

    if (todo.id == null) {
      /* 새로 추가 */
      Map<String, dynamic> row = {
        "title": todo.title,
        "date": todo.date,
        "done": todo.done,
        "memo": todo.memo,
        "color": todo.color,
        "category": todo.category,
      };
      return await db.insert(todoTable, row);
    } else {
      Map<String, dynamic> row = {
        "title": todo.title,
        "date": todo.date,
        "done": todo.done,
        "memo": todo.memo,
        "color": todo.color,
        "category": todo.category,
      };
      return await db
          .update(todoTable, row, where: "id = ?", whereArgs: [todo.id]);
    }
  }

  Future<List<Todo>> getAllTodo() async {
    Database db = await instance.database;
    List<Todo> todos = [];

    var queries = await db.query(todoTable);

    for (var q in queries) {
      todos.add(Todo(
        id: q["id"] as int,
        title: q["title"] as String,
        date: q["date"] as int,
        done: q["done"] as int,
        memo: q["memo"] as String,
        category: q["category"] as String,
        color: q["color"] as int,
      ));
    }

    return todos;
  }

  Future<List<Todo>> getTodoByDate(int date) async {
    Database db = await instance.database;
    List<Todo> todos = [];

    var queries =
        await db.query(todoTable, where: "date = ?", whereArgs: [date]);

    for (var q in queries) {
      todos.add(Todo(
        id: q["id"] as int,
        title: q["title"] as String,
        date: q["date"] as int,
        done: q["done"] as int,
        memo: q["memo"] as String,
        category: q["category"] as String,
        color: q["color"] as int,
      ));
    }

    return todos;
  }
}
