import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/repository_tree_entity.g.dart';

@JsonSerializable()
class RepositoryTreeEntity {
  String? sha;
  String? url;
  List<RepositoryTreeTree>? tree;
  bool? truncated;

  RepositoryTreeEntity();

  factory RepositoryTreeEntity.fromJson(Map<String, dynamic> json) =>
      $RepositoryTreeEntityFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryTreeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepositoryTreeTree {
  String? path;
  String? mode;
  String? type;
  String? sha;
  int? size;
  String? url;

  RepositoryTreeTree();

  factory RepositoryTreeTree.fromJson(Map<String, dynamic> json) =>
      $RepositoryTreeTreeFromJson(json);

  Map<String, dynamic> toJson() => $RepositoryTreeTreeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
