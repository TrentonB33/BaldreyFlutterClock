// Copyright 2020 Bytes of Business, LLC All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

///This is an InheritedWidget that passes along the [ClockModel] to children widgets.
///
/// InheritedClockModel takes in a model that nearly all the other children
/// widgets need data from so that it can be accessed universally.
class InheritedClockModel extends InheritedWidget {
  const InheritedClockModel({
    Key key,
    @required this.model,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  ///[ClockModel] that was provided for this contest.
  ///
  /// This model tracks things like time formatting settings, weather and the like.
  final ClockModel model;

  static InheritedClockModel of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedClockModel>();
  }

  @override
  bool updateShouldNotify(InheritedClockModel old) {
    return model != old.model;
  }
}
