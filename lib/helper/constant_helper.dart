import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/helper/app_constants/constant_app_color.dart';
import 'package:to_do_app/model/to_do.dart';
import "package:collection/collection.dart";

import 'enum.dart';

class ConstantHelper {

  static Map<String, List<ToDoEntity>> groupingByDateToDoEntity(List<ToDoEntity> listOfEntity) {
    Map<String, List<ToDoEntity>> map = groupBy<ToDoEntity, String>(
        listOfEntity,
        (p0) => DateTime.tryParse(p0.dateTimeToDoString)
            .toString()
            .substring(0, 10));
    // for sorting map depend on date (key)
    SplayTreeMap<String, List<ToDoEntity>> splayTreeMap = SplayTreeMap<String, List<ToDoEntity>>.from(map,(key1, key2) => key1.compareTo(key2));
    return splayTreeMap;
  }

  static Color? getColorPriority(ProrityToDoEnum prorityToDoEnum) {
    if (prorityToDoEnum == ProrityToDoEnum.tooHigh) {
      return ConstantAppColorsHelper.myTooHighPriority;
    } else if (prorityToDoEnum == ProrityToDoEnum.high) {
      return ConstantAppColorsHelper.myHighPriority;
    } else if (prorityToDoEnum == ProrityToDoEnum.medium) {
      return ConstantAppColorsHelper.myMediumPriority;
    } else if (prorityToDoEnum == ProrityToDoEnum.low) {
      return ConstantAppColorsHelper.myLowPriority;
    }
    return null;
  }




}
