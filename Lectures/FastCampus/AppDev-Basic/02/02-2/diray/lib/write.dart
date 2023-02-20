import 'package:diray/data/database.dart';
import 'package:diray/data/diary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiaryWritePage extends StatefulWidget {
  final Diary diary;

  DiaryWritePage({super.key, required this.diary});

  @override
  State<StatefulWidget> createState() {
    return _DiaryWritePageState();
  }
}

class _DiaryWritePageState extends State<DiaryWritePage> {
  List<String> images = [
    "assets/img/b1.jpg",
    "assets/img/b2.jpg",
    "assets/img/b3.jpg",
    "assets/img/b4.jpg",
  ];

  List<String> statusImg = [
    "assets/img/ico-weather.png",
    "assets/img/ico-weather_2.png",
    "assets/img/ico-weather_3.png",
  ];

  int imgIndex = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController memoController = TextEditingController();

  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.diary.title;
    memoController.text = widget.diary.memo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: const Text(
              "저장",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              widget.diary.title = nameController.text;
              widget.diary.memo = memoController.text;
              await dbHelper.insertDiary(widget.diary);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          if (idx == 0) {
            return InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                width: 100,
                height: 100,
                child: Image.asset(
                  widget.diary.image!,
                  fit: BoxFit.cover,
                ),
              ),
              onTap: () {
                widget.diary.image = images[imgIndex];
                imgIndex++;
                imgIndex %= images.length;
              },
            );
          } else if (idx == 1) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(statusImg.length, (_idx) {
                  return InkWell(
                    child: Container(
                      height: 70,
                      width: 70,
                      child: Image.asset(
                        statusImg[_idx],
                        fit: BoxFit.contain,
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: _idx == widget.diary.status
                                  ? Colors.blue
                                  : Colors.transparent),
                          borderRadius: BorderRadius.circular((100))),
                    ),
                    onTap: () {
                      setState(() {
                        widget.diary.status = _idx;
                      });
                    },
                  );
                }),
              ),
            );
          } else if (idx == 2) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: const Text(
                "제목",
                style: TextStyle(fontSize: 20),
              ),
            );
          } else if (idx == 3) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: nameController,
              ),
            );
          } else if (idx == 4) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: const Text(
                "내용",
                style: TextStyle(fontSize: 20),
              ),
            );
          } else if (idx == 5) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: TextField(
                controller: memoController,
                minLines: 10,
                maxLines: 20,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            );
          }
          return Container();
        },
        itemCount: 6,
      ),
    );
  }
}
