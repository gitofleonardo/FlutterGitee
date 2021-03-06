import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/repo_commit_entity.g.dart';

@JsonSerializable()
class RepoCommitEntity {
  String? url;
  String? sha;
  RepoCommitCommit? commit;
  RepoCommitAuthor? author;
  RepoCommitCommitter? committer;
  List<RepoCommitParents>? parents;

  RepoCommitEntity();

  factory RepoCommitEntity.fromJson(Map<String, dynamic> json) =>
      $RepoCommitEntityFromJson(json);

  Map<String, dynamic> toJson() => $RepoCommitEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepoCommitCommit {
  RepoCommitCommitAuthor? author;
  RepoCommitCommitCommitter? committer;
  String? message;
  RepoCommitCommitTree? tree;

  RepoCommitCommit();

  factory RepoCommitCommit.fromJson(Map<String, dynamic> json) =>
      $RepoCommitCommitFromJson(json);

  Map<String, dynamic> toJson() => $RepoCommitCommitToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepoCommitCommitAuthor {
  String? name;
  String? date;
  String? email;

  RepoCommitCommitAuthor();

  factory RepoCommitCommitAuthor.fromJson(Map<String, dynamic> json) =>
      $RepoCommitCommitAuthorFromJson(json);

  Map<String, dynamic> toJson() => $RepoCommitCommitAuthorToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepoCommitCommitCommitter {
  String? name;
  String? date;
  String? email;

  RepoCommitCommitCommitter();

  factory RepoCommitCommitCommitter.fromJson(Map<String, dynamic> json) =>
      $RepoCommitCommitCommitterFromJson(json);

  Map<String, dynamic> toJson() => $RepoCommitCommitCommitterToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepoCommitCommitTree {
  String? sha;
  String? url;

  RepoCommitCommitTree();

  factory RepoCommitCommitTree.fromJson(Map<String, dynamic> json) =>
      $RepoCommitCommitTreeFromJson(json);

  Map<String, dynamic> toJson() => $RepoCommitCommitTreeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepoCommitAuthor {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  RepoCommitAuthor();

  factory RepoCommitAuthor.fromJson(Map<String, dynamic> json) =>
      $RepoCommitAuthorFromJson(json);

  Map<String, dynamic> toJson() => $RepoCommitAuthorToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepoCommitCommitter {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  RepoCommitCommitter();

  factory RepoCommitCommitter.fromJson(Map<String, dynamic> json) =>
      $RepoCommitCommitterFromJson(json);

  Map<String, dynamic> toJson() => $RepoCommitCommitterToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RepoCommitParents {
  String? sha;
  String? url;

  RepoCommitParents();

  factory RepoCommitParents.fromJson(Map<String, dynamic> json) =>
      $RepoCommitParentsFromJson(json);

  Map<String, dynamic> toJson() => $RepoCommitParentsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
