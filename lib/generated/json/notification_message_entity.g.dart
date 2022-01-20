import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/main/start/home/message/bean/notification_message_entity.dart';

NotificationMessageEntity $NotificationMessageEntityFromJson(
    Map<String, dynamic> json) {
  final NotificationMessageEntity notificationMessageEntity =
      NotificationMessageEntity();
  final int? totalCount = jsonConvert.convert<int>(json['total_count']);
  if (totalCount != null) {
    notificationMessageEntity.totalCount = totalCount;
  }
  final List<NotificationMessageList>? list =
      jsonConvert.convertListNotNull<NotificationMessageList>(json['list']);
  if (list != null) {
    notificationMessageEntity.list = list;
  }
  return notificationMessageEntity;
}

Map<String, dynamic> $NotificationMessageEntityToJson(
    NotificationMessageEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['total_count'] = entity.totalCount;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

NotificationMessageList $NotificationMessageListFromJson(
    Map<String, dynamic> json) {
  final NotificationMessageList notificationMessageList =
      NotificationMessageList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    notificationMessageList.id = id;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    notificationMessageList.content = content;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    notificationMessageList.type = type;
  }
  final bool? unread = jsonConvert.convert<bool>(json['unread']);
  if (unread != null) {
    notificationMessageList.unread = unread;
  }
  final bool? mute = jsonConvert.convert<bool>(json['mute']);
  if (mute != null) {
    notificationMessageList.mute = mute;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    notificationMessageList.updatedAt = updatedAt;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    notificationMessageList.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    notificationMessageList.htmlUrl = htmlUrl;
  }
  final NotificationMessageListActor? actor =
      jsonConvert.convert<NotificationMessageListActor>(json['actor']);
  if (actor != null) {
    notificationMessageList.actor = actor;
  }
  final NotificationMessageListRepository? repository = jsonConvert
      .convert<NotificationMessageListRepository>(json['repository']);
  if (repository != null) {
    notificationMessageList.repository = repository;
  }
  final NotificationMessageListSubject? subject =
      jsonConvert.convert<NotificationMessageListSubject>(json['subject']);
  if (subject != null) {
    notificationMessageList.subject = subject;
  }
  final List<NotificationMessageListNamespaces>? namespaces =
      jsonConvert.convertListNotNull<NotificationMessageListNamespaces>(
          json['namespaces']);
  if (namespaces != null) {
    notificationMessageList.namespaces = namespaces;
  }
  return notificationMessageList;
}

Map<String, dynamic> $NotificationMessageListToJson(
    NotificationMessageList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['content'] = entity.content;
  data['type'] = entity.type;
  data['unread'] = entity.unread;
  data['mute'] = entity.mute;
  data['updated_at'] = entity.updatedAt;
  data['url'] = entity.url;
  data['html_url'] = entity.htmlUrl;
  data['actor'] = entity.actor?.toJson();
  data['repository'] = entity.repository?.toJson();
  data['subject'] = entity.subject?.toJson();
  data['namespaces'] = entity.namespaces?.map((v) => v.toJson()).toList();
  return data;
}

NotificationMessageListActor $NotificationMessageListActorFromJson(
    Map<String, dynamic> json) {
  final NotificationMessageListActor notificationMessageListActor =
      NotificationMessageListActor();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    notificationMessageListActor.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    notificationMessageListActor.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    notificationMessageListActor.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    notificationMessageListActor.avatarUrl = avatarUrl;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    notificationMessageListActor.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    notificationMessageListActor.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    notificationMessageListActor.remark = remark;
  }
  final String? followersUrl =
      jsonConvert.convert<String>(json['followers_url']);
  if (followersUrl != null) {
    notificationMessageListActor.followersUrl = followersUrl;
  }
  final String? followingUrl =
      jsonConvert.convert<String>(json['following_url']);
  if (followingUrl != null) {
    notificationMessageListActor.followingUrl = followingUrl;
  }
  final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
  if (gistsUrl != null) {
    notificationMessageListActor.gistsUrl = gistsUrl;
  }
  final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
  if (starredUrl != null) {
    notificationMessageListActor.starredUrl = starredUrl;
  }
  final String? subscriptionsUrl =
      jsonConvert.convert<String>(json['subscriptions_url']);
  if (subscriptionsUrl != null) {
    notificationMessageListActor.subscriptionsUrl = subscriptionsUrl;
  }
  final String? organizationsUrl =
      jsonConvert.convert<String>(json['organizations_url']);
  if (organizationsUrl != null) {
    notificationMessageListActor.organizationsUrl = organizationsUrl;
  }
  final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
  if (reposUrl != null) {
    notificationMessageListActor.reposUrl = reposUrl;
  }
  final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
  if (eventsUrl != null) {
    notificationMessageListActor.eventsUrl = eventsUrl;
  }
  final String? receivedEventsUrl =
      jsonConvert.convert<String>(json['received_events_url']);
  if (receivedEventsUrl != null) {
    notificationMessageListActor.receivedEventsUrl = receivedEventsUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    notificationMessageListActor.type = type;
  }
  return notificationMessageListActor;
}

