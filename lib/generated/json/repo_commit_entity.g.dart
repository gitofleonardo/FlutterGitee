import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/repo/bean/repo_commit_entity.dart';

RepoCommitEntity $RepoCommitEntityFromJson(Map<String, dynamic> json) {
  final RepoCommitEntity repoCommitEntity = RepoCommitEntity();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    repoCommitEntity.url = url;
  }
  final String? sha = jsonConvert.convert<String>(json['sha']);
  if (sha != null) {
    repoCommitEntity.sha = sha;
  }
  final RepoCommitCommit? commit =
      jsonConvert.convert<RepoCommitCommit>(json['commit']);
  if (commit != null) {
    repoCommitEntity.commit = commit;
  }
  final RepoCommitAuthor? author =
      jsonConvert.convert<RepoCommitAuthor>(json['author']);
  if (author != null) {
    repoCommitEntity.author = author;
  }
  final RepoCommitCommitter? committer =
      jsonConvert.convert<RepoCommitCommitter>(json['committer']);
  if (committer != null) {
    repoCommitEntity.committer = committer;
  }
  final List<RepoCommitParents>? parents =
      jsonConvert.convertListNotNull<RepoCommitParents>(json['parents']);
  if (parents != null) {
    repoCommitEntity.parents = parents;
  }
  return repoCommitEntity;
}

Map<String, dynamic> $RepoCommitEntityToJson(RepoCommitEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['sha'] = entity.sha;
  data['commit'] = entity.commit?.toJson();
  data['author'] = entity.author?.toJson();
  data['committer'] = entity.committer?.toJson();
  data['parents'] = entity.parents?.map((v) => v.toJson()).toList();
  return data;
}

RepoCommitCommit $RepoCommitCommitFromJson(Map<String, dynamic> json) {
  final RepoCommitCommit repoCommitCommit = RepoCommitCommit();
  final RepoCommitCommitAuthor? author =
      jsonConvert.convert<RepoCommitCommitAuthor>(json['author']);
  if (author != null) {
    repoCommitCommit.author = author;
  }
  final RepoCommitCommitCommitter? committer =
      jsonConvert.convert<RepoCommitCommitCommitter>(json['committer']);
  if (committer != null) {
    repoCommitCommit.committer = committer;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    repoCommitCommit.message = message;
  }
  final RepoCommitCommitTree? tree =
      jsonConvert.convert<RepoCommitCommitTree>(json['tree']);
  if (tree != null) {
    repoCommitCommit.tree = tree;
  }
  return repoCommitCommit;
}

Map<String, dynamic> $RepoCommitCommitToJson(RepoCommitCommit entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['author'] = entity.author?.toJson();
  data['committer'] = entity.committer?.toJson();
  data['message'] = entity.message;
  data['tree'] = entity.tree?.toJson();
  return data;
}

RepoCommitCommitAuthor $RepoCommitCommitAuthorFromJson(
    Map<String, dynamic> json) {
  final RepoCommitCommitAuthor repoCommitCommitAuthor =
      RepoCommitCommitAuthor();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repoCommitCommitAuthor.name = name;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    repoCommitCommitAuthor.date = date;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    repoCommitCommitAuthor.email = email;
  }
  return repoCommitCommitAuthor;
}

Map<String, dynamic> $RepoCommitCommitAuthorToJson(
    RepoCommitCommitAuthor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['date'] = entity.date;
  data['email'] = entity.email;
  return data;
}

RepoCommitCommitCommitter $RepoCommitCommitCommitterFromJson(
    Map<String, dynamic> json) {
  final RepoCommitCommitCommitter repoCommitCommitCommitter =
      RepoCommitCommitCommitter();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repoCommitCommitCommitter.name = name;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    repoCommitCommitCommitter.date = date;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    repoCommitCommitCommitter.email = email;
  }
  return repoCommitCommitCommitter;
}

Map<String, dynamic> $RepoCommitCommitCommitterToJson(
    RepoCommitCommitCommitter entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['date'] = entity.date;
  data['email'] = entity.email;
  return data;
}

RepoCommitCommitTree $RepoCommitCommitTreeFromJson(Map<String, dynamic> json) {
  final RepoCommitCommitTree repoCommitCommitTree = RepoCommitCommitTree();
  final String? sha = jsonConvert.convert<String>(json['sha']);
  if (sha != null) {
    repoCommitCommitTree.sha = sha;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    repoCommitCommitTree.url = url;
  }
  return repoCommitCommitTree;
}

Map<String, dynamic> $RepoCommitCommitTreeToJson(RepoCommitCommitTree entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sha'] = entity.sha;
  data['url'] = entity.url;
  return data;
}

RepoCommitAuthor $RepoCommitAuthorFromJson(Map<String, dynamic> json) {
  final RepoCommitAuthor repoCommitAuthor = RepoCommitAuthor();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    repoCommitAuthor.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    repoCommitAuthor.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repoCommitAuthor.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    repoCommitAuthor.avatarUrl = avatarUrl;
  }
  return repoCommitAuthor;
}

Map<String, dynamic> $RepoCommitAuthorToJson(RepoCommitAuthor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

RepoCommitCommitter $RepoCommitCommitterFromJson(Map<String, dynamic> json) {
  final RepoCommitCommitter repoCommitCommitter = RepoCommitCommitter();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    repoCommitCommitter.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    repoCommitCommitter.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repoCommitCommitter.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    repoCommitCommitter.avatarUrl = avatarUrl;
  }
  return repoCommitCommitter;
}

Map<String, dynamic> $RepoCommitCommitterToJson(RepoCommitCommitter entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

RepoCommitParents $RepoCommitParentsFromJson(Map<String, dynamic> json) {
  final RepoCommitParents repoCommitParents = RepoCommitParents();
  final String? sha = jsonConvert.convert<String>(json['sha']);
  if (sha != null) {
    repoCommitParents.sha = sha;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    repoCommitParents.url = url;
  }
  return repoCommitParents;
}

Map<String, dynamic> $RepoCommitParentsToJson(RepoCommitParents entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sha'] = entity.sha;
  data['url'] = entity.url;
  return data;
}
