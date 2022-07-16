import 'package:flutter/material.dart';

import '../helper/app_constants/constant_app_color.dart';

class SingleChoicePriorityProvider with ChangeNotifier {
  List<bool> isPrioritySelected =
      List.generate(4, (index) => index == 0 ? true : false);

  List<Color> colorPriority = [
    ConstantAppColorsHelper.myTooHighPriority,
    ConstantAppColorsHelper.myHighPriority,
    ConstantAppColorsHelper.myMediumPriority,
    ConstantAppColorsHelper.myLowPriority
  ];

  int getLengthPriority(){
    return colorPriority.length;
  }

  void setSelectPriority(int indexSelected) {
    isPrioritySelected.replaceRange(0, isPrioritySelected.length,
        [for (int i = 0; i < isPrioritySelected.length; i++) false]);

    isPrioritySelected[indexSelected] = true;

    notifyListeners();
  }
}
