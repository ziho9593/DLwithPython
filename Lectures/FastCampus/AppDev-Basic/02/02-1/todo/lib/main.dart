import 'package:flutter/material.dart';
import 'package:todo/data/database.dart';
import 'package:todo/write.dart';

import 'data/todo.dart';
import 'data/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectIndex = 0;
  final dbHelper = DatabaseHelper.instance;
  List<Todo> todos = [];

  void getTodayTodo() async {
    todos = await dbHelper.getTodoByDate(Utils.getFormatTime(DateTime.now()));
    setState(() {});
  }

  void getAllTodo() async {
    allTodo = await dbHelper.getAllTodo();
    setState(() {});
  }

  @override
  void initState() {
    getTodayTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(),
        preferredSize: Size.fromHeight(0),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          /* write 페이지로 화면 이동 */
          Todo todo = await Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => TodoWritePage(
                    todo: Todo(
                        title: "",
                        color: 0,
                        memo: "",
                        done: 0,
                        category: "",
                        date: Utils.getFormatTime(DateTime.now())),
                  )));
          getTodayTodo();
        },
      ),
      body: getPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.today_outlined), label: "오늘"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined), label: "기록"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "더 보기"),
        ],
        currentIndex: selectIndex,
        onTap: (idx) {
          if (idx == 1) {
            getAllTodo();
          }
          setState(() {
            selectIndex = idx;
          });
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget getPage() {
    if (selectIndex == 0) {
      return getMain();
    } else {
      return getHistory();
    }
  }

  Widget getMain() {
    return ListView.builder(
      itemBuilder: (ctx, idx) {
        if (idx == 0) {
          return Container(
              child: Text(
                "오늘 하루",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20));
        } else if (idx == 1) {
          List<Todo> undone = todos.where((t) {
            return t.done == 0;
          }).toList();
          return Container(
            child: Column(
              children: List.generate(undone.length, (_idx) {
                Todo t = undone[_idx];
                return InkWell(
                  child: TodoCardWidget(t: t),
                  onTap: () async {
                    setState(() {
                      if (t.done == 0) {
                        t.done = 1;
                      } else {
                        t.done = 0;
                      }
                    });
                    await dbHelper.insertTodo(t);
                  },
                  onLongPress: () async {
                    getTodayTodo();
                  },
                );
              }),
            ),
          );
        } else if (idx == 2) {
          return Container(
              child: Text(
                "완료된 하루",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20));
        } else if (idx == 3) {
          List<Todo> done = todos.where((t) {
            return t.done == 1;
          }).toList();
          return Container(
            child: Column(
              children: List.generate(done.length, (_idx) {
                Todo t = done[_idx];
                return InkWell(
                  child: TodoCardWidget(t: t),
                  onTap: () {
                    setState(() {
                      if (t.done == 0) {
                        t.done = 1;
                      } else {
                        t.done = 0;
                      }
                    });
                  },
                  onLongPress: () async {
                    getTodayTodo();
                  },
                );
              }),
            ),
          );
        }
        return Container();
      },
      itemCount: 4,
    );
  }

  List<Todo> allTodo = [];

  Widget getHistory() {
    return ListView.builder(
      itemBuilder: (ctx, idx) {
        return TodoCardWidget(t: allTodo[idx]);
      },
      itemCount: allTodo.length,
    );
  }
}

class TodoCardWidget extends StatelessWidget {
  final Todo t;

  TodoCardWidget({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int now = Utils.getFormatTime(DateTime.now());
    DateTime time = Utils.numberToDatetime(t.date!);

    return Container(
      decoration: BoxDecoration(
          color: Color(t.color!), borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.title!,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                t.done == 0 ? "미완료" : "완료",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Container(height: 8),
          Text(
            t.memo!,
            style: TextStyle(color: Colors.white),
          ),
          now == t.date
              ? Container()
              : Text(
                  "${time.month}월 ${time.day}일",
                  style: TextStyle(color: Colors.white),
                )
        ],
      ),
    );
  }
}
