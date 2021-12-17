import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/repository_blob_entity.g.dart';

@JsonSerializable()
class RepositoryBlobEntity {
  String? sha;
  int? size;
  String? url;
  String? content;
  String? encoding;

  RepositoryBlobEntity();

  factory RepositoryBlobEntity.fromJson(Map<String, dynamic> json) =>
      $RepositoryBlobEntityFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryBlobEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
