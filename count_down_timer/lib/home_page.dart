import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int timeLeft = 5;
  bool _isRunning = false;

  void _startCountDown() async {
    if (_isRunning) return; // prevent multiple taps
    _isRunning = true;
    timeLeft = 5;

    for (int i = timeLeft; i > 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      if (!mounted) return;
      setState(() {
        timeLeft--;
      });
    }

    _isRunning = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              timeLeft == 0 ? 'D O N E' : timeLeft.toString(),
              style: TextStyle(fontSize: 70),
            ),
            MaterialButton(
              onPressed: _startCountDown,
              child: Text('S T A R T', style: TextStyle(color: Colors.white)),
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
