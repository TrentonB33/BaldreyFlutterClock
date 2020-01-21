import 'package:digital_clock/inherited_clock_model.dart';
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

    final TextStyle infoStyle = TextStyle(
      color: Theme.of(context).accentColor,
      fontSize: width / 25,
      fontFamily: 'MaterialIcons-Regular',
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
