import 'package:flutter/material.dart';

class WeatherThemes {
  WeatherThemes();

  ThemeData getTheme(String brightness) {
    if (brightness == 'dark') {
      return _darkTheme;
    } else {
      return _lightTheme;
    }
  }

  final ThemeData _lightTheme = ThemeData(
    backgroundColor: Color(0xFF81B3FE),
    primaryColor: Colors.red,
    accentColor: Colors.blueGrey,
  );

  final ThemeData _darkTheme = ThemeData(
      backgroundColor: Colors.black,
      primaryColor: Colors.white,
      accentColor: Colors.red);
}

class WeatherTheme extends StatefulWidget {
  const WeatherTheme({this.child});

  final Widget child;

  @override
  _WeatherThemeState createState() => _WeatherThemeState();
}

class _WeatherThemeState extends State<WeatherTheme> {
  @override
  Widget build(BuildContext context) {
    WeatherThemes themes = WeatherThemes();
    String type =
        Theme.of(context).brightness == Brightness.light ? 'light' : 'dark';

    return Theme(
      child: widget.child,
      data: themes.getTheme(type),
    );
  }
}
