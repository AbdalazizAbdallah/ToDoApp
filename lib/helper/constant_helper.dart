import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/helper/color.dart';

import 'enum_priority.dart';

class ConstantHelper {
  static String getDateCustom(String stringDate) {
    DateTime dateTime = DateTime.now();
    DateTime pickedDate = DateTime.tryParse(stringDate) ?? DateTime.now();

    if (dateTime.difference(pickedDate).inDays == 0) {
      return 'Today';
    } else if (dateTime.difference(pickedDate).inDays == 1) {
      return 'Yesterday';
    } else if (dateTime.difference(pickedDate).inDays == -1) {
      return 'Tomorrow';
    } else {
      String monthDay = DateFormat('d MMM').format(pickedDate);
      return monthDay;
    }
  }

  static String getHourOfDate(String stringDate) {
    DateTime pickedDate = DateTime.tryParse(stringDate) ?? DateTime.now();

    String hour = DateFormat('hh:mm').format(pickedDate);
    return hour;
  }

  static String getPMorAMOfDate(String stringDate) {
    DateTime pickedDate = DateTime.tryParse(stringDate) ?? DateTime.now();
    String hour = DateFormat('a').format(pickedDate);
    return hour;
  }

  static Color? getColorPriority(ProrityToDoEnum prorityToDoEnum) {
    if (prorityToDoEnum == ProrityToDoEnum.tooHigh) {
      return ColorsHelper.myTooHighPriority;
    } else if (prorityToDoEnum == ProrityToDoEnum.high) {
      return ColorsHelper.myHighPriority;
    } else if (prorityToDoEnum == ProrityToDoEnum.medium) {
      return ColorsHelper.myMediumPriority;
    } else if (prorityToDoEnum == ProrityToDoEnum.low) {
      return ColorsHelper.myLowPriority;
    }
    return null;
  }
}
