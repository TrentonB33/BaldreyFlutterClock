// Copyright 2020 Bytes of Business, LLC All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:digital_clock/info_section.dart';
import 'package:digital_clock/themes.dart';
import 'package:digital_clock/weather_anim.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'time_section.dart';
import 'package:digital_clock/inherited_clock_model.dart';

/// A Digital Clock that literally shows you the weather!
///
/// This widget is the root widget for the Weather Clock, submitted for the
/// 2020 Flutter Clock Competition! It utilizes an inherited widget to pass along
/// the clock model data to all lower widgets.

class WeatherClock extends StatelessWidget {
  const WeatherClock(this.model);

  /// The Provided Clock Model
  ///
  /// This model tracks all relevant clock peripheral data, such as time format
  /// settings, weather information, and the like. It's passed to lower widgets
  /// though the InheritedClockBuilder.
  /// We imagine that you're listening to LoFi style music when you look at this
  /// clock. We sure were when we developed it.
  final ClockModel model;

  @override
  Widget build(BuildContext context) {
    return InheritedClockModel(
      model: model,
      child: WeatherTheme(
        child: Stack(children: <Widget>[
          WeatherAnim(),
          Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: TimeSection(),
              ),
              Expanded(
                child: Center(
                  child: InfoSection(),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
