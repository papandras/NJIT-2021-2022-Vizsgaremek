// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileModel _$FileModelFromJson(Map<String, dynamic> json) => FileModel(
      id: json['id'] as int?,
      owner_id: json['owner_id'] as int?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      size: json['size'] as String?,
      shared_group_id: json['shared_group_id'] as int?,
      created: json['created'] as String?,
      updated: json['updated'] as String?,
    );

Map<String, dynamic> _$FileModelToJson(FileModel instance) => <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.owner_id,
      'type': instance.type,
      'name': instance.name,
      'size': instance.size,
      'shared_group_id': instance.shared_group_id,
      'created': instance.created,
      'updated': instance.updated,
    };
