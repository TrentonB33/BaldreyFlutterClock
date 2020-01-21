import 'dart:async';

import 'package:digital_clock/inherited_clock_model.dart';
import 'package:flutter/material.dart';
import 'package:digital_clock/clock_time.dart';
import 'package:intl/intl.dart';

enum _Element {
  background,
  text,
  shadow,
}

final _lightTheme = {
  _Element.background: Color(0xFF81B3FE),
  _Element.text: Colors.red,
  _Element.shadow: Colors.grey[800],
};

final _darkTheme = {
  _Element.background: Colors.black,
  _Element.text: Colors.white,
  _Element.shadow: Colors.red,
};

class TimeSection extends StatefulWidget {
  const TimeSection();

  @override
  _TimeSectionState createState() => _TimeSectionState();
}

class _TimeSectionState extends State<TimeSection>
    with SingleTickerProviderStateMixin {
  //AnimationController _controller;
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      // Update once per minute. If you want to update every second, use the
      // following code.
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
      // Update once per second, but make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      // _timer = Timer(
      //   Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
      //   _updateTime,
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;

    final hour = DateFormat(
            InheritedClockModel.of(context).model.is24HourFormat ? 'HH' : 'hh')
        .format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);
    final width = MediaQuery.of(context).size.width;
    final fontSize = width / 3.5;

    final defaultStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontFamily: 'C800',
      fontSize: fontSize,
    );

    return ClockTime(
      time: Text(
        '$hour:$minute',
        style: defaultStyle,
      ),
    );
  }
}
