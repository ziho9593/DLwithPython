import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:mise/data/api.dart';

import 'data/mise.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize without device test ids.
  Admob.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
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
  List<Color> colors = [
    const Color(0xFF0077c2),
    const Color(0xFF009ba9),
    const Color(0xfffe6300),
    const Color(0xFFd80019),
  ];
  List<String> icon = [
    "assets/img/happy.png",
    "assets/img/sad.png",
    "assets/img/bad.png",
    "assets/img/angry.png"
  ];
  List<String> status = ["좋음", "보통", "나쁨", "매우나쁨"];
  String stationName = "구로구";
  List<Mise> data = [];

  int getStatus(Mise mise) {
    if (mise.pm10! > 150) {
      return 3;
    } else if (mise.pm10! > 80) {
      return 2;
    } else if (mise.pm10! > 30) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    getMiseData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String l = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => LocationPage()));

          InAppReview.instance.requestReview();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.location_on),
      ),
    );
  }

  Widget getPage() {
    if (data.isEmpty) {
      return Center(
        child: Container(
          child: const Text("Data is empty."),
        ),
      );
    }

    int _status = getStatus(data.first);
    return Container(
      color: colors[_status],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 60,
          ),
          const Text(
            "현재 위치",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 12,
          ),
          Text("[${stationName}]"),
          Container(
            height: 60,
          ),
          Container(
            width: 200,
            height: 200,
            child: Image.asset(
              icon[_status],
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: 60,
          ),
          Text(status[_status],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Container(
            height: 20,
          ),
          Text("통합 환경 대기 지수 : ${data.first.khai}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.white)),
          Expanded(
            child: Container(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                data.length,
                (idx) {
                  Mise mise = data[idx];
                  int _status = getStatus(mise);
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          mise.dataTime!.replaceAll(" ", "\n"),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          height: 8,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            icon[_status],
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          height: 8,
                        ),
                        Text(
                          "${mise.pm10}ug/m2",
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  );
                },
              ),
            )),
          ),
          AdmobBanner(
            adSize: AdmobBannerSize.BANNER,
            adUnitId: AdmobBanner.testAdUnitId,
          ),
          Container(
            height: 30,
          )
        ],
      ),
    );
  }

  void getMiseData() async {
    MiseApi api = MiseApi();
    data = await api.getMiseData(stationName);
    data.removeWhere((m) => m.pm10 == 0);
    setState(() {});
  }
}

class LocationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocationPageState();
  }
}

class _LocationPageState extends State<LocationPage> {
  List<String> locations = [
    "구로구",
    "동작구",
    "마포구",
    "강남구",
    "강동구",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: List.generate(locations.length, (idx) {
          return ListTile(
            title: Text(locations[idx]),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop(locations[idx]);
            },
          );
        }),
      ),
    );
  }
}
