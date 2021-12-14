import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/user/bean/result/success/login_success_result_entity.dart';

LoginSuccessResultEntity $LoginSuccessResultEntityFromJson(Map<String, dynamic> json) {
	final LoginSuccessResultEntity loginSuccessResultEntity = LoginSuccessResultEntity();
	final String? accessToken = jsonConvert.convert<String>(json['access_token']);
	if (accessToken != null) {
		loginSuccessResultEntity.accessToken = accessToken;
	}
	final String? tokenType = jsonConvert.convert<String>(json['token_type']);
	if (tokenType != null) {
		loginSuccessResultEntity.tokenType = tokenType;
	}
	final int? expiresIn = jsonConvert.convert<int>(json['expires_in']);
	if (expiresIn != null) {
		loginSuccessResultEntity.expiresIn = expiresIn;
	}
	final String? refreshToken = jsonConvert.convert<String>(json['refresh_token']);
	if (refreshToken != null) {
		loginSuccessResultEntity.refreshToken = refreshToken;
	}
	final String? scope = jsonConvert.convert<String>(json['scope']);
	if (scope != null) {
		loginSuccessResultEntity.scope = scope;
	}
	final int? createdAt = jsonConvert.convert<int>(json['created_at']);
	if (createdAt != null) {
		loginSuccessResultEntity.createdAt = createdAt;
	}
	return loginSuccessResultEntity;
}

Map<String, dynamic> $LoginSuccessResultEntityToJson(LoginSuccessResultEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['access_token'] = entity.accessToken;
	data['token_type'] = entity.tokenType;
	data['expires_in'] = entity.expiresIn;
	data['refresh_token'] = entity.refreshToken;
	data['scope'] = entity.scope;
	data['created_at'] = entity.createdAt;
	return data;
}