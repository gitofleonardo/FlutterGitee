import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/issue_result_entity.g.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/user/bean/result/success/user_profile_entity.dart';

@JsonSerializable()
class IssueResultEntity {
  double? id;
  String? url;
  @JSONField(name: "repository_url")
  String? repositoryUrl;
  @JSONField(name: "labels_url")
  String? labelsUrl;
  @JSONField(name: "comments_url")
  String? commentsUrl;
  @JSONField(name: "html_url")
  String? htmlUrl;
  @JSONField(name: "parent_url")
  String? parentUrl;
  String? number;
  @JSONField(name: "parent_id")
  double? parentId;
  double? depth;
  String? state;
  String? title;
  String? body;
  UserProfileEntity? user;
  List<IssueResultLabel>? labels;
  IssueResultAssignee? assignee;
  List<dynamic>? collaborators;
  RepositoryEntity? repository;
  IssueResultMilestone? milestone;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "updated_at")
  String? updatedAt;
  @JSONField(name: "plan_started_at")
  String? planStartedAt;
  String? deadline;
  @JSONField(name: "finished_at")
  String? finishedAt;
  @JSONField(name: "scheduled_time")
  double? scheduledTime;
  double? comments;
  double? priority;
  @JSONField(name: "issue_type")
  String? issueType;
  IssueResultProgram? program;
  @JSONField(name: "security_hole")
  bool? securityHole;
  @JSONField(name: "issue_state")
  String? issueState;
  String? branch;
  @JSONField(name: "issue_type_detail")
  IssueResultIssueTypeDetail? issueTypeDetail;
  @JSONField(name: "issue_state_detail")
  IssueResultIssueStateDetail? issueStateDetail;

  IssueResultEntity();

  factory IssueResultEntity.fromJson(Map<String, dynamic> json) =>
      $IssueResultEntityFromJson(json);

  Map<String, dynamic> toJson() => $IssueResultEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IssueResultLabel {
  int? id;
  String? name;
  String? color;
  @JSONField(name: "repository_id")
  int? repositoryId;
  String? url;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "updated_at")
  String? updatedAt;

  IssueResultLabel();

  factory IssueResultLabel.fromJson(Map<String, dynamic> json) =>
      $IssueResultLabelFromJson(json);

  Map<String, dynamic> toJson() => $IssueResultLabelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IssueResultAssignee {
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

  IssueResultAssignee();

  factory IssueResultAssignee.fromJson(Map<String, dynamic> json) =>
      $IssueResultAssigneeFromJson(json);

  Map<String, dynamic> toJson() => $IssueResultAssigneeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IssueResultMilestone {
  String? url;
  @JSONField(name: "html_url")
  String? htmlUrl;
  double? id;
  double? number;
  @JSONField(name: "repository_id")
  double? repositoryId;
  String? state;
  String? title;
  String? description;
  @JSONField(name: "updated_at")
  String? updatedAt;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "open_issues")
  double? openIssues;
  @JSONField(name: "closed_issues")
  double? closedIssues;
  @JSONField(name: "due_on")
  String? dueOn;

  IssueResultMilestone();

  factory IssueResultMilestone.fromJson(Map<String, dynamic> json) =>
      $IssueResultMilestoneFromJson(json);

  Map<String, dynamic> toJson() => $IssueResultMilestoneToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IssueResultProgram {
  double? id;
  String? name;
  String? description;
  IssueResultProgramAssignee? assignee;
  IssueResultProgramAuthor? author;

  IssueResultProgram();

  factory IssueResultProgram.fromJson(Map<String, dynamic> json) =>
      $IssueResultProgramFromJson(json);

  Map<String, dynamic> toJson() => $IssueResultProgramToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IssueResultProgramAssignee {
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

  IssueResultProgramAssignee();

  factory IssueResultProgramAssignee.fromJson(Map<String, dynamic> json) =>
      $IssueResultProgramAssigneeFromJson(json);

  Map<String, dynamic> toJson() => $IssueResultProgramAssigneeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IssueResultProgramAuthor {
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

  IssueResultProgramAuthor();

  factory IssueResultProgramAuthor.fromJson(Map<String, dynamic> json) =>
      $IssueResultProgramAuthorFromJson(json);

  Map<String, dynamic> toJson() => $IssueResultProgramAuthorToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IssueResultIssueTypeDetail {
  double? id;
  String? title;
  String? template;
  String? ident;
  String? color;
  @JSONField(name: "is_system")
  bool? isSystem;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "updated_at")
  String? updatedAt;

  IssueResultIssueTypeDetail();

  factory IssueResultIssueTypeDetail.fromJson(Map<String, dynamic> json) =>
      $IssueResultIssueTypeDetailFromJson(json);

  Map<String, dynamic> toJson() => $IssueResultIssueTypeDetailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IssueResultIssueStateDetail {
  double? id;
  String? title;
  String? color;
  String? icon;
  String? command;
  double? serial;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "updated_at")
  String? updatedAt;

  IssueResultIssueStateDetail();

  factory IssueResultIssueStateDetail.fromJson(Map<String, dynamic> json) =>
      $IssueResultIssueStateDetailFromJson(json);

  Map<String, dynamic> toJson() => $IssueResultIssueStateDetailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
