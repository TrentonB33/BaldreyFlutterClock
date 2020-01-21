// Copyright 2020 Bytes of Business, LLC All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:digital_clock/inherited_clock_model.dart';
import 'package:flutter/material.dart';

///This [StatefulWidget] handles the displaying of the other "important"
///clock information: Location and Temperature.
///
/// This InfoSection widget is the second primary section of the WeatherClock
/// combined with the TimeSection. It handles the display of cool information,
/// like your current location (or the location that the user has set) and the
/// current temperature at that location. It uses data taken from the [ClockModel]
/// that's stored in the InheritedClockModel.
class InfoSection extends StatefulWidget {
  const InfoSection();

  @override
  _InfoSectionState createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  @override
  Widget build(BuildContext context) {
    //This is used to calculate a rough font size
    final width = MediaQuery.of(context).size.width;

    final String temperature =
        InheritedClockModel.of(context).model.temperatureString;
    final String location = InheritedClockModel.of(context).model.location;

    final TextStyle infoStyle = TextStyle(
      color: Theme.of(context).accentColor,
      fontSize: width / 16,
      fontFamily: 'MaterialIcons-Regular',
    );

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "$location",
              style: infoStyle,
            ),
            Text(
              '$temperature',
              style: infoStyle,
            )
          ],
        ),
      ),
    );
  }
}
