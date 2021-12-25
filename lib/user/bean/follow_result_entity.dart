import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/follow_result_entity.g.dart';

@JsonSerializable()
class FollowResultEntity {
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

  FollowResultEntity();

  factory FollowResultEntity.fromJson(Map<String, dynamic> json) =>
      $FollowResultEntityFromJson(json);

  Map<String, dynamic> toJson() => $FollowResultEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
