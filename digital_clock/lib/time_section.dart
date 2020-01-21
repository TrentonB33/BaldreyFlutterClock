// Copyright 2020 Bytes of Business, LLC. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:digital_clock/inherited_clock_model.dart';
import 'package:flutter/material.dart';
import 'package:digital_clock/clock_time.dart';
import 'package:intl/intl.dart';

/// This stateful widget handles the updating of the time portion of the clock.
///
/// TimeSection is one of the two primary sections of the WeatherClock. This section
/// handles what all clocks are originally made for: telling the time. It's
/// generally the same code as the starting project, but doesn't bother with
/// keeping track of the state of the Model. It utilizes a [CustomPainter] to
/// Cut Out the time in order to see the animates behind the widget.
class TimeSection extends StatefulWidget {
  const TimeSection();

  @override
  _TimeSectionState createState() => _TimeSectionState();
}

class _TimeSectionState extends State<TimeSection> {
  ///Used to track the current time to be displayed.
  DateTime _dateTime = DateTime.now();

  ///Used to update _dateTime on a regular basis.
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
    });
  }

  @override
  Widget build(BuildContext context) {
    final hour = DateFormat(
            InheritedClockModel.of(context).model.is24HourFormat ? 'HH' : 'hh')
        .format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);
    final width = MediaQuery.of(context).size.width;
    final fontSize = width / 3.6;

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