Map<String, dynamic> $NotificationMessageListActorToJson(
    NotificationMessageListActor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  data['url'] = entity.url;
  data['html_url'] = entity.htmlUrl;
  data['remark'] = entity.remark;
  data['followers_url'] = entity.followersUrl;
  data['following_url'] = entity.followingUrl;
  data['gists_url'] = entity.gistsUrl;
  data['starred_url'] = entity.starredUrl;
  data['subscriptions_url'] = entity.subscriptionsUrl;
  data['organizations_url'] = entity.organizationsUrl;
  data['repos_url'] = entity.reposUrl;
  data['events_url'] = entity.eventsUrl;
  data['received_events_url'] = entity.receivedEventsUrl;
  data['type'] = entity.type;
  return data;
}

NotificationMessageListRepository $NotificationMessageListRepositoryFromJson(
    Map<String, dynamic> json) {
  final NotificationMessageListRepository notificationMessageListRepository =
      NotificationMessageListRepository();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    notificationMessageListRepository.id = id;
  }
  final String? fullName = jsonConvert.convert<String>(json['full_name']);
  if (fullName != null) {
    notificationMessageListRepository.fullName = fullName;
  }
  final String? humanName = jsonConvert.convert<String>(json['human_name']);
  if (humanName != null) {
    notificationMessageListRepository.humanName = humanName;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    notificationMessageListRepository.url = url;
  }
  final NotificationMessageListRepositoryNamespace? namespace = jsonConvert
      .convert<NotificationMessageListRepositoryNamespace>(json['namespace']);
  if (namespace != null) {
    notificationMessageListRepository.namespace = namespace;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    notificationMessageListRepository.path = path;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    notificationMessageListRepository.name = name;
  }
  final NotificationMessageListRepositoryOwner? owner = jsonConvert
      .convert<NotificationMessageListRepositoryOwner>(json['owner']);
  if (owner != null) {
    notificationMessageListRepository.owner = owner;
  }
  final NotificationMessageListRepositoryAssigner? assigner = jsonConvert
      .convert<NotificationMessageListRepositoryAssigner>(json['assigner']);
  if (assigner != null) {
    notificationMessageListRepository.assigner = assigner;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    notificationMessageListRepository.description = description;
  }
  final bool? private = jsonConvert.convert<bool>(json['private']);
  if (private != null) {
    notificationMessageListRepository.private = private;
  }
  final bool? public = jsonConvert.convert<bool>(json['public']);
  if (public != null) {
    notificationMessageListRepository.public = public;
  }
  final bool? internal = jsonConvert.convert<bool>(json['internal']);
  if (internal != null) {
    notificationMessageListRepository.internal = internal;
  }
  final bool? fork = jsonConvert.convert<bool>(json['fork']);
  if (fork != null) {
    notificationMessageListRepository.fork = fork;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    notificationMessageListRepository.htmlUrl = htmlUrl;
  }
  final String? sshUrl = jsonConvert.convert<String>(json['ssh_url']);
  if (sshUrl != null) {
    notificationMessageListRepository.sshUrl = sshUrl;
  }
  return notificationMessageListRepository;
}

Map<String, dynamic> $NotificationMessageListRepositoryToJson(
    NotificationMessageListRepository entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['full_name'] = entity.fullName;
  data['human_name'] = entity.humanName;
  data['url'] = entity.url;
  data['namespace'] = entity.namespace?.toJson();
  data['path'] = entity.path;
  data['name'] = entity.name;
  data['owner'] = entity.owner?.toJson();
  data['assigner'] = entity.assigner?.toJson();
  data['description'] = entity.description;
  data['private'] = entity.private;
  data['public'] = entity.public;
  data['internal'] = entity.internal;
  data['fork'] = entity.fork;
  data['html_url'] = entity.htmlUrl;
  data['ssh_url'] = entity.sshUrl;
  return data;
}

