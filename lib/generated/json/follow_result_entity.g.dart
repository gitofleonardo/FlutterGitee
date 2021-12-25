import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/user/bean/follow_result_entity.dart';

FollowResultEntity $FollowResultEntityFromJson(Map<String, dynamic> json) {
  final FollowResultEntity followResultEntity = FollowResultEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    followResultEntity.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    followResultEntity.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    followResultEntity.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    followResultEntity.avatarUrl = avatarUrl;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    followResultEntity.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    followResultEntity.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    followResultEntity.remark = remark;
  }
  final String? followersUrl =
      jsonConvert.convert<String>(json['followers_url']);
  if (followersUrl != null) {
    followResultEntity.followersUrl = followersUrl;
  }
  final String? followingUrl =
      jsonConvert.convert<String>(json['following_url']);
  if (followingUrl != null) {
    followResultEntity.followingUrl = followingUrl;
  }
  final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
  if (gistsUrl != null) {
    followResultEntity.gistsUrl = gistsUrl;
  }
  final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
  if (starredUrl != null) {
    followResultEntity.starredUrl = starredUrl;
  }
  final String? subscriptionsUrl =
      jsonConvert.convert<String>(json['subscriptions_url']);
  if (subscriptionsUrl != null) {
    followResultEntity.subscriptionsUrl = subscriptionsUrl;
  }
  final String? organizationsUrl =
      jsonConvert.convert<String>(json['organizations_url']);
  if (organizationsUrl != null) {
    followResultEntity.organizationsUrl = organizationsUrl;
  }
  final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
  if (reposUrl != null) {
    followResultEntity.reposUrl = reposUrl;
  }
  final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
  if (eventsUrl != null) {
    followResultEntity.eventsUrl = eventsUrl;
  }
  final String? receivedEventsUrl =
      jsonConvert.convert<String>(json['received_events_url']);
  if (receivedEventsUrl != null) {
    followResultEntity.receivedEventsUrl = receivedEventsUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    followResultEntity.type = type;
  }
  return followResultEntity;
}

Map<String, dynamic> $FollowResultEntityToJson(FollowResultEntity entity) {
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
