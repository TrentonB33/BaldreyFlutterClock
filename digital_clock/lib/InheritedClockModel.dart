import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

class InheritedClockModel extends InheritedWidget {
  const InheritedClockModel({
    Key key,
    @required this.model,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  final ClockModel model;

  static InheritedClockModel of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedClockModel>();
  }

  @override
  bool updateShouldNotify(InheritedClockModel old) {
    return model != old.model;
  }
}
