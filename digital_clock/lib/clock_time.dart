import 'package:flutter/material.dart';

class ClockTime extends StatelessWidget {
  const ClockTime({this.time});

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
  TextStyle textStyle;
  TextPainter _textPainter;

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the text in the middle of the canvas
    final textOffset =
        size.center(Offset.zero) - _textPainter.size.center(Offset.zero);
    final textRect = textOffset & _textPainter.size;

    // print('Text Offset is: $textOffset');
    //print('text Rect is: $textRect');

    // The box surrounding the text should be 10 pixels larger, with 4 pixels corner radius
    final boxRect =
        RRect.fromRectAndRadius(textRect.inflate(10.0), Radius.circular(4.0));
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
