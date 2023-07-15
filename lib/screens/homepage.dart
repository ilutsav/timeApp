import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/model/timer_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      var timerInfo = Provider.of<TimerInfo>(context, listen: false);
      timerInfo.updateRemainingTime();

      if (timerInfo.getRemainingTime() == 0) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("===value updated====");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/stopwatch.png'),
            const SizedBox(
              height: 32,
            ),
            Consumer<TimerInfo>(
              builder: (context, data, child) {
                return Text(
                  data.getRemainingTime().toString(),
                  style: const TextStyle(fontSize: 72),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
