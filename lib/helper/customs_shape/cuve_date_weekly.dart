
import 'package:flutter/material.dart';

class CurveDateWeekly extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;


    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(size.width,size.height*0.0047619);
    path0.lineTo(size.width,size.height);
    path0.lineTo(size.width*0.5014493,size.height*0.8773810);
    path0.lineTo(0,size.height);
    path0.lineTo(0,0);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
