import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/repo/bean/repo_file_entity.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';

RepositoryEntity $RepositoryEntityFromJson(Map<String, dynamic> json) {
  final RepositoryEntity repositoryEntity = RepositoryEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    repositoryEntity.id = id;
  }
  final String? fullName = jsonConvert.convert<String>(json['full_name']);
  if (fullName != null) {
    repositoryEntity.fullName = fullName;
  }
  final String? humanName = jsonConvert.convert<String>(json['human_name']);
  if (humanName != null) {
    repositoryEntity.humanName = humanName;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    repositoryEntity.url = url;
  }
  final RepositoryNamespace? namespace =
      jsonConvert.convert<RepositoryNamespace>(json['namespace']);
  if (namespace != null) {
    repositoryEntity.namespace = namespace;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    repositoryEntity.path = path;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repositoryEntity.name = name;
  }
  final RepositoryOwner? owner =
      jsonConvert.convert<RepositoryOwner>(json['owner']);
  if (owner != null) {
    repositoryEntity.owner = owner;
  }
  final RepositoryAssigner? assigner =
      jsonConvert.convert<RepositoryAssigner>(json['assigner']);
  if (assigner != null) {
    repositoryEntity.assigner = assigner;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    repositoryEntity.description = description;
  }
  final bool? private = jsonConvert.convert<bool>(json['private']);
  if (private != null) {
    repositoryEntity.private = private;
  }
  final bool? public = jsonConvert.convert<bool>(json['public']);
  if (public != null) {
    repositoryEntity.public = public;
  }
  final bool? internal = jsonConvert.convert<bool>(json['internal']);
  if (internal != null) {
    repositoryEntity.internal = internal;
  }
  final bool? fork = jsonConvert.convert<bool>(json['fork']);
  if (fork != null) {
    repositoryEntity.fork = fork;
  }
  final bool? recommend = jsonConvert.convert<bool>(json['recommend']);
  if (recommend != null) {
    repositoryEntity.recommend = recommend;
  }
  final bool? gvp = jsonConvert.convert<bool>(json['gvp']);
  if (gvp != null) {
    repositoryEntity.gvp = gvp;
  }
  final String? homepage = jsonConvert.convert<String>(json['homepage']);
  if (homepage != null) {
    repositoryEntity.homepage = homepage;
  }
  final String? language = jsonConvert.convert<String>(json['language']);
  if (language != null) {
    repositoryEntity.language = language;
  }
  final double? forksCount = jsonConvert.convert<double>(json['forks_count']);
  if (forksCount != null) {
    repositoryEntity.forksCount = forksCount;
  }
  final double? stargazersCount =
      jsonConvert.convert<double>(json['stargazers_count']);
  if (stargazersCount != null) {
    repositoryEntity.stargazersCount = stargazersCount;
  }
  final double? watchersCount =
      jsonConvert.convert<double>(json['watchers_count']);
  if (watchersCount != null) {
    repositoryEntity.watchersCount = watchersCount;
  }
  final String? defaultBranch =
      jsonConvert.convert<String>(json['default_branch']);
  if (defaultBranch != null) {
    repositoryEntity.defaultBranch = defaultBranch;
  }
  final double? openIssuesCount =
      jsonConvert.convert<double>(json['open_issues_count']);
  if (openIssuesCount != null) {
    repositoryEntity.openIssuesCount = openIssuesCount;
  }
  final bool? hasIssues = jsonConvert.convert<bool>(json['has_issues']);
  if (hasIssues != null) {
    repositoryEntity.hasIssues = hasIssues;
  }
  final bool? hasWiki = jsonConvert.convert<bool>(json['has_wiki']);
  if (hasWiki != null) {
    repositoryEntity.hasWiki = hasWiki;
  }
  final bool? issueComment = jsonConvert.convert<bool>(json['issue_comment']);
  if (issueComment != null) {
    repositoryEntity.issueComment = issueComment;
  }
  final bool? canComment = jsonConvert.convert<bool>(json['can_comment']);
  if (canComment != null) {
    repositoryEntity.canComment = canComment;
  }
  final bool? pullRequestsEnabled =
      jsonConvert.convert<bool>(json['pull_requests_enabled']);
  if (pullRequestsEnabled != null) {
    repositoryEntity.pullRequestsEnabled = pullRequestsEnabled;
  }
  final bool? hasPage = jsonConvert.convert<bool>(json['has_page']);
  if (hasPage != null) {
    repositoryEntity.hasPage = hasPage;
  }
  final String? license = jsonConvert.convert<String>(json['license']);
  if (license != null) {
    repositoryEntity.license = license;
  }
  final bool? outsourced = jsonConvert.convert<bool>(json['outsourced']);
  if (outsourced != null) {
    repositoryEntity.outsourced = outsourced;
  }
  final String? projectCreator =
      jsonConvert.convert<String>(json['project_creator']);
  if (projectCreator != null) {
    repositoryEntity.projectCreator = projectCreator;
  }
  final List<String>? members =
      jsonConvert.convertListNotNull<String>(json['members']);
  if (members != null) {
    repositoryEntity.members = members;
  }
  final String? pushedAt = jsonConvert.convert<String>(json['pushed_at']);
  if (pushedAt != null) {
    repositoryEntity.pushedAt = pushedAt;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    repositoryEntity.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    repositoryEntity.updatedAt = updatedAt;
  }
  final RepositoryEntity? parent =
      jsonConvert.convert<RepositoryEntity>(json['parent']);
  if (parent != null) {
    repositoryEntity.parent = parent;
  }
  final String? paas = jsonConvert.convert<String>(json['paas']);
  if (paas != null) {
    repositoryEntity.paas = paas;
  }
  final bool? stared = jsonConvert.convert<bool>(json['stared']);
  if (stared != null) {
    repositoryEntity.stared = stared;
  }
  final bool? watched = jsonConvert.convert<bool>(json['watched']);
  if (watched != null) {
    repositoryEntity.watched = watched;
  }
  final RepositoryPermission? permission =
      jsonConvert.convert<RepositoryPermission>(json['permission']);
  if (permission != null) {
    repositoryEntity.permission = permission;
  }
  final String? relation = jsonConvert.convert<String>(json['relation']);
  if (relation != null) {
    repositoryEntity.relation = relation;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    repositoryEntity.status = status;
  }
  final bool? emptyRepo = jsonConvert.convert<bool>(json['empty_repo']);
  if (emptyRepo != null) {
    repositoryEntity.emptyRepo = emptyRepo;
  }
  final RepoFileEntity? readme =
      jsonConvert.convert<RepoFileEntity>(json['readme']);
  if (readme != null) {
    repositoryEntity.readme = readme;
  }
  return repositoryEntity;
}

