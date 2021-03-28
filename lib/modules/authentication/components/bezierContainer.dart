import 'dart:math';
import 'package:aiascs_mobile/modules/authentication/components/custom_clipper.dart';
import 'package:flutter/material.dart';

class BezierContainer extends StatelessWidget {
  const BezierContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.rotate(
        angle: -pi / 3.5, 
        child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height *.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF9FB9CC),Color(0xFF9FB9CC)]
              )
            ),
        ),
      ),
      )
    );
  }
}