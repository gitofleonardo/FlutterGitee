import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/main/start/home/message/bean/user_message_entity.dart';

UserMessageEntity $UserMessageEntityFromJson(Map<String, dynamic> json) {
  final UserMessageEntity userMessageEntity = UserMessageEntity();
  final int? totalCount = jsonConvert.convert<int>(json['total_count']);
  if (totalCount != null) {
    userMessageEntity.totalCount = totalCount;
  }
  final List<UserMessageList>? list =
      jsonConvert.convertListNotNull<UserMessageList>(json['list']);
  if (list != null) {
    userMessageEntity.list = list;
  }
  return userMessageEntity;
}

Map<String, dynamic> $UserMessageEntityToJson(UserMessageEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['total_count'] = entity.totalCount;
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  return data;
}

UserMessageList $UserMessageListFromJson(Map<String, dynamic> json) {
  final UserMessageList userMessageList = UserMessageList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userMessageList.id = id;
  }
  final UserMessageListSender? sender =
      jsonConvert.convert<UserMessageListSender>(json['sender']);
  if (sender != null) {
    userMessageList.sender = sender;
  }
  final bool? unread = jsonConvert.convert<bool>(json['unread']);
  if (unread != null) {
    userMessageList.unread = unread;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    userMessageList.content = content;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    userMessageList.updatedAt = updatedAt;
  }
  return userMessageList;
}

Map<String, dynamic> $UserMessageListToJson(UserMessageList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['sender'] = entity.sender?.toJson();
  data['unread'] = entity.unread;
  data['content'] = entity.content;
  data['updated_at'] = entity.updatedAt;
  return data;
}

UserMessageListSender $UserMessageListSenderFromJson(
    Map<String, dynamic> json) {
  final UserMessageListSender userMessageListSender = UserMessageListSender();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userMessageListSender.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    userMessageListSender.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userMessageListSender.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    userMessageListSender.avatarUrl = avatarUrl;
  }
  return userMessageListSender;
}

Map<String, dynamic> $UserMessageListSenderToJson(
    UserMessageListSender entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}
