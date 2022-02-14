import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/user/bean/public_key_entity.dart';

PublicKeyEntity $PublicKeyEntityFromJson(Map<String, dynamic> json) {
  final PublicKeyEntity publicKeyEntity = PublicKeyEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    publicKeyEntity.id = id;
  }
  final String? key = jsonConvert.convert<String>(json['key']);
  if (key != null) {
    publicKeyEntity.key = key;
  }
  final bool? expanded = jsonConvert.convert<bool>(json['expanded']);
  if (expanded != null) {
    publicKeyEntity.expanded = expanded;
  }
  return publicKeyEntity;
}

Map<String, dynamic> $PublicKeyEntityToJson(PublicKeyEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['key'] = entity.key;
  data['expanded'] = entity.expanded;
  return data;
}
