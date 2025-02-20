import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lab2_clock/widgets/generic/large_text.dart';

class DigitalClock extends StatefulWidget {
  final String timeFormat; // can also be '12'

  const DigitalClock({super.key, this.timeFormat = '24'});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  String hours = '??';
  String minutes = '??';

  _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      final now = DateTime.now();

      setState(() {
        if (widget.timeFormat == '12') {
          hours = (now.hour % 12).toString().padLeft(2, '0');
        } else {
          hours = now.hour.toString().padLeft(2, '0');
        }
        minutes = now.minute.toString().padLeft(2, '0');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return LargeText(
      text:
          '$hours:$minutes${widget.timeFormat == '12' ? ' ${DateTime.now().hour < 12 ? 'am' : 'pm'}' : ''}',
    );
  }
}
