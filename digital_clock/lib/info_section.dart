import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

class InfoSection extends StatefulWidget {
  const InfoSection(this.model);

  final ClockModel model;

  @override
  _InfoSectionState createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateModel();
  }

  @override
  void didUpdateWidget(InfoSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final String temperature = widget.model.temperatureString;
    final String location = widget.model.location;

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
