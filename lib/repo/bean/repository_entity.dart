import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/repository_entity.g.dart';
import 'package:flutter_gitee/repo/bean/repo_file_entity.dart';

@JsonSerializable()
class RepositoryEntity {
  double? id;
  @JSONField(name: "full_name")
  String? fullName;
  @JSONField(name: "human_name")
  String? humanName;
  String? url;
  RepositoryNamespace? namespace;
  String? path;
  String? name;
  RepositoryOwner? owner;
  RepositoryAssigner? assigner;
  String? description;
  bool? private;
  bool? public;
  bool? internal;
  bool? fork;
  @JSONField(name: "html_url")
  String? htmlUrl;
  @JSONField(name: "ssh_url")
  String? sshUrl;
  @JSONField(name: "forks_url")
  String? forksUrl;
  @JSONField(name: "keys_url")
  String? keysUrl;
  @JSONField(name: "collaborators_url")
  String? collaboratorsUrl;
  @JSONField(name: "hooks_url")
  String? hooksUrl;
  @JSONField(name: "branches_url")
  String? branchesUrl;
  @JSONField(name: "tags_url")
  String? tagsUrl;
  @JSONField(name: "blobs_url")
  String? blobsUrl;
  @JSONField(name: "stargazers_url")
  String? stargazersUrl;
  @JSONField(name: "contributors_url")
  String? contributorsUrl;
  @JSONField(name: "commits_url")
  String? commitsUrl;
  @JSONField(name: "comments_url")
  String? commentsUrl;
  @JSONField(name: "issue_comment_url")
  String? issueCommentUrl;
  @JSONField(name: "issues_url")
  String? issuesUrl;
  @JSONField(name: "pulls_url")
  String? pullsUrl;
  @JSONField(name: "milestones_url")
  String? milestonesUrl;
  @JSONField(name: "notifications_url")
  String? notificationsUrl;
  @JSONField(name: "labels_url")
  String? labelsUrl;
  @JSONField(name: "releases_url")
  String? releasesUrl;
  bool? recommend;
  bool? gvp;
  String? homepage;
  String? language;
  @JSONField(name: "forks_count")
  double? forksCount;
  @JSONField(name: "stargazers_count")
  double? stargazersCount;
  @JSONField(name: "watchers_count")
  double? watchersCount;
  @JSONField(name: "default_branch")
  String? defaultBranch;
  @JSONField(name: "open_issues_count")
  double? openIssuesCount;
  @JSONField(name: "has_issues")
  bool? hasIssues;
  @JSONField(name: "has_wiki")
  bool? hasWiki;
  @JSONField(name: "issue_comment")
  bool? issueComment;
  @JSONField(name: "can_comment")
  bool? canComment;
  @JSONField(name: "pull_requests_enabled")
  bool? pullRequestsEnabled;
  @JSONField(name: "has_page")
  bool? hasPage;
  String? license;
  bool? outsourced;
  @JSONField(name: "project_creator")
  String? projectCreator;
  List<String>? members;
  @JSONField(name: "pushed_at")
  String? pushedAt;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "updated_at")
  String? updatedAt;
  RepositoryEntity? parent;
  String? paas;
  bool? stared;
  bool? watched;
  RepositoryPermission? permission;
  String? relation;
  @JSONField(name: "assignees_number")
  double? assigneesNumber;
  @JSONField(name: "testers_number")
  double? testersNumber;
  List<RepositoryAssignee>? assignee;
  List<RepositoryTesters>? testers;
  String? status;
  @JSONField(name: "empty_repo")
  bool? emptyRepo;
  List<dynamic>? programs;
  dynamic? enterprise;
  @JSONField(name: "project_labels")
  List<dynamic>? projectLabels;
  RepoFileEntity? readme;

  RepositoryEntity();

  factory RepositoryEntity.fromJson(Map<String, dynamic> json) =>
      $RepositoryEntityFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepositoryNamespace {
  double? id;
  String? type;
  String? name;
  String? path;
  @JSONField(name: "html_url")
  String? htmlUrl;

  RepositoryNamespace();

  factory RepositoryNamespace.fromJson(Map<String, dynamic> json) =>
      $RepositoryNamespaceFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryNamespaceToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepositoryOwner {
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

  RepositoryOwner();

  factory RepositoryOwner.fromJson(Map<String, dynamic> json) =>
      $RepositoryOwnerFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryOwnerToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepositoryAssigner {
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

  RepositoryAssigner();

  factory RepositoryAssigner.fromJson(Map<String, dynamic> json) =>
      $RepositoryAssignerFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryAssignerToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepositoryPermission {
  bool? pull;
  bool? push;
  bool? admin;

  RepositoryPermission();

  factory RepositoryPermission.fromJson(Map<String, dynamic> json) =>
      $RepositoryPermissionFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryPermissionToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepositoryAssignee {
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

  RepositoryAssignee();

  factory RepositoryAssignee.fromJson(Map<String, dynamic> json) =>
      $RepositoryAssigneeFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryAssigneeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepositoryTesters {
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

  RepositoryTesters();

  factory RepositoryTesters.fromJson(Map<String, dynamic> json) =>
      $RepositoryTestersFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryTestersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
