import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Flexible(
                flex: 2,
                child: Center(
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 60),
                  ),
                )),
            const Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    '결과',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        iconSize: 100,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_circle,
                        )),
                    IconButton(
                        iconSize: 100,
                        onPressed: () {},
                        icon: const Icon(Icons.check_circle_outline)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
