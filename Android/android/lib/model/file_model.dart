import 'package:json_annotation/json_annotation.dart';

part 'file_model.g.dart';

@JsonSerializable()
class FileModel{
  int? id;
  int? owner_id;
  String? type;
  String? name;
  String? size;
  int? shared_group_id;
  String? created;
  String? updated;

  FileModel({this.id, this.owner_id, this.type, this.name, this.size, this.shared_group_id, this.created, this.updated});

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileModelToJson(this);
}