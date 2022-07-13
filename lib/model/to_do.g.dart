// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDoEntity _$ToDoEntityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['title'],
  );
  return ToDoEntity(
    json['dateTimeToDoString'] as String? ?? '',
    $enumDecodeNullable(_$ProrityToDoEnumEnumMap, json['prorityToDoEnum']) ??
        ProrityToDoEnum.tooHigh,
    json['title'] as String,
    json['subtitleToDO'] as String? ?? 'Offical',
    json['completed'] as bool,
    $enumDecodeNullable(_$ToDoStatusEnumEnumMap, json['isStatus']) ??
        ToDoStatusEnum.none,
  );
}

Map<String, dynamic> _$ToDoEntityToJson(ToDoEntity instance) =>
    <String, dynamic>{
      'dateTimeToDoString': instance.dateTimeToDoString,
      'prorityToDoEnum': _$ProrityToDoEnumEnumMap[instance.prorityToDoEnum]!,
      'title': instance.titleToDO,
      'subtitleToDO': instance.subtitleToDO,
      'completed': instance.isFavorite,
      'isStatus': _$ToDoStatusEnumEnumMap[instance.isStatus]!,
    };

const _$ProrityToDoEnumEnumMap = {
  ProrityToDoEnum.tooHigh: 'tooHigh',
  ProrityToDoEnum.high: 'high',
  ProrityToDoEnum.medium: 'medium',
  ProrityToDoEnum.low: 'low',
};

const _$ToDoStatusEnumEnumMap = {
  ToDoStatusEnum.done: 'done',
  ToDoStatusEnum.later: 'later',
  ToDoStatusEnum.none: 'none',
};