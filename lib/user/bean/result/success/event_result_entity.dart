import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/event_result_entity.g.dart';

@JsonSerializable()
class EventResultEntity {
  double? id;
  String? type;
  EventResultActor? actor;
  EventResultRepo? repo;
  bool? public;
  @JSONField(name: "created_at")
  String? createdAt;
  EventResultPayload? payload;
  EventResultOrg? org;

  EventResultEntity();

  factory EventResultEntity.fromJson(Map<String, dynamic> json) =>
      $EventResultEntityFromJson(json);

  Map<String, dynamic> toJson() => $EventResultEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EventResultActor {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;
  String? url;
  @JSONField(name: "html_url")
  String? htmlUrl;
  String? remark;

  EventResultActor();

  factory EventResultActor.fromJson(Map<String, dynamic> json) =>
      $EventResultActorFromJson(json);

  Map<String, dynamic> toJson() => $EventResultActorToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EventResultRepo {
  int? id;
  @JSONField(name: "full_name")
  String? fullName;
  @JSONField(name: "human_name")
  String? humanName;
  String? url;

  EventResultRepo();

  factory EventResultRepo.fromJson(Map<String, dynamic> json) =>
      $EventResultRepoFromJson(json);

  Map<String, dynamic> toJson() => $EventResultRepoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EventResultPayload {
  EventResultPayloadTarget? target;
  @JSONField(name: "target_type")
  String? targetType;
  bool? followed;
  int size = 0;
  List<EventResultPayloadCommit> commits = [];

  EventResultPayload();

  factory EventResultPayload.fromJson(Map<String, dynamic> json) =>
      $EventResultPayloadFromJson(json);

  Map<String, dynamic> toJson() => $EventResultPayloadToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EventResultPayloadCommit {
  String? sha;
  EventResultPayloadCommitAuthor? author;
  String? message;
  String? url;

  EventResultPayloadCommit();

  factory EventResultPayloadCommit.fromJson(Map<String, dynamic> json) =>
      $EventResultPayloadCommitFromJson(json);

  Map<String, dynamic> toJson() => $EventResultPayloadCommitToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EventResultPayloadCommitAuthor {
  String? email;
  String? name;

  EventResultPayloadCommitAuthor();

  factory EventResultPayloadCommitAuthor.fromJson(Map<String, dynamic> json) =>
      $EventResultPayloadCommitAuthorFromJson(json);

  Map<String, dynamic> toJson() => $EventResultPayloadCommitAuthorToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EventResultPayloadTarget {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;
  String? url;
  @JSONField(name: "html_url")
  String? htmlUrl;
  String? remark;

  EventResultPayloadTarget();

  factory EventResultPayloadTarget.fromJson(Map<String, dynamic> json) =>
      $EventResultPayloadTargetFromJson(json);

  Map<String, dynamic> toJson() => $EventResultPayloadTargetToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EventResultOrg {
  double? id;
  String? login;
  String? name;
  String? url;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  EventResultOrg();

  factory EventResultOrg.fromJson(Map<String, dynamic> json) =>
      $EventResultOrgFromJson(json);

  Map<String, dynamic> toJson() => $EventResultOrgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
