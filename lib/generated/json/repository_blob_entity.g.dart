import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/repo/bean/repository_blob_entity.dart';

RepositoryBlobEntity $RepositoryBlobEntityFromJson(Map<String, dynamic> json) {
	final RepositoryBlobEntity repositoryBlobEntity = RepositoryBlobEntity();
	final String? sha = jsonConvert.convert<String>(json['sha']);
	if (sha != null) {
		repositoryBlobEntity.sha = sha;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		repositoryBlobEntity.size = size;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		repositoryBlobEntity.url = url;
	}
	final String? content = jsonConvert.convert<String>(json['content']);
	if (content != null) {
		repositoryBlobEntity.content = content;
	}
	final String? encoding = jsonConvert.convert<String>(json['encoding']);
	if (encoding != null) {
		repositoryBlobEntity.encoding = encoding;
	}
	return repositoryBlobEntity;
}

Map<String, dynamic> $RepositoryBlobEntityToJson(RepositoryBlobEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['sha'] = entity.sha;
	data['size'] = entity.size;
	data['url'] = entity.url;
	data['content'] = entity.content;
	data['encoding'] = entity.encoding;
	return data;
}