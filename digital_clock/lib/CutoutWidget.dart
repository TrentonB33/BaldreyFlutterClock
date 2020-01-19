import 'package:flutter/material.dart';

class CutoutWidget extends StatelessWidget {
  const CutoutWidget({
    Key key,
    this.color,
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcOut,
      child: child,
      shaderCallback: (bounds) =>
          LinearGradient(colors: [color], stops: [0.0]).createShader(bounds),
    );
  }
}
