import 'package:flutter/material.dart';

class InfoSection extends StatefulWidget {
  @override
  _InfoSectionState createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      child: Container(
        child: Row(
          children: <Widget>[
            Text(
              "location",
              style: TextStyle(
                fontFamily: 'MaterialIcons-Regular',
                fontSize: width / 20,
              ),
            ),
            Text('Temperature: temperature',
                style: TextStyle(
                  fontFamily: 'MaterialIcons-Regular',
                  fontSize: width / 20,
                ))
          ],
        ),
      ),
    );
  }
}
