import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:stopwatch/Button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int seconds = 0;
  int minutes = 0;
  int milliseconds = 0;

  int runningTime = 0; //in milliseconds
  bool isRunning = false;
  late final Timer _timer;

  void reset() {
    setState(() {
      minutes = 0;
      seconds = 0;
      milliseconds = 0;
      isRunning = false;
      runningTime = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (isRunning) {
        //internal logic of stopwatch
        runningTime += 100;
        if (runningTime ~/ 60000 >= 60) {
          reset();
        }
        if (runningTime ~/ 60000 != minutes ||
            (runningTime % 60000) ~/ 1000 != seconds) {
          //selective setState
          setState(() {
            minutes = runningTime ~/ 60000;
            seconds = (runningTime % 60000) ~/ 1000;
          });
        }
        setState(() {
          //milliseconds are always changing ever 100 ms
          milliseconds = (runningTime % 1000) ~/ 10;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade400,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Stopwatch',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: isRunning ? 1 : 0.5,
            duration: Duration(seconds: 1),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          minutes.toString().padLeft(2, '0'),
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        Text(
                          ':',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        Text(
                          seconds.toString().padLeft(2, '0'),
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      milliseconds.toString().padLeft(2, '0'),
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: MediaQuery.sizeOf(context).width * 0.85,
                  child: CircularProgressIndicator(
                    value: 1,
                    color: Colors.white,
                    strokeWidth: 7.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    reset();
                  },
                  icon: Icon(
                    Icons.loop,
                    size: 50,
                  )),
              SizedBox(
                width: 15,
              ),
              Button(
                onPressed: () {
                  HapticFeedback.lightImpact();
                  setState(() {
                    isRunning = !isRunning;
                  });
                },
                icon: Icon(
                  isRunning ? Icons.pause : Icons.play_arrow,
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
