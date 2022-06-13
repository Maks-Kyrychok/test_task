import 'package:flutter/material.dart';
import 'package:test_task/widgets/main_screen_widget.dart';

void main() => runApp(TestTask());

/// This widget is the root of application.
class TestTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreenWidget(),
    );
  }
}
