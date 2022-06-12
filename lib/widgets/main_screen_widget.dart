import 'dart:math';
import 'package:flutter/material.dart';

///This widget contains fields that affect how it looks.
class MainScreenWidget extends StatefulWidget {
  ///widget constructor.
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
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
