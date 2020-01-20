import 'package:digital_clock/InheritedClockModel.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherAnim extends StatelessWidget {
  const WeatherAnim({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weather = InheritedClockModel.of(context).model.weatherString;

    if (weather == "cloudy" ||
        weather == "sunny" ||
        weather == "rainy" ||
        weather == "snowy" ||
        weather == "thunderstorm" ||
        weather == "foggy") {
      return new FlareActor(
        "third_party/$weather.flr",
        //fit: BoxFit.contain,
        animation: "Untitled",
      );
    } else {
      return Container(
        color: Colors.grey,
      );
    }
  }
}
