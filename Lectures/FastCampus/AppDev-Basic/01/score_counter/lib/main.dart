import 'package:flutter/material.dart';

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
  int _counter = 0;
  int count1 = 0;
  int count2 = 0;
  String vicTeam = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(height: 50,),
          Text("탁구 대회", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          Container(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("패스트 대학"),
              Text("캠퍼스 대학"),
            ],
          ),
          Container(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("$count1점", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Text("$count2점", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ],
          ),
          Container(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          count1 += 1;
                          if (count1 > 10) {
                            vicTeam = "패스트 대학 승리!!!";
                          }
                        });
                      },
                      icon: Icon(Icons.add))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        count1 -= 1;
                      });
                  },
                    icon: Icon(Icons.remove)
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          count2 += 1;
                          if (count2 > 10) {
                            vicTeam = "캠퍼스 대학 승리!!!";
                          }
                        });
                      },
                      icon: Icon(Icons.add))
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          count2 -= 1;
                        });
                      },
                      icon: Icon(Icons.remove)
                  )
                ],
              ),
            ],
          ),
          Container(height: 20,),
          Text(vicTeam, style: TextStyle(fontSize: 50, color: Colors.green))
        ],
      ),
    );
  }
}
