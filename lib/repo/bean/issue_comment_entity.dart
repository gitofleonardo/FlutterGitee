import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/issue_comment_entity.g.dart';

@JsonSerializable()
class IssueCommentEntity {
  double? id;
  String? body;
  IssueCommentUser? user;
  @JSONField(name: "source")
  String? xSource;
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
  String? url;
  @JSONField(name: "html_url")
  String? htmlUrl;
  String? remark;
  @JSONField(name: "followers_url")
  String? followersUrl;
  @JSONField(name: "following_url")
  String? followingUrl;
  @JSONField(name: "gists_url")
  String? gistsUrl;
  @JSONField(name: "starred_url")
  String? starredUrl;
  @JSONField(name: "subscriptions_url")
  String? subscriptionsUrl;
  @JSONField(name: "organizations_url")
  String? organizationsUrl;
  @JSONField(name: "repos_url")
  String? reposUrl;
  @JSONField(name: "events_url")
  String? eventsUrl;
  @JSONField(name: "received_events_url")
  String? receivedEventsUrl;
  String? type;

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
  @JSONField(name: "pull_request")
  dynamic? pullRequest;

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
