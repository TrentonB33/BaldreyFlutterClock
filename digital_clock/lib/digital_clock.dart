// Copyright 2020 Bytes of Business All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:digital_clock/ExtraSection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'TimeSection.dart';

/// A basic digital clock.
///
/// You can do better than this!

class DigitalClock extends StatelessWidget {
  const DigitalClock(this.model);

  final ClockModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: TimeSection(
            model,
          ),
        ),
        Expanded(
          child: ExtraSection(),
        ),
      ],
    );
  }
}
