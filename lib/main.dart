import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_dice/dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Dice dice = Dice(size: 45);
  late Timer timer;
  dynamic resultNum = 0;
  String resultView = '';
  bool isStart = false;

  void start() {
    if (!isStart & dice.dice.isNotEmpty) {
      timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        dice.shake();
        setState(() {
          resultNum = dice.dice[0];
          isStart = true;
        });
      });
    }
  }

  void pickUp() {
    if (dice.dice.isNotEmpty && isStart) {
      setState(() {
        //  resultView = resultView + ' ' + dice.pick().toString();
        resultView = '$resultView ${dice.pick()}';
      });
      if (dice.dice.isEmpty) {
        //클래스이름.안에변수이름
        timer.cancel();
        setState(() {
          isStart = false;
          resultNum = '끝!!';
        });
      }
    }
  }

  //초기화
  //결과를 지우기
  //배열을 다시 초기화=> 원래 크기로 만들기
  void reset() {
    setState(() {
      resultNum = '';
      resultView = '';
      dice.init();
      if (isStart) {
        timer.cancel();
      }
      isStart = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Flexible(
                flex: 2,
                child: Center(
                  child: Text(
                    '$resultNum',
                    style: const TextStyle(fontSize: 60),
                  ),
                )),
            Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    resultView,
                    style: const TextStyle(fontSize: 20),
                  ),
                )),
            Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        iconSize: 100,
                        onPressed: start,
                        icon: const Icon(
                          Icons.play_circle,
                        )),
                    IconButton(
                        iconSize: 100,
                        onPressed: pickUp,
                        icon: const Icon(Icons.check_circle_outline)),
                    IconButton(
                        iconSize: 100,
                        onPressed: reset,
                        icon:
                            const Icon(Icons.settings_backup_restore_outlined)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
