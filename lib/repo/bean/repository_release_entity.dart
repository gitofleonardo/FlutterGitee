import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/repository_release_entity.g.dart';

@JsonSerializable()
class RepositoryReleaseEntity {
  double? id;
  @JSONField(name: "tag_name")
  String? tagName;
  @JSONField(name: "target_commitish")
  String? targetCommitish;
  bool? prerelease;
  String? name;
  String? body;
  RepositoryReleaseAuthor? author;
  @JSONField(name: "created_at")
  String? createdAt;
  List<RepositoryReleaseAssets>? assets;

  RepositoryReleaseEntity();

  factory RepositoryReleaseEntity.fromJson(Map<String, dynamic> json) =>
      $RepositoryReleaseEntityFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryReleaseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepositoryReleaseAuthor {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  RepositoryReleaseAuthor();

  factory RepositoryReleaseAuthor.fromJson(Map<String, dynamic> json) =>
      $RepositoryReleaseAuthorFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryReleaseAuthorToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepositoryReleaseAssets {
  @JSONField(name: "browser_download_url")
  String? browserDownloadUrl;
  String? name;

  RepositoryReleaseAssets();

  factory RepositoryReleaseAssets.fromJson(Map<String, dynamic> json) =>
      $RepositoryReleaseAssetsFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryReleaseAssetsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