NotificationMessageListRepositoryNamespace
    $NotificationMessageListRepositoryNamespaceFromJson(
        Map<String, dynamic> json) {
  final NotificationMessageListRepositoryNamespace
      notificationMessageListRepositoryNamespace =
      NotificationMessageListRepositoryNamespace();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    notificationMessageListRepositoryNamespace.id = id;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    notificationMessageListRepositoryNamespace.type = type;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    notificationMessageListRepositoryNamespace.name = name;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    notificationMessageListRepositoryNamespace.path = path;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    notificationMessageListRepositoryNamespace.htmlUrl = htmlUrl;
  }
  return notificationMessageListRepositoryNamespace;
}

Map<String, dynamic> $NotificationMessageListRepositoryNamespaceToJson(
    NotificationMessageListRepositoryNamespace entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['name'] = entity.name;
  data['path'] = entity.path;
  data['html_url'] = entity.htmlUrl;
  return data;
}

NotificationMessageListRepositoryOwner
    $NotificationMessageListRepositoryOwnerFromJson(Map<String, dynamic> json) {
  final NotificationMessageListRepositoryOwner
      notificationMessageListRepositoryOwner =
      NotificationMessageListRepositoryOwner();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    notificationMessageListRepositoryOwner.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    notificationMessageListRepositoryOwner.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    notificationMessageListRepositoryOwner.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    notificationMessageListRepositoryOwner.avatarUrl = avatarUrl;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    notificationMessageListRepositoryOwner.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    notificationMessageListRepositoryOwner.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    notificationMessageListRepositoryOwner.remark = remark;
  }
  final String? followersUrl =
      jsonConvert.convert<String>(json['followers_url']);
  if (followersUrl != null) {
    notificationMessageListRepositoryOwner.followersUrl = followersUrl;
  }
  final String? followingUrl =
      jsonConvert.convert<String>(json['following_url']);
  if (followingUrl != null) {
    notificationMessageListRepositoryOwner.followingUrl = followingUrl;
  }
  final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
  if (gistsUrl != null) {
    notificationMessageListRepositoryOwner.gistsUrl = gistsUrl;
  }
  final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
  if (starredUrl != null) {
    notificationMessageListRepositoryOwner.starredUrl = starredUrl;
  }
  final String? subscriptionsUrl =
      jsonConvert.convert<String>(json['subscriptions_url']);
  if (subscriptionsUrl != null) {
    notificationMessageListRepositoryOwner.subscriptionsUrl = subscriptionsUrl;
  }
  final String? organizationsUrl =
      jsonConvert.convert<String>(json['organizations_url']);
  if (organizationsUrl != null) {
    notificationMessageListRepositoryOwner.organizationsUrl = organizationsUrl;
  }
  final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
  if (reposUrl != null) {
    notificationMessageListRepositoryOwner.reposUrl = reposUrl;
  }
  final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
  if (eventsUrl != null) {
    notificationMessageListRepositoryOwner.eventsUrl = eventsUrl;
  }
  final String? receivedEventsUrl =
      jsonConvert.convert<String>(json['received_events_url']);
  if (receivedEventsUrl != null) {
    notificationMessageListRepositoryOwner.receivedEventsUrl =
        receivedEventsUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    notificationMessageListRepositoryOwner.type = type;
  }
  return notificationMessageListRepositoryOwner;
}

Map<String, dynamic> $NotificationMessageListRepositoryOwnerToJson(
    NotificationMessageListRepositoryOwner entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  data['url'] = entity.url;
  data['html_url'] = entity.htmlUrl;
  data['remark'] = entity.remark;
  data['followers_url'] = entity.followersUrl;
  data['following_url'] = entity.followingUrl;
  data['gists_url'] = entity.gistsUrl;
  data['starred_url'] = entity.starredUrl;
  data['subscriptions_url'] = entity.subscriptionsUrl;
  data['organizations_url'] = entity.organizationsUrl;
  data['repos_url'] = entity.reposUrl;
  data['events_url'] = entity.eventsUrl;
  data['received_events_url'] = entity.receivedEventsUrl;
  data['type'] = entity.type;
  return data;
}