Map<String, dynamic> $RepositoryEntityToJson(RepositoryEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['full_name'] = entity.fullName;
  data['human_name'] = entity.humanName;
  data['url'] = entity.url;
  data['namespace'] = entity.namespace?.toJson();
  data['path'] = entity.path;
  data['name'] = entity.name;
  data['owner'] = entity.owner?.toJson();
  data['assigner'] = entity.assigner?.toJson();
  data['description'] = entity.description;
  data['private'] = entity.private;
  data['public'] = entity.public;
  data['internal'] = entity.internal;
  data['fork'] = entity.fork;
  data['recommend'] = entity.recommend;
  data['gvp'] = entity.gvp;
  data['homepage'] = entity.homepage;
  data['language'] = entity.language;
  data['forks_count'] = entity.forksCount;
  data['stargazers_count'] = entity.stargazersCount;
  data['watchers_count'] = entity.watchersCount;
  data['default_branch'] = entity.defaultBranch;
  data['open_issues_count'] = entity.openIssuesCount;
  data['has_issues'] = entity.hasIssues;
  data['has_wiki'] = entity.hasWiki;
  data['issue_comment'] = entity.issueComment;
  data['can_comment'] = entity.canComment;
  data['pull_requests_enabled'] = entity.pullRequestsEnabled;
  data['has_page'] = entity.hasPage;
  data['license'] = entity.license;
  data['outsourced'] = entity.outsourced;
  data['project_creator'] = entity.projectCreator;
  data['members'] = entity.members;
  data['pushed_at'] = entity.pushedAt;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  data['parent'] = entity.parent?.toJson();
  data['paas'] = entity.paas;
  data['stared'] = entity.stared;
  data['watched'] = entity.watched;
  data['permission'] = entity.permission?.toJson();
  data['relation'] = entity.relation;
  data['status'] = entity.status;
  data['empty_repo'] = entity.emptyRepo;
  data['readme'] = entity.readme?.toJson();
  return data;
}

