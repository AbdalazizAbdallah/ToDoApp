

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/helper/color.dart';

class CurveDate extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
 
  Paint paint0 = Paint()
      ..color = ColorsHelper.myGreen
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



