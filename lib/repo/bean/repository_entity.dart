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
  String? status;
  @JSONField(name: "empty_repo")
  bool? emptyRepo;
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

  RepositoryTesters();

  factory RepositoryTesters.fromJson(Map<String, dynamic> json) =>
      $RepositoryTestersFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryTestersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
