import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/repo/bean/repository_tree_entity.dart';

RepositoryTreeEntity $RepositoryTreeEntityFromJson(Map<String, dynamic> json) {
	final RepositoryTreeEntity repositoryTreeEntity = RepositoryTreeEntity();
	final String? sha = jsonConvert.convert<String>(json['sha']);
	if (sha != null) {
		repositoryTreeEntity.sha = sha;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		repositoryTreeEntity.url = url;
	}
	final List<RepositoryTreeTree>? tree = jsonConvert.convertListNotNull<RepositoryTreeTree>(json['tree']);
	if (tree != null) {
		repositoryTreeEntity.tree = tree;
	}
	final bool? truncated = jsonConvert.convert<bool>(json['truncated']);
	if (truncated != null) {
		repositoryTreeEntity.truncated = truncated;
	}
	return repositoryTreeEntity;
}

Map<String, dynamic> $RepositoryTreeEntityToJson(RepositoryTreeEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['sha'] = entity.sha;
	data['url'] = entity.url;
	data['tree'] =  entity.tree?.map((v) => v.toJson()).toList();
	data['truncated'] = entity.truncated;
	return data;
}

RepositoryTreeTree $RepositoryTreeTreeFromJson(Map<String, dynamic> json) {
	final RepositoryTreeTree repositoryTreeTree = RepositoryTreeTree();
	final String? path = jsonConvert.convert<String>(json['path']);
	if (path != null) {
		repositoryTreeTree.path = path;
	}
	final String? mode = jsonConvert.convert<String>(json['mode']);
	if (mode != null) {
		repositoryTreeTree.mode = mode;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		repositoryTreeTree.type = type;
	}
	final String? sha = jsonConvert.convert<String>(json['sha']);
	if (sha != null) {
		repositoryTreeTree.sha = sha;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		repositoryTreeTree.size = size;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		repositoryTreeTree.url = url;
	}
	return repositoryTreeTree;
}

Map<String, dynamic> $RepositoryTreeTreeToJson(RepositoryTreeTree entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['path'] = entity.path;
	data['mode'] = entity.mode;
	data['type'] = entity.type;
	data['sha'] = entity.sha;
	data['size'] = entity.size;
	data['url'] = entity.url;
	return data;
}