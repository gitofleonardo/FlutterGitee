import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/notification_message_entity.g.dart';

@JsonSerializable()
class NotificationMessageEntity {
  @JSONField(name: "total_count")
  int? totalCount;
  List<NotificationMessageList>? list;

  NotificationMessageEntity();

  factory NotificationMessageEntity.fromJson(Map<String, dynamic> json) =>
      $NotificationMessageEntityFromJson(json);

  Map<String, dynamic> toJson() => $NotificationMessageEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NotificationMessageList {
  int? id;
  String? content;
  String? type;
  bool? unread;
  bool? mute;
  @JSONField(name: "updated_at")
  String? updatedAt;
  NotificationMessageListActor? actor;
  NotificationMessageListRepository? repository;
  NotificationMessageListSubject? subject;
  List<NotificationMessageListNamespaces>? namespaces;
  bool selected = false;

  NotificationMessageList();

  factory NotificationMessageList.fromJson(Map<String, dynamic> json) =>
      $NotificationMessageListFromJson(json);

  Map<String, dynamic> toJson() => $NotificationMessageListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NotificationMessageListActor {
  int? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  NotificationMessageListActor();

  factory NotificationMessageListActor.fromJson(Map<String, dynamic> json) =>
      $NotificationMessageListActorFromJson(json);

  Map<String, dynamic> toJson() => $NotificationMessageListActorToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NotificationMessageListRepository {
  int? id;
  @JSONField(name: "full_name")
  String? fullName;
  @JSONField(name: "human_name")
  String? humanName;
  String? url;
  NotificationMessageListRepositoryNamespace? namespace;
  String? path;
  String? name;
  NotificationMessageListRepositoryOwner? owner;
  NotificationMessageListRepositoryAssigner? assigner;
  String? description;
  bool? private;
  bool? public;
  bool? internal;
  bool? fork;

  NotificationMessageListRepository();

  factory NotificationMessageListRepository.fromJson(
          Map<String, dynamic> json) =>
      $NotificationMessageListRepositoryFromJson(json);

  Map<String, dynamic> toJson() =>
      $NotificationMessageListRepositoryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NotificationMessageListRepositoryNamespace {
  int? id;
  String? type;
  String? name;
  String? path;

  NotificationMessageListRepositoryNamespace();

  factory NotificationMessageListRepositoryNamespace.fromJson(
          Map<String, dynamic> json) =>
      $NotificationMessageListRepositoryNamespaceFromJson(json);

  Map<String, dynamic> toJson() =>
      $NotificationMessageListRepositoryNamespaceToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NotificationMessageListRepositoryOwner {
  int? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  NotificationMessageListRepositoryOwner();

  factory NotificationMessageListRepositoryOwner.fromJson(
          Map<String, dynamic> json) =>
      $NotificationMessageListRepositoryOwnerFromJson(json);

  Map<String, dynamic> toJson() =>
      $NotificationMessageListRepositoryOwnerToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NotificationMessageListRepositoryAssigner {
  int? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  NotificationMessageListRepositoryAssigner();

  factory NotificationMessageListRepositoryAssigner.fromJson(
          Map<String, dynamic> json) =>
      $NotificationMessageListRepositoryAssignerFromJson(json);

  Map<String, dynamic> toJson() =>
      $NotificationMessageListRepositoryAssignerToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NotificationMessageListSubject {
  String? title;
  String? url;
  @JSONField(name: "latest_comment_url")
  String? latestCommentUrl;
  String? type;

  NotificationMessageListSubject();

  factory NotificationMessageListSubject.fromJson(Map<String, dynamic> json) =>
      $NotificationMessageListSubjectFromJson(json);

  Map<String, dynamic> toJson() => $NotificationMessageListSubjectToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NotificationMessageListNamespaces {
  String? name;
  String? type;

  NotificationMessageListNamespaces();

  factory NotificationMessageListNamespaces.fromJson(
          Map<String, dynamic> json) =>
      $NotificationMessageListNamespacesFromJson(json);

  Map<String, dynamic> toJson() =>
      $NotificationMessageListNamespacesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
