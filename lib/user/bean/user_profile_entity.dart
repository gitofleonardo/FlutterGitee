import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/user_profile_entity.g.dart';

@JsonSerializable()
class UserProfileEntity {
  int? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;
  String? receivedEventsUrl;
  String? type;
  String? blog;
  String? weibo;
  String? bio;
  @JSONField(name: "public_repos")
  int? publicRepos;
  @JSONField(name: "public_gists")
  int? publicGists;
  int? followers;
  int? following;
  int? stared;
  int? watched;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "updated_at")
  String? updatedAt;
  String? email;
  String? company;

  UserProfileEntity();

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      $UserProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserProfileEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
