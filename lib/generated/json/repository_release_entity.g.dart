import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/repo/bean/repository_release_entity.dart';

RepositoryReleaseEntity $RepositoryReleaseEntityFromJson(
    Map<String, dynamic> json) {
  final RepositoryReleaseEntity repositoryReleaseEntity =
      RepositoryReleaseEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    repositoryReleaseEntity.id = id;
  }
  final String? tagName = jsonConvert.convert<String>(json['tag_name']);
  if (tagName != null) {
    repositoryReleaseEntity.tagName = tagName;
  }
  final String? targetCommitish =
      jsonConvert.convert<String>(json['target_commitish']);
  if (targetCommitish != null) {
    repositoryReleaseEntity.targetCommitish = targetCommitish;
  }
  final bool? prerelease = jsonConvert.convert<bool>(json['prerelease']);
  if (prerelease != null) {
    repositoryReleaseEntity.prerelease = prerelease;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repositoryReleaseEntity.name = name;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    repositoryReleaseEntity.body = body;
  }
  final RepositoryReleaseAuthor? author =
      jsonConvert.convert<RepositoryReleaseAuthor>(json['author']);
  if (author != null) {
    repositoryReleaseEntity.author = author;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    repositoryReleaseEntity.createdAt = createdAt;
  }
  final List<RepositoryReleaseAssets>? assets =
      jsonConvert.convertListNotNull<RepositoryReleaseAssets>(json['assets']);
  if (assets != null) {
    repositoryReleaseEntity.assets = assets;
  }
  return repositoryReleaseEntity;
}

Map<String, dynamic> $RepositoryReleaseEntityToJson(
    RepositoryReleaseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['tag_name'] = entity.tagName;
  data['target_commitish'] = entity.targetCommitish;
  data['prerelease'] = entity.prerelease;
  data['name'] = entity.name;
  data['body'] = entity.body;
  data['author'] = entity.author?.toJson();
  data['created_at'] = entity.createdAt;
  data['assets'] = entity.assets?.map((v) => v.toJson()).toList();
  return data;
}

RepositoryReleaseAuthor $RepositoryReleaseAuthorFromJson(
    Map<String, dynamic> json) {
  final RepositoryReleaseAuthor repositoryReleaseAuthor =
      RepositoryReleaseAuthor();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    repositoryReleaseAuthor.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    repositoryReleaseAuthor.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repositoryReleaseAuthor.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    repositoryReleaseAuthor.avatarUrl = avatarUrl;
  }
  return repositoryReleaseAuthor;
}

Map<String, dynamic> $RepositoryReleaseAuthorToJson(
    RepositoryReleaseAuthor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

RepositoryReleaseAssets $RepositoryReleaseAssetsFromJson(
    Map<String, dynamic> json) {
  final RepositoryReleaseAssets repositoryReleaseAssets =
      RepositoryReleaseAssets();
  final String? browserDownloadUrl =
      jsonConvert.convert<String>(json['browser_download_url']);
  if (browserDownloadUrl != null) {
    repositoryReleaseAssets.browserDownloadUrl = browserDownloadUrl;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repositoryReleaseAssets.name = name;
  }
  return repositoryReleaseAssets;
}

Map<String, dynamic> $RepositoryReleaseAssetsToJson(
    RepositoryReleaseAssets entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['browser_download_url'] = entity.browserDownloadUrl;
  data['name'] = entity.name;
  return data;
}
