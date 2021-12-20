import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/commit_detail_entity.g.dart';

@JsonSerializable()
class CommitDetailEntity {
  String? url;
  String? sha;
  @JSONField(name: "html_url")
  String? htmlUrl;
  @JSONField(name: "comments_url")
  String? commentsUrl;
  CommitDetailCommit? commit;
  dynamic? author;
  dynamic? committer;
  List<CommitDetailParents>? parents;
  CommitDetailStats? stats;
  List<CommitDetailFiles> files = [];

  CommitDetailEntity();

  factory CommitDetailEntity.fromJson(Map<String, dynamic> json) =>
      $CommitDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $CommitDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CommitDetailCommit {
  CommitDetailCommitAuthor? author;
  CommitDetailCommitCommitter? committer;
  String? message;
  CommitDetailCommitTree? tree;

  CommitDetailCommit();

  factory CommitDetailCommit.fromJson(Map<String, dynamic> json) =>
      $CommitDetailCommitFromJson(json);

  Map<String, dynamic> toJson() => $CommitDetailCommitToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CommitDetailCommitAuthor {
  String? name;
  String? date;
  String? email;

  CommitDetailCommitAuthor();

  factory CommitDetailCommitAuthor.fromJson(Map<String, dynamic> json) =>
      $CommitDetailCommitAuthorFromJson(json);

  Map<String, dynamic> toJson() => $CommitDetailCommitAuthorToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CommitDetailCommitCommitter {
  String? name;
  String? date;
  String? email;

  CommitDetailCommitCommitter();

  factory CommitDetailCommitCommitter.fromJson(Map<String, dynamic> json) =>
      $CommitDetailCommitCommitterFromJson(json);

  Map<String, dynamic> toJson() => $CommitDetailCommitCommitterToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CommitDetailCommitTree {
  String? sha;
  String? url;

  CommitDetailCommitTree();

  factory CommitDetailCommitTree.fromJson(Map<String, dynamic> json) =>
      $CommitDetailCommitTreeFromJson(json);

  Map<String, dynamic> toJson() => $CommitDetailCommitTreeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CommitDetailParents {
  String? sha;
  String? url;

  CommitDetailParents();

  factory CommitDetailParents.fromJson(Map<String, dynamic> json) =>
      $CommitDetailParentsFromJson(json);

  Map<String, dynamic> toJson() => $CommitDetailParentsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CommitDetailStats {
  String? id;
  int? additions;
  int? deletions;
  int? total;

  CommitDetailStats();

  factory CommitDetailStats.fromJson(Map<String, dynamic> json) =>
      $CommitDetailStatsFromJson(json);

  Map<String, dynamic> toJson() => $CommitDetailStatsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CommitDetailFiles {
  String? sha;
  String? filename;
  String? status;
  int? additions;
  int? deletions;
  int? changes;
  @JSONField(name: "blob_url")
  String? blobUrl;
  @JSONField(name: "raw_url")
  String? rawUrl;
  @JSONField(name: "content_url")
  String? contentUrl;
  @JSONField(name: "patch")
  String? xPatch;

  CommitDetailFiles();

  factory CommitDetailFiles.fromJson(Map<String, dynamic> json) =>
      $CommitDetailFilesFromJson(json);

  Map<String, dynamic> toJson() => $CommitDetailFilesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
