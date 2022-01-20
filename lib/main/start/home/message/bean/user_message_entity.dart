import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/user_message_entity.g.dart';

@JsonSerializable()
class UserMessageEntity {
  @JSONField(name: "total_count")
  int? totalCount;
  List<UserMessageList> list = [];

  UserMessageEntity();

  factory UserMessageEntity.fromJson(Map<String, dynamic> json) =>
      $UserMessageEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserMessageEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserMessageList {
  int? id;
  UserMessageListSender? sender;
  bool? unread;
  String? content;
  @JSONField(name: "updated_at")
  String? updatedAt;

  UserMessageList();

  factory UserMessageList.fromJson(Map<String, dynamic> json) =>
      $UserMessageListFromJson(json);

  Map<String, dynamic> toJson() => $UserMessageListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserMessageListSender {
  int? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  UserMessageListSender();

  factory UserMessageListSender.fromJson(Map<String, dynamic> json) =>
      $UserMessageListSenderFromJson(json);

  Map<String, dynamic> toJson() => $UserMessageListSenderToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
