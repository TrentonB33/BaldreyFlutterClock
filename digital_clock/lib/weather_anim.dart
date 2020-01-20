import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class WeatherAnim extends StatelessWidget {
  const WeatherAnim({
    Key key,
    this.weather,
  }) : super(key: key);

  final String weather;
  @override
  Widget build(BuildContext context) {
    if (weather == "sunny") {
      return new FlareActor(
        "third_party/sunny.flr",
        fit: BoxFit.contain,
        animation: "Untitled",
      );
    } else if (weather == "thunderstorm") {
      return Container(
        color: Colors.black,

      );
    }
  }
}
