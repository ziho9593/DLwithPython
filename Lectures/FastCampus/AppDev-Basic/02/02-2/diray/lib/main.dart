import 'package:diray/data/database.dart';
import 'package:diray/write.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'data/diary.dart';
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
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectIndex = 0;
  final dbHelper = DatabaseHelper.instance;
  Diary? todayDiary;
  Diary? historyDiary;
  DateTime time =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime _focusedDay = DateTime.now();

  Diary basicDiary = Diary(
      date: Utils.getFormatTime(DateTime.now()),
      title: "",
      memo: "",
      status: 0,
      image: "assets/img/b1.jpg");

  List<Diary> allDiaries = [];
  List<String> statusImg = [
    "assets/img/ico-weather.png",
    "assets/img/ico-weather_2.png",
    "assets/img/ico-weather_3.png",
  ];

  void getTodayDiary() async {
    List<Diary> diary =
        await dbHelper.getDiaryByDate(Utils.getFormatTime(DateTime.now()));
    if (diary.isNotEmpty) {
      todayDiary = diary.first;
    }
    setState(() {});
  }

  void getAllDiary() async {
    allDiaries = await dbHelper.getAllDiary();
  }

  @override
  void initState() {
    super.initState();
    getTodayDiary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: getPage()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (selectIndex == 0) {
            Diary _d;
            if (todayDiary != basicDiary) {
              _d = todayDiary!;
            } else {
              _d = basicDiary;
            }
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => DiaryWritePage(
                      diary: _d,
                    )));
            getTodayDiary();
          } else {
            Diary _d;
            if (todayDiary != basicDiary) {
              _d = historyDiary!;
            } else {
              _d = basicDiary;
            }
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => DiaryWritePage(
                      diary: _d,
                    )));
            getDiaryByDate(time);
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.today), label: "오늘"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded), label: "기록"),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: "통계"),
        ],
        onTap: (idx) {
          setState(() {
            selectIndex = idx;
          });
          if (selectIndex == 2) {
            getAllDiary();
          }
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget getPage() {
    if (selectIndex == 0) {
      return getTodayPage();
    } else if (selectIndex == 1) {
      return getHistoryPage();
    } else if (selectIndex == 2) {
      return getChartPage();
    }
    return Container();
  }

  Widget getTodayPage() {
    if (todayDiary == basicDiary) {
      return Container(
        child: const Text("일기를 작성해주세요."),
      );
    }
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              todayDiary!.image!,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
              child: ListView(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${DateTime.now().month}.${DateTime.now().day}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Image.asset(statusImg[todayDiary!.status!],
                        fit: BoxFit.contain)
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todayDiary!.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 12,
                    ),
                    Text(
                      todayDiary!.memo,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  void getDiaryByDate(DateTime date) async {
    List<Diary> d = await dbHelper.getDiaryByDate(Utils.getFormatTime(date));
    setState(() {
      if (d.isEmpty) {
        historyDiary = Diary(
            date: Utils.getFormatTime(time),
            title: "",
            memo: "",
            status: 0,
            image: "assets/img/b1.jpg");
      } else {
        historyDiary = d.first;
      }
    });
  }

  Widget getHistoryPage() {
    return Container(
      child: ListView.builder(
        itemBuilder: (ctx, idx) {
          if (idx == 0) {
            return TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(1000),
              lastDay: DateTime(3000),
              selectedDayPredicate: (day) {
                return isSameDay(time, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                time = selectedDay;
                getDiaryByDate(time);
                setState(() {
                  time = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
            );
          } else if (idx == 1) {
            if (historyDiary == basicDiary) {
              return Container();
            }
            Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${time.month}.${time.day}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Image.asset(statusImg[historyDiary!.status!],
                          fit: BoxFit.contain)
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        historyDiary!.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 12,
                      ),
                      Text(
                        historyDiary!.memo,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Image.asset(historyDiary!.image!, fit: BoxFit.cover),
                    ],
                  ),
                )
              ],
            );
          }
          return Container();
        },
        itemCount: 2,
      ),
    );
  }

  Widget getChartPage() {
    return Container(
        child: ListView.builder(
      itemBuilder: (ctx, idx) {
        if (idx == 0) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(statusImg.length, (_idx) {
                return Container(
                  child: Column(
                    children: [
                      Image.asset(
                        statusImg[_idx],
                        fit: BoxFit.contain,
                      ),
                      Text(
                          "${allDiaries.where((element) => element.status == _idx).length}개")
                    ],
                  ),
                );
              }),
            ),
          );
        } else if (idx == 1) {
          return Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: List.generate(
                allDiaries.length,
                (_idx) {
                  return Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.asset(
                      allDiaries[_idx].image!,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          );
        }
        return Container();
      },
      itemCount: 5,
    ));
  }
}