RepositoryNamespace $RepositoryNamespaceFromJson(Map<String, dynamic> json) {
  final RepositoryNamespace repositoryNamespace = RepositoryNamespace();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    repositoryNamespace.id = id;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    repositoryNamespace.type = type;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repositoryNamespace.name = name;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    repositoryNamespace.path = path;
  }
  return repositoryNamespace;
}

Map<String, dynamic> $RepositoryNamespaceToJson(RepositoryNamespace entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['name'] = entity.name;
  data['path'] = entity.path;
  return data;
}

RepositoryOwner $RepositoryOwnerFromJson(Map<String, dynamic> json) {
  final RepositoryOwner repositoryOwner = RepositoryOwner();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    repositoryOwner.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    repositoryOwner.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repositoryOwner.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    repositoryOwner.avatarUrl = avatarUrl;
  }
  return repositoryOwner;
}

Map<String, dynamic> $RepositoryOwnerToJson(RepositoryOwner entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

RepositoryAssigner $RepositoryAssignerFromJson(Map<String, dynamic> json) {
  final RepositoryAssigner repositoryAssigner = RepositoryAssigner();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    repositoryAssigner.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    repositoryAssigner.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repositoryAssigner.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    repositoryAssigner.avatarUrl = avatarUrl;
  }
  return repositoryAssigner;
}

Map<String, dynamic> $RepositoryAssignerToJson(RepositoryAssigner entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

RepositoryPermission $RepositoryPermissionFromJson(Map<String, dynamic> json) {
  final RepositoryPermission repositoryPermission = RepositoryPermission();
  final bool? pull = jsonConvert.convert<bool>(json['pull']);
  if (pull != null) {
    repositoryPermission.pull = pull;
  }
  final bool? push = jsonConvert.convert<bool>(json['push']);
  if (push != null) {
    repositoryPermission.push = push;
  }
  final bool? admin = jsonConvert.convert<bool>(json['admin']);
  if (admin != null) {
    repositoryPermission.admin = admin;
  }
  return repositoryPermission;
}

Map<String, dynamic> $RepositoryPermissionToJson(RepositoryPermission entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pull'] = entity.pull;
  data['push'] = entity.push;
  data['admin'] = entity.admin;
  return data;
}

RepositoryAssignee $RepositoryAssigneeFromJson(Map<String, dynamic> json) {
  final RepositoryAssignee repositoryAssignee = RepositoryAssignee();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    repositoryAssignee.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    repositoryAssignee.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repositoryAssignee.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    repositoryAssignee.avatarUrl = avatarUrl;
  }
  return repositoryAssignee;
}

Map<String, dynamic> $RepositoryAssigneeToJson(RepositoryAssignee entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

RepositoryTesters $RepositoryTestersFromJson(Map<String, dynamic> json) {
  final RepositoryTesters repositoryTesters = RepositoryTesters();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    repositoryTesters.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    repositoryTesters.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    repositoryTesters.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    repositoryTesters.avatarUrl = avatarUrl;
  }
  return repositoryTesters;
}

Map<String, dynamic> $RepositoryTestersToJson(RepositoryTesters entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}
