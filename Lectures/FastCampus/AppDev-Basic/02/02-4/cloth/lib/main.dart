import 'package:cloth/cloth.dart';
import 'package:cloth/data/api.dart';
import 'package:cloth/data/preference.dart';
import 'package:cloth/location.dart';
import 'package:cloth/utils.dart';
import 'package:flutter/material.dart';

import 'data/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> clothes = [
    "assets/img/shirt.png",
    "assets/img/short.png",
    "assets/img/pants.png",
  ];
  List<ClothTmp> tmpCloth = [];
  List<Weather> weather = [];
  late Weather current;
  LocationData location =
      LocationData(name: "강남구", lat: 37.498122, lng: 127.827565, x: 0, y: 0);
  List<String> sky = [
    "assets/img/sky1.png",
    "assets/img/sky2.png",
    "assets/img/sky3.png",
    "assets/img/sky4.png",
  ];
  List<String> status = [
    "날이 아주 좋아요!",
    "산책하기 좋겠어요",
    "오늘은 흐리네요",
    "우산 꼭 챙겨요!!!",
  ];
  List<Color> color = [
    const Color(0xFFf78144),
    const Color(0xFF1d9fea),
    const Color(0xFF523de4),
    const Color(0xFF587d9a),
  ];
  int level = 0;

  void getWeather() async {
    final api = WeatherApi();
    final now = DateTime.now();
    Map<String, int> xy = Utils.latLngToXY(location.lat!, location.lng!);

    final pref = Preference();
    tmpCloth = (await pref.getTmp())!;

    int time2 = int.parse("${now.hour}10");
    String _time = "";
    if (time2 > 2300) {
      _time = "2300";
    } else if (time2 > 2000) {
      _time = "2000";
    } else if (time2 > 1700) {
      _time = "1700";
    } else if (time2 > 1400) {
      _time = "1400";
    } else if (time2 > 1100) {
      _time = "1100";
    } else if (time2 > 800) {
      _time = "0800";
    } else if (time2 > 500) {
      _time = "0500";
    } else {
      _time = "0200";
    }

    weather = (await api.getWeather(
        xy["nx"]!, xy["ny"]!, Utils.getFormatTime(DateTime.now()), "0800"))!;

    int time = int.parse("${now.hour}00");
    weather.removeWhere((w) => w.time < time);

    current = weather.first;

    clothes = tmpCloth.firstWhere((t) => t.tmp < current.tmp!).cloth!;
    level = getLevel(current);
    setState(() {});
  }

  int getLevel(Weather w) {
    if (w.sky! > 8) {
      return 3;
    } else if (w.sky! > 5) {
      return 2;
    } else if (w.sky! > 2) {
      return 1;
    }
    return 0;
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => ClothPage()));
                getWeather();
              },
              icon: Icon(Icons.category))
        ],
      ),
      backgroundColor: color[level],
      body: weather.isEmpty
          ? Center(
              child: Container(
                child: Text(
                  "날씨 정보를 불러오고 있어요",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            )
          : Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 100,
                  ),
                  Text(
                    "${location.name}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    alignment: Alignment.centerRight,
                    child: Image.asset(sky[level]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${current.tmp}°C",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      Column(
                        children: [
                          Text(
                            "${Utils.stringToDatetime(current.date).month}월 ${Utils.stringToDatetime(current.date).day}일",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            "오늘은 날씨가 좋아요",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 30,
                  ),
                  Container(
                    child: Text(
                      "오늘 어울리는 복장을 추천해드려요",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  Container(
                    height: 30,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(clothes.length, (idx) {
                        return Container(
                          padding: EdgeInsets.all(8),
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            clothes[idx],
                            fit: BoxFit.contain,
                          ),
                        );
                      })),
                  Container(
                    height: 30,
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(weather.length, (idx) {
                          final w = weather[idx];
                          int _level = getLevel(w);
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "${w.tmp}°C",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                Text(
                                  "${w.pop}%",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(sky[_level]),
                                ),
                                Text(
                                  "${w.time}",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                  )
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          LocationData data = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => LocationPage()));
          if (data != null) {
            location = data;
            getWeather();
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
