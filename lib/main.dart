import 'package:flutter/material.dart';
import 'package:stopwatch/MainPage.dart';

void main() {
  runApp(Stopwatch());
}

class Stopwatch extends StatelessWidget {
  const Stopwatch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
