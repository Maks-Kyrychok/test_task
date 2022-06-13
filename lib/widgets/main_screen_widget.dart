import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_task/assets/constans.dart';
import 'package:test_task/assets/generate_random_color.dart';

///This widget contains fields that affect how it looks.
class MainScreenWidget extends StatefulWidget {
  ///widget constructor.
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final _textKey = GlobalKey();
  Color? _backgroundColor = GenerateRandomColor.getColor();
  Color? _textColor = GenerateRandomColor.getColor();

  Timer? _updateTimer;

  double _xPosition = 0.0;
  double _yPosition = 0.0;
  double _xOffset = 10.0;
  double _yOffset = 10.0;
  @override
  void dispose() {
    _updateTimer?.cancel();
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
              },
            );
          },
          child: ColoredBox(
            color: _backgroundColor ?? Colors.black,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 100),
                  top: _yPosition,
                  left: _xPosition,
                  child: Center(
                    child: Text(
                      bouncingText,
                      key: _textKey,
                      style: TextStyle(color: _textColor, fontSize: fontSize),
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
