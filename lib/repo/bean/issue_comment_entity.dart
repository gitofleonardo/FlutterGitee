import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/issue_comment_entity.g.dart';

@JsonSerializable()
class IssueCommentEntity {
  double? id;
  String? body;
  IssueCommentUser? user;
  IssueCommentTarget? target;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "updated_at")
  String? updatedAt;

  IssueCommentEntity();

  factory IssueCommentEntity.fromJson(Map<String, dynamic> json) =>
      $IssueCommentEntityFromJson(json);

  Map<String, dynamic> toJson() => $IssueCommentEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IssueCommentUser {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  IssueCommentUser();

  factory IssueCommentUser.fromJson(Map<String, dynamic> json) =>
      $IssueCommentUserFromJson(json);

  Map<String, dynamic> toJson() => $IssueCommentUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IssueCommentTarget {
  IssueCommentTargetIssue? issue;

  IssueCommentTarget();

  factory IssueCommentTarget.fromJson(Map<String, dynamic> json) =>
      $IssueCommentTargetFromJson(json);

  Map<String, dynamic> toJson() => $IssueCommentTargetToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IssueCommentTargetIssue {
  double? id;
  String? title;
  String? number;

  IssueCommentTargetIssue();

  factory IssueCommentTargetIssue.fromJson(Map<String, dynamic> json) =>
      $IssueCommentTargetIssueFromJson(json);

  Map<String, dynamic> toJson() => $IssueCommentTargetIssueToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
