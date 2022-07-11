

import '../helper/enum_priority.dart';

class ToDoEntity{

  String dateTimeToDoString;
  ProrityToDoEnum prorityToDoEnum;
  String titleToDO;
  String subtitleToDO;
  

  ToDoEntity({required this.dateTimeToDoString,required this.prorityToDoEnum,required this.titleToDO,required this.subtitleToDO});
  
  @override
  String toString() {
    // TODO: implement toString
    return '$dateTimeToDoString || $prorityToDoEnum || $titleToDO || $subtitleToDO';
  }
}