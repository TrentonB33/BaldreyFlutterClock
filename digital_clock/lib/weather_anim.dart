import 'package:digital_clock/inherited_clock_model.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///This Stateless widget handles the weather animations through Flare Actor.

/// weather_anim uses logic to check Weather inputs by users
/// and then calls (inputweather).flr files through [FlareActor] based on the weather input, if it's valid.

// creates a weather class to pass each weather input in to
class WeatherAnim extends StatelessWidget {
  const WeatherAnim({
    Key key,
  }) : super(key: key);

  // checks if user input is valid weather input.
  // we were pretty sure this was true but... just in case.
  bool isValidWeather(String weather) {
    if (weather == "cloudy" ||
        weather == "sunny" ||
        weather == "rainy" ||
        weather == "snowy" ||
        weather == "thunderstorm" ||
        weather == "foggy" ||
        weather == "windy") {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    /// gets current weather string from current clock model so isValidWeather function can read it in
    final String weather = InheritedClockModel.of(context).model.weatherString;

    //  i created all of these animations in flare, exported them as binary files,
    //  and stored each in the third_party folder
    if (isValidWeather(weather) == true) {
      return new FlareActor(
        "third_party/$weather.flr",
        animation: "Untitled",
      );
    }

    // okay, honestly i was just testing for each individual weather animation as i created them
    // and it was just too fun to trigger a "THERE's NO WEATHER HERE" message
    // so that's still here.
    else {
      return Container(
          color: Colors.grey,
          child: Text(
            "THERE'S NO WEATHER HERE",
            style: TextStyle(
              fontSize: 75.0,
            ),
          ));
    }
  }
}
