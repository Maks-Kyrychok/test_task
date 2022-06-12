import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
  
class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScrinWidget(),
    );
  }
}

  
class MainScrinWidget extends StatefulWidget {
  
  const MainScrinWidget({Key? key}) : super(key: key);

  @override
  State<MainScrinWidget> createState() => _MainScrinWidgetState();
}

class _MainScrinWidgetState extends State<MainScrinWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            setState(
              () {
                _generateRandomColor();
              },
            );
          },
          child: ColoredBox(
            color: _generateRandomColor(),
            child: const Center(
              child: Text(
                'Hey there',
                //style: TextStyle(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _generateRandomColor() {
    final random = Random();
    late final colorA = random.nextInt(256);
    late final colorR = random.nextInt(256);
    late final colorG = random.nextInt(256);
    late final colorB = random.nextInt(256);
    return Color.fromARGB(colorA, colorR, colorG, colorB);
  }
}