NotificationMessageListRepositoryAssigner
    $NotificationMessageListRepositoryAssignerFromJson(
        Map<String, dynamic> json) {
  final NotificationMessageListRepositoryAssigner
      notificationMessageListRepositoryAssigner =
      NotificationMessageListRepositoryAssigner();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    notificationMessageListRepositoryAssigner.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    notificationMessageListRepositoryAssigner.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    notificationMessageListRepositoryAssigner.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    notificationMessageListRepositoryAssigner.avatarUrl = avatarUrl;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    notificationMessageListRepositoryAssigner.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    notificationMessageListRepositoryAssigner.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    notificationMessageListRepositoryAssigner.remark = remark;
  }
  final String? followersUrl =
      jsonConvert.convert<String>(json['followers_url']);
  if (followersUrl != null) {
    notificationMessageListRepositoryAssigner.followersUrl = followersUrl;
  }
  final String? followingUrl =
      jsonConvert.convert<String>(json['following_url']);
  if (followingUrl != null) {
    notificationMessageListRepositoryAssigner.followingUrl = followingUrl;
  }
  final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
  if (gistsUrl != null) {
    notificationMessageListRepositoryAssigner.gistsUrl = gistsUrl;
  }
  final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
  if (starredUrl != null) {
    notificationMessageListRepositoryAssigner.starredUrl = starredUrl;
  }
  final String? subscriptionsUrl =
      jsonConvert.convert<String>(json['subscriptions_url']);
  if (subscriptionsUrl != null) {
    notificationMessageListRepositoryAssigner.subscriptionsUrl =
        subscriptionsUrl;
  }
  final String? organizationsUrl =
      jsonConvert.convert<String>(json['organizations_url']);
  if (organizationsUrl != null) {
    notificationMessageListRepositoryAssigner.organizationsUrl =
        organizationsUrl;
  }
  final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
  if (reposUrl != null) {
    notificationMessageListRepositoryAssigner.reposUrl = reposUrl;
  }
  final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
  if (eventsUrl != null) {
    notificationMessageListRepositoryAssigner.eventsUrl = eventsUrl;
  }
  final String? receivedEventsUrl =
      jsonConvert.convert<String>(json['received_events_url']);
  if (receivedEventsUrl != null) {
    notificationMessageListRepositoryAssigner.receivedEventsUrl =
        receivedEventsUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    notificationMessageListRepositoryAssigner.type = type;
  }
  return notificationMessageListRepositoryAssigner;
}

Map<String, dynamic> $NotificationMessageListRepositoryAssignerToJson(
    NotificationMessageListRepositoryAssigner entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  data['url'] = entity.url;
  data['html_url'] = entity.htmlUrl;
  data['remark'] = entity.remark;
  data['followers_url'] = entity.followersUrl;
  data['following_url'] = entity.followingUrl;
  data['gists_url'] = entity.gistsUrl;
  data['starred_url'] = entity.starredUrl;
  data['subscriptions_url'] = entity.subscriptionsUrl;
  data['organizations_url'] = entity.organizationsUrl;
  data['repos_url'] = entity.reposUrl;
  data['events_url'] = entity.eventsUrl;
  data['received_events_url'] = entity.receivedEventsUrl;
  data['type'] = entity.type;
  return data;
}

NotificationMessageListSubject $NotificationMessageListSubjectFromJson(
    Map<String, dynamic> json) {
  final NotificationMessageListSubject notificationMessageListSubject =
      NotificationMessageListSubject();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    notificationMessageListSubject.title = title;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    notificationMessageListSubject.url = url;
  }
  final String? latestCommentUrl =
      jsonConvert.convert<String>(json['latest_comment_url']);
  if (latestCommentUrl != null) {
    notificationMessageListSubject.latestCommentUrl = latestCommentUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    notificationMessageListSubject.type = type;
  }
  return notificationMessageListSubject;
}

Map<String, dynamic> $NotificationMessageListSubjectToJson(
    NotificationMessageListSubject entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['url'] = entity.url;
  data['latest_comment_url'] = entity.latestCommentUrl;
  data['type'] = entity.type;
  return data;
}

NotificationMessageListNamespaces $NotificationMessageListNamespacesFromJson(
    Map<String, dynamic> json) {
  final NotificationMessageListNamespaces notificationMessageListNamespaces =
      NotificationMessageListNamespaces();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    notificationMessageListNamespaces.name = name;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    notificationMessageListNamespaces.htmlUrl = htmlUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    notificationMessageListNamespaces.type = type;
  }
  return notificationMessageListNamespaces;
}

Map<String, dynamic> $NotificationMessageListNamespacesToJson(
    NotificationMessageListNamespaces entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['html_url'] = entity.htmlUrl;
  data['type'] = entity.type;
  return data;
}
