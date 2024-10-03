import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimerWidget extends StatefulWidget {
  final bool startTimer;
  const CountDownTimerWidget({super.key, required this.startTimer});

  @override
  State<CountDownTimerWidget> createState() => _CountDownTimerWidgetState();
}

class _CountDownTimerWidgetState extends State<CountDownTimerWidget> {
  Duration _duration = Duration();
  Timer? _timer;
  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _duration = Duration(seconds: _duration.inSeconds + 1);
      });
    });
  }

  _stopTimer() {
    setState(() {
      _timer?.cancel();
      _timer = null;
      _duration = Duration();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_timer == null || !widget.startTimer)
      widget.startTimer ? _startTimer() : _stopTimer();
    String twoDigit(int time) => time.toString().padLeft(2, '0');
    final minutes = twoDigit(_duration.inMinutes.remainder(60));
    final seconds = twoDigit(_duration.inSeconds.remainder(60));
    final hours = twoDigit(_duration.inHours);
    return Text(
      '${hours}:${minutes}:${seconds}',
      style: TextStyle(
        fontSize: 22,
      ),
    );
  }
}
