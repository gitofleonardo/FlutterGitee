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
  return followResultEntity;
}

Map<String, dynamic> $FollowResultEntityToJson(FollowResultEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}
