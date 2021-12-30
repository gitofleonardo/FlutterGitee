import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/repo/bean/repo_file_entity.dart';

RepoFileEntity $RepoFileEntityFromJson(Map<String, dynamic> json) {
  final RepoFileEntity repoFileEntity = RepoFileEntity();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    repoFileEntity.type = type;
  }
  final String? encoding = jsonConvert.convert<String>(json['encoding']);
  if (encoding != null) {
    repoFileEntity.encoding = encoding;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    repoFileEntity.size = size;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repoFileEntity.name = name;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    repoFileEntity.path = path;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    repoFileEntity.content = content;
  }
  final String? sha = jsonConvert.convert<String>(json['sha']);
  if (sha != null) {
    repoFileEntity.sha = sha;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    repoFileEntity.url = url;
  }
  final ReadmeLinks? rLinks = jsonConvert.convert<ReadmeLinks>(json['_links']);
  if (rLinks != null) {
    repoFileEntity.rLinks = rLinks;
  }
  return repoFileEntity;
}

Map<String, dynamic> $RepoFileEntityToJson(RepoFileEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['encoding'] = entity.encoding;
  data['size'] = entity.size;
  data['name'] = entity.name;
  data['path'] = entity.path;
  data['content'] = entity.content;
  data['sha'] = entity.sha;
  data['url'] = entity.url;
  data['_links'] = entity.rLinks?.toJson();
  return data;
}

ReadmeLinks $ReadmeLinksFromJson(Map<String, dynamic> json) {
  final ReadmeLinks readmeLinks = ReadmeLinks();
  final String? self = jsonConvert.convert<String>(json['self']);
  if (self != null) {
    readmeLinks.self = self;
  }
  final String? html = jsonConvert.convert<String>(json['html']);
  if (html != null) {
    readmeLinks.html = html;
  }
  return readmeLinks;
}

Map<String, dynamic> $ReadmeLinksToJson(ReadmeLinks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['self'] = entity.self;
  data['html'] = entity.html;
  return data;
}
