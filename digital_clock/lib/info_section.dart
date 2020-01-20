import 'package:digital_clock/InheritedClockModel.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatefulWidget {
  const InfoSection();

  @override
  _InfoSectionState createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final String temperature =
        InheritedClockModel.of(context).model.temperatureString;
    final String location = InheritedClockModel.of(context).model.location;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      color: Colors.blueGrey[400],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "$location",
            style: TextStyle(
              fontFamily: 'MaterialIcons-Regular',
              fontSize: width / 25,
            ),
          ),
          Text('Temperature: $temperature',
              style: TextStyle(
                fontFamily: 'MaterialIcons-Regular',
                fontSize: width / 25,
              ))
        ],
      ),
    );
  }
}
