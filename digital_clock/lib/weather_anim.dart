import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class WeatherAnim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FlareActor("third_party/sunny.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "Untitled");
  }
}
