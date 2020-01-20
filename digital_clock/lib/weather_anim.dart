import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

class WeatherAnim extends StatelessWidget {
  const WeatherAnim({
    Key key,
    this.weather,
  }) : super(key: key);

  final String weather;
  @override
  Widget build(BuildContext context) {
    if (weather == "cloudy" ||
        weather == "sunny" ||
        weather == "rainy" ||
        weather == "snowy" ||
        weather == "thunderstorm") {
      return new FlareActor(
        "third_party/$weather.flr",
        fit: BoxFit.contain,
        animation: "Untitled",
      );
    } else {
      return Container(
        color: Colors.grey,
      );
    }
  }
}
