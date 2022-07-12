import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/helper/app_constants/constant_app_color.dart';
import 'package:to_do_app/model/to_do.dart';
import "package:collection/collection.dart";

import 'enum_priority.dart';

class ConstantHelper {
  static List<ToDoEntity> listContent = [
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 9, 7, 17, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Home Work math',
        subtitleToDO: 'Official'),
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 9, 7, 20, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Home Work arabic',
        subtitleToDO: 'Official'),
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 9, 7, 21, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Exam Java2',
        subtitleToDO: 'Official'),
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 9, 7, 22, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Play Football',
        subtitleToDO: 'Official'),
    //---------------------------------------------------------
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 9, 8, 17, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Home Work math',
        subtitleToDO: 'Official'),
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 9, 8, 20, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Home Work arabic',
        subtitleToDO: 'Official'),
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 9, 8, 21, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Exam Java2',
        subtitleToDO: 'Official'),
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 9, 8, 22, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Play Football',
        subtitleToDO: 'Official'),
    //--------------------------------------------------------
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 9, 9, 17, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Home Work math',
        subtitleToDO: 'Official'),
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 9, 9, 20, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Home Work arabic',
        subtitleToDO: 'Official'),
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 9, 9, 21, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Exam Java2',
        subtitleToDO: 'Official'),
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 9, 9, 22, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Play Football',
        subtitleToDO: 'Official'),
    //----------------------------------
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 7, 10, 17, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Home Work math',
        subtitleToDO: 'Official'),
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 7, 10, 20, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Home Work arabic',
        subtitleToDO: 'Official'),
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 7, 11, 21, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Exam Java2',
        subtitleToDO: 'Official'),
    ToDoEntity(
        dateTimeToDoString: DateTime(2022, 7, 11, 22, 30).toString(),
        prorityToDoEnum: ProrityToDoEnum.high,
        titleToDO: 'Play Football',
        subtitleToDO: 'Official'),
  ];

  static Map<String, List<ToDoEntity>> groupingByDateToDoEntity() {
    Map<String, List<ToDoEntity>> map = groupBy<ToDoEntity, String>(
        ConstantHelper.listContent,
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
