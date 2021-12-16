import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/repo_file_entity.g.dart';

@JsonSerializable()
class RepoFileEntity {
  String? type;
  String? encoding;
  int? size;
  String? name;
  String? path;
  String? content;
  String? sha;
  String? url;
  @JSONField(name: "html_url")
  String? htmlUrl;
  @JSONField(name: "download_url")
  String? downloadUrl;
  @JSONField(name: "_links")
  ReadmeLinks? rLinks;

  RepoFileEntity();

  factory RepoFileEntity.fromJson(Map<String, dynamic> json) =>
      $RepoFileEntityFromJson(json);

  Map<String, dynamic> toJson() => $RepoFileEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ReadmeLinks {
  String? self;
  String? html;

  ReadmeLinks();

  factory ReadmeLinks.fromJson(Map<String, dynamic> json) =>
      $ReadmeLinksFromJson(json);

  Map<String, dynamic> toJson() => $ReadmeLinksToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
