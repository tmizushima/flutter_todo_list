import 'package:flutter/material.dart';

import 'colors.dart';

class AppBackgroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraint) {
      final height = contraint.maxHeight;
      final width = contraint.maxWidth;

      return Stack(
        children: <Widget>[
          Positioned(
            right: (height / 9 - height / 2),
            top: -height * 0.09,
            child: Container(
              height: height,
              width: width,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: firstCircle),
            ),
          ),
          Positioned(
            top: height * 0.60,
            right: height * 0.09,
            child: Container(
              height: height,
              width: width,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: secondCircle),
            ),
          ),
          Positioned(
            top: -height * 0.20,
            left: -height * 0.39,
            child: Container(
              height: height,
              width: width,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: thirdCircle),
            ),
          ),
        ],
      );
    });
  }
}
