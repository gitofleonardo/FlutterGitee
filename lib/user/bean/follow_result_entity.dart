import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/follow_result_entity.g.dart';

@JsonSerializable()
class FollowResultEntity {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  FollowResultEntity();

  factory FollowResultEntity.fromJson(Map<String, dynamic> json) =>
      $FollowResultEntityFromJson(json);

  Map<String, dynamic> toJson() => $FollowResultEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
