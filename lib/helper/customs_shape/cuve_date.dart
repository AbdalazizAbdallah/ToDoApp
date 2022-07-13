
import 'package:flutter/material.dart';

import '../app_constants/constant_app_color.dart';

class CurveDate extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = ConstantAppColorsHelper.myGreen
      ..style = PaintingStyle.fill;

    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(size.width,0);
    path0.lineTo(size.width,size.height);
    path0.lineTo(size.width*0.2091667,size.height);
    path0.lineTo(0,0);
    path0.close();



    canvas.drawPath(path0, paint0);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
