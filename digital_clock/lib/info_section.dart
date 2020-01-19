import 'package:flutter/material.dart';

class ExtraSection extends StatefulWidget {
  @override
  _ExtraSectionState createState() => _ExtraSectionState();
}

class _ExtraSectionState extends State<ExtraSection> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      child: Container(
        color: Colors.purple,
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
