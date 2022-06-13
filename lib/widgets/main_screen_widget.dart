import 'dart:async';
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
  final _textKey = GlobalKey();
  late var _backgroundColor = GenerateRandomColor.getColor();
  late var _textColor = _backgroundColor;

  late Timer _updateTimer;

  bool _startAnimarion = false;

  double _xPosition = 0.0;
  double _yPosition = 0.0;
  double _xOffset = 10.0;
  double _yOffset = 10.0;
  @override
  void dispose() {
    _updateTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _scheduleUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            setState(
              () {
                _backgroundColor = GenerateRandomColor.getColor();
                _startAnimarion = !_startAnimarion;
              },
            );
          },
          child: ColoredBox(
            color: _backgroundColor,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 100),
                  top: _yPosition,
                  left: _xPosition,
                  child: Center(
                    child: Text(
                      'Hey there',
                      key: _textKey,
                      style: TextStyle(color: _textColor, fontSize: 50),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _update() {
    final screenConstraints =
        (context.findRenderObject() as RenderBox).constraints;
    final textSize =
        (_textKey.currentContext?.findRenderObject() as RenderBox).size;

    if (_xPosition + textSize.width >= screenConstraints.maxWidth ||
        _xPosition < 0) {
      _xOffset = -_xOffset;
      _textColor = GenerateRandomColor.getColor();
    }
    if (_yPosition + textSize.height >= screenConstraints.maxHeight ||
        _yPosition < 0) {
      _yOffset = -_yOffset;
      _textColor = GenerateRandomColor.getColor();
    }

    setState(() {
      _xPosition += _xOffset;
      _yPosition += _yOffset;
    });
    _scheduleUpdate();
  }

  void _scheduleUpdate() {
    _updateTimer = Timer(
      const Duration(milliseconds: 100),
      _update,
    );
  }
}

///This class have static methot which generate random color
class GenerateRandomColor {
  ///Initialize random
  static Random random = Random();

  ///Function for generate random color
  static Color getColor() {
    return Color.fromARGB(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
