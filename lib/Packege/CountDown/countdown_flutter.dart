import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolica/Packege/CountDown/utils.dart';

class Countdown extends StatefulWidget {
  Countdown({
    Key key,
    @required this.duration,
    @required this.builder,
    this.onFinish,
    this.initialTime = const Duration(seconds: 0),
    this.interval = const Duration(seconds: 1),
  }) : super(key: key);

  final Duration duration;
  final Duration interval;
  Duration initialTime;
  final void Function() onFinish;
  final Widget Function(BuildContext context, Duration remaining) builder;
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  Timer _timer;
  Duration _duration;
  @override
  void initState() {
    //_duration = widget.duration;
    _duration = Duration(
        seconds: widget.duration.inSeconds - widget.initialTime.inSeconds);
    startTimer();

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(widget.interval, timerCallback);
  }

  void timerCallback(Timer timer) {
    setState(() {
      if (_duration.inSeconds == 0) {
        timer.cancel();
        if (widget.onFinish != null) widget.onFinish();
      } else {
        _duration = Duration(seconds: _duration.inSeconds - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _duration);
  }
}

class CountdownFormatted extends StatelessWidget {
  const CountdownFormatted({
    Key key,
    @required this.duration,
    @required this.builder,
    this.onFinish,
    this.interval = const Duration(seconds: 1),
    this.formatter,
  }) : super(key: key);

  final Duration duration;
  final Duration interval;
  final void Function() onFinish;

  /// An function to format the remaining time
  final String Function(Duration) formatter;

  final Widget Function(BuildContext context, String remaining) builder;

  Function(Duration) _formatter() {
    if (formatter != null) return formatter;
    if (duration.inHours >= 1) return formatByHours;
    if (duration.inMinutes >= 1) return formatByMinutes;

    return formatBySeconds;
  }

  @override
  Widget build(BuildContext context) {
    return Countdown(
      interval: interval,
      onFinish: onFinish,
      duration: duration,
      builder: (BuildContext ctx, Duration remaining) {
        return builder(ctx, _formatter()(remaining));
      },
    );
  }
}
