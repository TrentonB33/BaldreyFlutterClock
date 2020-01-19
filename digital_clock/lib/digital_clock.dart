// Copyright 2020 Bytes of Business All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum _Element {
  background,
  text,
  shadow,
}

final _lightTheme = {
  _Element.background: Color(0xFF81B3FE),
  _Element.text: Colors.grey,
  _Element.shadow: Colors.grey[800],
};

final _darkTheme = {
  _Element.background: Colors.black,
  _Element.text: Colors.white,
  _Element.shadow: Colors.red,
};

/// A basic digital clock.
///
/// You can do better than this!
class DigitalClock extends StatefulWidget {
  const DigitalClock(this.model);

  final ClockModel model;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(DigitalClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {});
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

    //Model Variables
    final String temperature = widget.model.temperatureString;
    final String location = widget.model.location;
    final String weather = widget.model.weatherString;

    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);
    final width = MediaQuery.of(context).size.width / 3.5;
    final fontSize = width;
    final defaultStyle = TextStyle(
      color: colors[_Element.text],
      fontFamily: 'C800',
      fontSize: fontSize,
    );
    // print('Font size is: $fontSize');
    // print('Widthis: $width');

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Text(
          "$weather",
          style: TextStyle(
            fontSize: width,
            color: Colors.amber,
          ),
        ),
        Positioned(
          top: 10,
          bottom: 10,
          child: Center(
            child: DefaultTextStyle(
              style: defaultStyle,
              child: Column(
                children: <Widget>[
                  Text(
                    '$hour:$minute',
                  ),
                  Text(
                    "$location",
                    style: TextStyle(
                      fontSize: width / 17,
                    ),
                  ),
                  Text(
                    'Temperature: $temperature',
                    style: TextStyle(
                      fontSize: width / 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
