import 'dart:convert';
import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/login_success_result_entity.g.dart';

@JsonSerializable()
class LoginSuccessResultEntity{

	@JSONField(name: "access_token")
	String? accessToken;
	@JSONField(name: "token_type")
	String? tokenType;
	@JSONField(name: "expires_in")
	int? expiresIn;
	@JSONField(name: "refresh_token")
	String? refreshToken;
	String? scope;
	@JSONField(name: "created_at")
	int? createdAt;
  
  LoginSuccessResultEntity();

  factory LoginSuccessResultEntity.fromJson(Map<String, dynamic> json) => $LoginSuccessResultEntityFromJson(json);

  Map<String, dynamic> toJson() => $LoginSuccessResultEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}