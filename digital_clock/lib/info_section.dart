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
