import 'package:digital_clock/InheritedClockModel.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherAnim extends StatelessWidget {
  const WeatherAnim({
    Key key,
  }) : super(key: key);

  bool isValidWeather(String weather) {
    if (weather == "cloudy" ||
            weather == "sunny" ||
            weather == "rainy" ||
            weather == "snowy" ||
            weather == "thunderstorm" ||
            weather == "foggy"
        // || weather == "windy"
        ) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String weather = InheritedClockModel.of(context).model.weatherString;

    if (isValidWeather(weather) == true) {
      return new FlareActor(
        "third_party/$weather.flr",
        animation: "Untitled",
      );
    } else {
      return Container(
          color: Colors.grey, child: Text("THERE'S NO WEATHER HERE"));
    }
  }
}
