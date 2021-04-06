import 'package:flutter/material.dart';

class SpacerComponent extends StatelessWidget {
  final double height;
  SpacerComponent({
@required this.height 
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height
    );
  }
}
