// Copyright 2020 Bytes of Business, LLC. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Custom Painter that cuts out Text from a background, making it so that
/// display behind the widget is viewable through the cutout.
///
/// This class is essentially a [Container] with a [Text] cutout in the center.
/// This was the central idea in designing this app. We wanted to create an app
/// where you could "see the weather" through the time.
class ClockTime extends StatelessWidget {
  const ClockTime({this.time});

  ///Text cutout to be displayed, used explicitly for time in this case.
  final Text time;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CutoutTextPainter(
        text: time.data,
        textStyle: time.style,
      ),
    );
  }
}

///This is a [CustomPainter] that implements the cutout of the time text.
///
/// This code is based on the stack exchange answer here: https://stackoverflow.com/questions/52152018/cut-out-text-effect-in-flutter
/// It takes the text that's passed in, and draws a box around where the text will
/// be. It then Draws the text, but since the BlendMode is srcOut, it removes
/// the area where the text would be drawn, creating out cutout. Kind of
/// expensive, especially when combined with the [FlareActor] but we liked how it
/// looks.
class CutoutTextPainter extends CustomPainter {
  CutoutTextPainter({this.text, this.textStyle}) {
    _textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
    );
    _textPainter.layout();
  }

  final String text;
  //We use this text style to color the box that's drawn around the cutout.
  TextStyle textStyle;
  TextPainter _textPainter;

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the text in the middle of the canvas
    final textOffset =
        size.center(Offset.zero) - _textPainter.size.center(Offset.zero);
    final textRect = textOffset & _textPainter.size;

    // The box surrounding the text should be 10 pixels larger, with 4 pixels corner radius
    final boxRect =
        RRect.fromRectAndRadius(textRect.inflate(10), Radius.circular(4.0));
    final boxPaint = Paint()
      ..color = textStyle.color
      ..blendMode = BlendMode.srcOut;

    canvas.saveLayer(boxRect.outerRect, Paint());

    _textPainter.paint(canvas, textOffset);
    canvas.drawRRect(boxRect, boxPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CutoutTextPainter oldDelegate) {
    return text != oldDelegate.text;
  }
}
