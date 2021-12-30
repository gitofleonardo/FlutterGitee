import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/user/bean/event_result_entity.dart';

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
  return eventResultActor;
}

Map<String, dynamic> $EventResultActorToJson(EventResultActor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
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
  final String? number = jsonConvert.convert<String>(json['number']);
  if (number != null) {
    eventResultPayload.number = number;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    eventResultPayload.state = state;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    eventResultPayload.title = title;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    eventResultPayload.body = body;
  }
  final EventResultPayloadComment? comment =
      jsonConvert.convert<EventResultPayloadComment>(json['comment']);
  if (comment != null) {
    eventResultPayload.comment = comment;
  }
  final EventResultPayloadIssue? issue =
      jsonConvert.convert<EventResultPayloadIssue>(json['issue']);
  if (issue != null) {
    eventResultPayload.issue = issue;
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
  data['number'] = entity.number;
  data['state'] = entity.state;
  data['title'] = entity.title;
  data['body'] = entity.body;
  data['comment'] = entity.comment?.toJson();
  data['issue'] = entity.issue?.toJson();
  return data;
}

EventResultPayloadComment $EventResultPayloadCommentFromJson(
    Map<String, dynamic> json) {
  final EventResultPayloadComment eventResultPayloadComment =
      EventResultPayloadComment();
  final EventResultPayloadCommentUser? user =
      jsonConvert.convert<EventResultPayloadCommentUser>(json['user']);
  if (user != null) {
    eventResultPayloadComment.user = user;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    eventResultPayloadComment.body = body;
  }
  return eventResultPayloadComment;
}

Map<String, dynamic> $EventResultPayloadCommentToJson(
    EventResultPayloadComment entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['user'] = entity.user?.toJson();
  data['body'] = entity.body;
  return data;
}

EventResultPayloadCommentUser $EventResultPayloadCommentUserFromJson(
    Map<String, dynamic> json) {
  final EventResultPayloadCommentUser eventResultPayloadCommentUser =
      EventResultPayloadCommentUser();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    eventResultPayloadCommentUser.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    eventResultPayloadCommentUser.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    eventResultPayloadCommentUser.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    eventResultPayloadCommentUser.avatarUrl = avatarUrl;
  }
  return eventResultPayloadCommentUser;
}

Map<String, dynamic> $EventResultPayloadCommentUserToJson(
    EventResultPayloadCommentUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

EventResultPayloadIssue $EventResultPayloadIssueFromJson(
    Map<String, dynamic> json) {
  final EventResultPayloadIssue eventResultPayloadIssue =
      EventResultPayloadIssue();
  final String? number = jsonConvert.convert<String>(json['number']);
  if (number != null) {
    eventResultPayloadIssue.number = number;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    eventResultPayloadIssue.state = state;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    eventResultPayloadIssue.title = title;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    eventResultPayloadIssue.body = body;
  }
  return eventResultPayloadIssue;
}

Map<String, dynamic> $EventResultPayloadIssueToJson(
    EventResultPayloadIssue entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['number'] = entity.number;
  data['state'] = entity.state;
  data['title'] = entity.title;
  data['body'] = entity.body;
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
  return eventResultPayloadTarget;
}

Map<String, dynamic> $EventResultPayloadTargetToJson(
    EventResultPayloadTarget entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
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
