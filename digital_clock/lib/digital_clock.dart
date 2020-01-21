// Copyright 2020 Bytes of Business All rights reserved.
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

/// A basic digital clock.
///
/// You can do better than this!

class DigitalClock extends StatelessWidget {
  const DigitalClock(this.model);

  final ClockModel model;

  @override
  Widget build(BuildContext context) {
    return InheritedClockModel(
      model: model,
      child: WeatherTheme(
        child: Stack(children: <Widget>[
          Container(color: Theme.of(context).backgroundColor),
          WeatherAnim(),
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
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
