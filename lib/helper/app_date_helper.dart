import 'dart:math';

import 'package:intl/intl.dart';

class AppDateHelper {
  static String getDateCustom(String stringDate) {
    DateTime dateTime = DateTime.now();

    DateTime pickedDate = DateTime.tryParse(stringDate) ?? DateTime.now();

    if (dateTime.difference(pickedDate).inDays == 0 && DateFormat.yMd().format(pickedDate)==DateFormat.yMd().format(DateTime.now()) ) {
      return 'Today';
    } else if (dateTime.difference(pickedDate).inDays == 1) {
      return 'Yesterday';
    } else if (dateTime.difference(pickedDate).inDays == -1) {
      return 'Tomorrow';
    } else {
      String monthDay = DateFormat('d MMMM').format(pickedDate);
      return monthDay;
    }
  }

  static String getDateCustomMonthYear(String stringDate) {
    DateTime pickedDate = DateTime.tryParse(stringDate) ?? DateTime.now();
    String monthDay = DateFormat('MMMM, yyyy').format(pickedDate);
    return monthDay;
  }

  static String getDateMonthMMM(String stringDate) {
    DateTime pickedDate = DateTime.tryParse(stringDate) ?? DateTime.now();
    String monthDay = DateFormat('EEE').format(pickedDate);
    return monthDay;
  }

  static String getDateDay(String stringDate) {
    DateTime pickedDate = DateTime.tryParse(stringDate) ?? DateTime.now();
    String day = '${pickedDate.day}';
    return day;
  }

  static String getHourOfDate(String stringDate) {
    DateTime pickedDate = DateTime.tryParse(stringDate) ?? DateTime.now();

    String hour = DateFormat('hh:mm').format(pickedDate);
    return hour;
  }

  static String getPMorAMOfDate(String stringDate) {
    DateTime pickedDate = DateTime.tryParse(stringDate) ?? DateTime.now();

    String pmOrAm = DateFormat('a').format(pickedDate);
    return pmOrAm;
  }

  /// Find first date of the week which contains provided date.
  static DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  /// Find last date of the week which contains provided date.
  static DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  static List<String> getDaysOfWeek({String? pickedDate}){
    DateTime? tryParse = DateTime.tryParse(pickedDate??'');
    DateTime dateTimeNow = tryParse ?? DateTime.now();
    List<String> days = [];
    DateTime firstDay = findFirstDateOfTheWeek(dateTimeNow);
    for(int i=0;i<7;i++){
      DateTime nextDay = firstDay.add(Duration(days: i));
      days.add(nextDay.toString());
    }
    return days;
  }

  static bool isSameDay(String stringDate){
    DateTime pickedDate = DateTime.tryParse(stringDate) ?? DateTime.now();
    return DateFormat.yMd().format(pickedDate)==DateFormat.yMd().format(DateTime.now());
  }

  static String generateDateTimeRandomly(){
    DateTime dateTime = DateTime.now();
    Random random = Random();
    int day = random.nextInt(30)+1;
    return DateTime(2022,7,day,dateTime.hour,dateTime.minute,dateTime.second).toString();
  }
}
