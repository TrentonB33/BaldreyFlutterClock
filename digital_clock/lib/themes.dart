import 'package:flutter/material.dart';

/// Our best attempt at a dynamic theme provider.
///
/// Originally intended to provide themes for each of the different weather
/// conditions, this class ultimately just serves up our brightness themes
/// based on the brightness reported to us.
class WeatherThemes {
  WeatherThemes();

  ThemeData getTheme(String brightness) {
    if (brightness == 'dark') {
      return _darkTheme;
    } else {
      return _lightTheme;
    }
  }

  /// This is the theme that's provided with high brightness. (light mode)
  final ThemeData _lightTheme = ThemeData(
    primaryColor: Color(0xff718093),
    accentColor: Colors.white,
  );

  ///This is the theme that's provided with low brightness. (dark mode)
  final ThemeData _darkTheme = ThemeData(
    primaryColor: Colors.white,
    accentColor: Colors.blueGrey[600],
  );
}

///Class that provides a [Theme] Widget with appropriate [ThemeData].
///
/// As stated earlier, this class combined with the WeatherThemes was supposed
/// to act as a theme provider for all different types of weather. But that was
/// a little too ambitious, so we stuck with just "light" and "dark" themes.
class WeatherTheme extends StatefulWidget {
  const WeatherTheme({this.child});

  ///This is the child for the custom [Theme].
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
