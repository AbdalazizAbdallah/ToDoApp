import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_app/helper/app_date_helper.dart';

import '../helper/enum.dart';

part 'to_do.g.dart';

@JsonSerializable()
class ToDoEntity {

  @JsonKey(defaultValue: '')
  String dateTimeToDoString;

  @JsonKey(defaultValue: ProrityToDoEnum.tooHigh)
  ProrityToDoEnum prorityToDoEnum;

  @JsonKey(required: true,name: 'title')
  String titleToDO;

  @JsonKey(defaultValue: 'Offical')
  String subtitleToDO;

  @JsonKey(name: 'completed')
  bool isFavorite;

  @JsonKey(defaultValue: ToDoStatusEnum.none)
  ToDoStatusEnum isStatus;


  ToDoEntity(this.dateTimeToDoString, this.prorityToDoEnum,
     this.titleToDO, this.subtitleToDO, this.isFavorite, this.isStatus);

  ToDoEntity.todo({required this.dateTimeToDoString, required this.prorityToDoEnum,
    required this.titleToDO, required this.subtitleToDO, this.isFavorite = false, this.isStatus = ToDoStatusEnum
        .none});

  @override
  String toString() {
    // TODO: implement toString
    return '$dateTimeToDoString || $prorityToDoEnum || $titleToDO || $subtitleToDO';
  }

  factory ToDoEntity.fromJson(Map<String, dynamic> json) =>
      _$ToDoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoEntityToJson(this);


}