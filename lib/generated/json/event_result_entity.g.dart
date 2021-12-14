import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/user/bean/result/success/event_result_entity.dart';

EventResultEntity $EventResultEntityFromJson(Map<String, dynamic> json) {
  final EventResultEntity eventResultEntity = EventResultEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    eventResultEntity.id = id;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    eventResultEntity.type = type;
  }
  final EventResultActor? actor =
      jsonConvert.convert<EventResultActor>(json['actor']);
  if (actor != null) {
    eventResultEntity.actor = actor;
  }
  final EventResultRepo? repo =
      jsonConvert.convert<EventResultRepo>(json['repo']);
  if (repo != null) {
    eventResultEntity.repo = repo;
  }
  final bool? public = jsonConvert.convert<bool>(json['public']);
  if (public != null) {
    eventResultEntity.public = public;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    eventResultEntity.createdAt = createdAt;
  }
  final EventResultPayload? payload =
      jsonConvert.convert<EventResultPayload>(json['payload']);
  if (payload != null) {
    eventResultEntity.payload = payload;
  }
  final EventResultOrg? org = jsonConvert.convert<EventResultOrg>(json['org']);
  if (org != null) {
    eventResultEntity.org = org;
  }
  return eventResultEntity;
}

Map<String, dynamic> $EventResultEntityToJson(EventResultEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['actor'] = entity.actor?.toJson();
  data['repo'] = entity.repo?.toJson();
  data['public'] = entity.public;
  data['created_at'] = entity.createdAt;
  data['payload'] = entity.payload?.toJson();
  data['org'] = entity.org?.toJson();
  return data;
}

EventResultActor $EventResultActorFromJson(Map<String, dynamic> json) {
  final EventResultActor eventResultActor = EventResultActor();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    eventResultActor.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    eventResultActor.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    eventResultActor.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    eventResultActor.avatarUrl = avatarUrl;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    eventResultActor.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    eventResultActor.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    eventResultActor.remark = remark;
  }
  return eventResultActor;
}

Map<String, dynamic> $EventResultActorToJson(EventResultActor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  data['url'] = entity.url;
  data['html_url'] = entity.htmlUrl;
  data['remark'] = entity.remark;
  return data;
}

EventResultRepo $EventResultRepoFromJson(Map<String, dynamic> json) {
  final EventResultRepo eventResultRepo = EventResultRepo();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    eventResultRepo.id = id;
  }
  final String? fullName = jsonConvert.convert<String>(json['full_name']);
  if (fullName != null) {
    eventResultRepo.fullName = fullName;
  }
  final String? humanName = jsonConvert.convert<String>(json['human_name']);
  if (humanName != null) {
    eventResultRepo.humanName = humanName;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    eventResultRepo.url = url;
  }
  return eventResultRepo;
}

Map<String, dynamic> $EventResultRepoToJson(EventResultRepo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['full_name'] = entity.fullName;
  data['human_name'] = entity.humanName;
  data['url'] = entity.url;
  return data;
}

EventResultPayload $EventResultPayloadFromJson(Map<String, dynamic> json) {
  final EventResultPayload eventResultPayload = EventResultPayload();
  final EventResultPayloadTarget? target =
      jsonConvert.convert<EventResultPayloadTarget>(json['target']);
  if (target != null) {
    eventResultPayload.target = target;
  }
  final String? targetType = jsonConvert.convert<String>(json['target_type']);
  if (targetType != null) {
    eventResultPayload.targetType = targetType;
  }
  final bool? followed = jsonConvert.convert<bool>(json['followed']);
  if (followed != null) {
    eventResultPayload.followed = followed;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    eventResultPayload.size = size;
  }
  final List<EventResultPayloadCommit>? commits =
      jsonConvert.convertListNotNull<EventResultPayloadCommit>(json['commits']);
  if (commits != null) {
    eventResultPayload.commits = commits;
  }
  return eventResultPayload;
}

Map<String, dynamic> $EventResultPayloadToJson(EventResultPayload entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['target'] = entity.target?.toJson();
  data['target_type'] = entity.targetType;
  data['followed'] = entity.followed;
  data['size'] = entity.size;
  data['commits'] = entity.commits.map((v) => v.toJson()).toList();
  return data;
}

EventResultPayloadCommit $EventResultPayloadCommitFromJson(
    Map<String, dynamic> json) {
  final EventResultPayloadCommit eventResultPayloadCommit =
      EventResultPayloadCommit();
  final String? sha = jsonConvert.convert<String>(json['sha']);
  if (sha != null) {
    eventResultPayloadCommit.sha = sha;
  }
  final EventResultPayloadCommitAuthor? author =
      jsonConvert.convert<EventResultPayloadCommitAuthor>(json['author']);
  if (author != null) {
    eventResultPayloadCommit.author = author;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    eventResultPayloadCommit.message = message;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    eventResultPayloadCommit.url = url;
  }
  return eventResultPayloadCommit;
}

Map<String, dynamic> $EventResultPayloadCommitToJson(
    EventResultPayloadCommit entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sha'] = entity.sha;
  data['author'] = entity.author?.toJson();
  data['message'] = entity.message;
  data['url'] = entity.url;
  return data;
}

EventResultPayloadCommitAuthor $EventResultPayloadCommitAuthorFromJson(
    Map<String, dynamic> json) {
  final EventResultPayloadCommitAuthor eventResultPayloadCommitAuthor =
      EventResultPayloadCommitAuthor();
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    eventResultPayloadCommitAuthor.email = email;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    eventResultPayloadCommitAuthor.name = name;
  }
  return eventResultPayloadCommitAuthor;
}

Map<String, dynamic> $EventResultPayloadCommitAuthorToJson(
    EventResultPayloadCommitAuthor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['email'] = entity.email;
  data['name'] = entity.name;
  return data;
}

EventResultPayloadTarget $EventResultPayloadTargetFromJson(
    Map<String, dynamic> json) {
  final EventResultPayloadTarget eventResultPayloadTarget =
      EventResultPayloadTarget();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    eventResultPayloadTarget.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    eventResultPayloadTarget.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    eventResultPayloadTarget.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    eventResultPayloadTarget.avatarUrl = avatarUrl;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    eventResultPayloadTarget.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    eventResultPayloadTarget.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    eventResultPayloadTarget.remark = remark;
  }
  return eventResultPayloadTarget;
}

Map<String, dynamic> $EventResultPayloadTargetToJson(
    EventResultPayloadTarget entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  data['url'] = entity.url;
  data['html_url'] = entity.htmlUrl;
  data['remark'] = entity.remark;
  return data;
}

EventResultOrg $EventResultOrgFromJson(Map<String, dynamic> json) {
  final EventResultOrg eventResultOrg = EventResultOrg();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    eventResultOrg.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    eventResultOrg.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    eventResultOrg.name = name;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    eventResultOrg.url = url;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    eventResultOrg.avatarUrl = avatarUrl;
  }
  return eventResultOrg;
}

Map<String, dynamic> $EventResultOrgToJson(EventResultOrg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['url'] = entity.url;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}
