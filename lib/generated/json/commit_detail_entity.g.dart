import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/repo/bean/commit_detail_entity.dart';

CommitDetailEntity $CommitDetailEntityFromJson(Map<String, dynamic> json) {
  final CommitDetailEntity commitDetailEntity = CommitDetailEntity();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    commitDetailEntity.url = url;
  }
  final String? sha = jsonConvert.convert<String>(json['sha']);
  if (sha != null) {
    commitDetailEntity.sha = sha;
  }
  final CommitDetailCommit? commit =
      jsonConvert.convert<CommitDetailCommit>(json['commit']);
  if (commit != null) {
    commitDetailEntity.commit = commit;
  }
  final List<CommitDetailFiles>? files =
      jsonConvert.convertListNotNull<CommitDetailFiles>(json['files']);
  if (files != null) {
    commitDetailEntity.files = files;
  }
  return commitDetailEntity;
}

Map<String, dynamic> $CommitDetailEntityToJson(CommitDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['sha'] = entity.sha;
  data['commit'] = entity.commit?.toJson();
  data['files'] = entity.files.map((v) => v.toJson()).toList();
  return data;
}

CommitDetailCommit $CommitDetailCommitFromJson(Map<String, dynamic> json) {
  final CommitDetailCommit commitDetailCommit = CommitDetailCommit();
  final CommitDetailCommitAuthor? author =
      jsonConvert.convert<CommitDetailCommitAuthor>(json['author']);
  if (author != null) {
    commitDetailCommit.author = author;
  }
  final CommitDetailCommitCommitter? committer =
      jsonConvert.convert<CommitDetailCommitCommitter>(json['committer']);
  if (committer != null) {
    commitDetailCommit.committer = committer;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    commitDetailCommit.message = message;
  }
  final CommitDetailCommitTree? tree =
      jsonConvert.convert<CommitDetailCommitTree>(json['tree']);
  if (tree != null) {
    commitDetailCommit.tree = tree;
  }
  return commitDetailCommit;
}

Map<String, dynamic> $CommitDetailCommitToJson(CommitDetailCommit entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['author'] = entity.author?.toJson();
  data['committer'] = entity.committer?.toJson();
  data['message'] = entity.message;
  data['tree'] = entity.tree?.toJson();
  return data;
}

CommitDetailCommitAuthor $CommitDetailCommitAuthorFromJson(
    Map<String, dynamic> json) {
  final CommitDetailCommitAuthor commitDetailCommitAuthor =
      CommitDetailCommitAuthor();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    commitDetailCommitAuthor.name = name;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    commitDetailCommitAuthor.date = date;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    commitDetailCommitAuthor.email = email;
  }
  return commitDetailCommitAuthor;
}

Map<String, dynamic> $CommitDetailCommitAuthorToJson(
    CommitDetailCommitAuthor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['date'] = entity.date;
  data['email'] = entity.email;
  return data;
}

CommitDetailCommitCommitter $CommitDetailCommitCommitterFromJson(
    Map<String, dynamic> json) {
  final CommitDetailCommitCommitter commitDetailCommitCommitter =
      CommitDetailCommitCommitter();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    commitDetailCommitCommitter.name = name;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    commitDetailCommitCommitter.date = date;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    commitDetailCommitCommitter.email = email;
  }
  return commitDetailCommitCommitter;
}

Map<String, dynamic> $CommitDetailCommitCommitterToJson(
    CommitDetailCommitCommitter entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['date'] = entity.date;
  data['email'] = entity.email;
  return data;
}

CommitDetailCommitTree $CommitDetailCommitTreeFromJson(
    Map<String, dynamic> json) {
  final CommitDetailCommitTree commitDetailCommitTree =
      CommitDetailCommitTree();
  final String? sha = jsonConvert.convert<String>(json['sha']);
  if (sha != null) {
    commitDetailCommitTree.sha = sha;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    commitDetailCommitTree.url = url;
  }
  return commitDetailCommitTree;
}

Map<String, dynamic> $CommitDetailCommitTreeToJson(
    CommitDetailCommitTree entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sha'] = entity.sha;
  data['url'] = entity.url;
  return data;
}

CommitDetailFiles $CommitDetailFilesFromJson(Map<String, dynamic> json) {
  final CommitDetailFiles commitDetailFiles = CommitDetailFiles();
  final String? sha = jsonConvert.convert<String>(json['sha']);
  if (sha != null) {
    commitDetailFiles.sha = sha;
  }
  final String? filename = jsonConvert.convert<String>(json['filename']);
  if (filename != null) {
    commitDetailFiles.filename = filename;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    commitDetailFiles.status = status;
  }
  final String? xPatch = jsonConvert.convert<String>(json['xPatch']);
  if (xPatch != null) {
    commitDetailFiles.xPatch = xPatch;
  }
  return commitDetailFiles;
}

Map<String, dynamic> $CommitDetailFilesToJson(CommitDetailFiles entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sha'] = entity.sha;
  data['filename'] = entity.filename;
  data['status'] = entity.status;
  data['xPatch'] = entity.xPatch;
  return data;
}
