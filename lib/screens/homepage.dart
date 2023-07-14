import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int initialValue = 10;
  Timer? timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        initialValue--;
        if (initialValue == 0) {
          timer.cancel();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/stopwatch.png'),
            const SizedBox(
              height: 32,
            ),
            Text(
              initialValue.toString(),
              style: const TextStyle(fontSize: 72),
            )
          ],
        ),
      ),
    );
  }
}
