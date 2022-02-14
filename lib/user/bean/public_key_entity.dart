import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/public_key_entity.g.dart';

@JsonSerializable()
class PublicKeyEntity {
  int? id;
  String? key;

  bool expanded = false;

  PublicKeyEntity();

  factory PublicKeyEntity.fromJson(Map<String, dynamic> json) =>
      $PublicKeyEntityFromJson(json);

  Map<String, dynamic> toJson() => $PublicKeyEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
