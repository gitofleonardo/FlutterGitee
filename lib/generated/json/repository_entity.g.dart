import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
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
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    repositoryEntity.htmlUrl = htmlUrl;
  }
  final String? sshUrl = jsonConvert.convert<String>(json['ssh_url']);
  if (sshUrl != null) {
    repositoryEntity.sshUrl = sshUrl;
  }
  final String? forksUrl = jsonConvert.convert<String>(json['forks_url']);
  if (forksUrl != null) {
    repositoryEntity.forksUrl = forksUrl;
  }
  final String? keysUrl = jsonConvert.convert<String>(json['keys_url']);
  if (keysUrl != null) {
    repositoryEntity.keysUrl = keysUrl;
  }
  final String? collaboratorsUrl =
      jsonConvert.convert<String>(json['collaborators_url']);
  if (collaboratorsUrl != null) {
    repositoryEntity.collaboratorsUrl = collaboratorsUrl;
  }
  final String? hooksUrl = jsonConvert.convert<String>(json['hooks_url']);
  if (hooksUrl != null) {
    repositoryEntity.hooksUrl = hooksUrl;
  }
  final String? branchesUrl = jsonConvert.convert<String>(json['branches_url']);
  if (branchesUrl != null) {
    repositoryEntity.branchesUrl = branchesUrl;
  }
  final String? tagsUrl = jsonConvert.convert<String>(json['tags_url']);
  if (tagsUrl != null) {
    repositoryEntity.tagsUrl = tagsUrl;
  }
  final String? blobsUrl = jsonConvert.convert<String>(json['blobs_url']);
  if (blobsUrl != null) {
    repositoryEntity.blobsUrl = blobsUrl;
  }
  final String? stargazersUrl =
      jsonConvert.convert<String>(json['stargazers_url']);
  if (stargazersUrl != null) {
    repositoryEntity.stargazersUrl = stargazersUrl;
  }
  final String? contributorsUrl =
      jsonConvert.convert<String>(json['contributors_url']);
  if (contributorsUrl != null) {
    repositoryEntity.contributorsUrl = contributorsUrl;
  }
  final String? commitsUrl = jsonConvert.convert<String>(json['commits_url']);
  if (commitsUrl != null) {
    repositoryEntity.commitsUrl = commitsUrl;
  }
  final String? commentsUrl = jsonConvert.convert<String>(json['comments_url']);
  if (commentsUrl != null) {
    repositoryEntity.commentsUrl = commentsUrl;
  }
  final String? issueCommentUrl =
      jsonConvert.convert<String>(json['issue_comment_url']);
  if (issueCommentUrl != null) {
    repositoryEntity.issueCommentUrl = issueCommentUrl;
  }
  final String? issuesUrl = jsonConvert.convert<String>(json['issues_url']);
  if (issuesUrl != null) {
    repositoryEntity.issuesUrl = issuesUrl;
  }
  final String? pullsUrl = jsonConvert.convert<String>(json['pulls_url']);
  if (pullsUrl != null) {
    repositoryEntity.pullsUrl = pullsUrl;
  }
  final String? milestonesUrl =
      jsonConvert.convert<String>(json['milestones_url']);
  if (milestonesUrl != null) {
    repositoryEntity.milestonesUrl = milestonesUrl;
  }
  final String? notificationsUrl =
      jsonConvert.convert<String>(json['notifications_url']);
  if (notificationsUrl != null) {
    repositoryEntity.notificationsUrl = notificationsUrl;
  }
  final String? labelsUrl = jsonConvert.convert<String>(json['labels_url']);
  if (labelsUrl != null) {
    repositoryEntity.labelsUrl = labelsUrl;
  }
  final String? releasesUrl = jsonConvert.convert<String>(json['releases_url']);
  if (releasesUrl != null) {
    repositoryEntity.releasesUrl = releasesUrl;
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
  final double? assigneesNumber =
      jsonConvert.convert<double>(json['assignees_number']);
  if (assigneesNumber != null) {
    repositoryEntity.assigneesNumber = assigneesNumber;
  }
  final double? testersNumber =
      jsonConvert.convert<double>(json['testers_number']);
  if (testersNumber != null) {
    repositoryEntity.testersNumber = testersNumber;
  }
  final List<RepositoryAssignee>? assignee =
      jsonConvert.convertListNotNull<RepositoryAssignee>(json['assignee']);
  if (assignee != null) {
    repositoryEntity.assignee = assignee;
  }
  final List<RepositoryTesters>? testers =
      jsonConvert.convertListNotNull<RepositoryTesters>(json['testers']);
  if (testers != null) {
    repositoryEntity.testers = testers;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    repositoryEntity.status = status;
  }
  final bool? emptyRepo = jsonConvert.convert<bool>(json['empty_repo']);
  if (emptyRepo != null) {
    repositoryEntity.emptyRepo = emptyRepo;
  }
  final List<dynamic>? programs =
      jsonConvert.convertListNotNull<dynamic>(json['programs']);
  if (programs != null) {
    repositoryEntity.programs = programs;
  }
  final dynamic? enterprise = jsonConvert.convert<dynamic>(json['enterprise']);
  if (enterprise != null) {
    repositoryEntity.enterprise = enterprise;
  }
  final List<dynamic>? projectLabels =
      jsonConvert.convertListNotNull<dynamic>(json['project_labels']);
  if (projectLabels != null) {
    repositoryEntity.projectLabels = projectLabels;
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
  data['html_url'] = entity.htmlUrl;
  data['ssh_url'] = entity.sshUrl;
  data['forks_url'] = entity.forksUrl;
  data['keys_url'] = entity.keysUrl;
  data['collaborators_url'] = entity.collaboratorsUrl;
  data['hooks_url'] = entity.hooksUrl;
  data['branches_url'] = entity.branchesUrl;
  data['tags_url'] = entity.tagsUrl;
  data['blobs_url'] = entity.blobsUrl;
  data['stargazers_url'] = entity.stargazersUrl;
  data['contributors_url'] = entity.contributorsUrl;
  data['commits_url'] = entity.commitsUrl;
  data['comments_url'] = entity.commentsUrl;
  data['issue_comment_url'] = entity.issueCommentUrl;
  data['issues_url'] = entity.issuesUrl;
  data['pulls_url'] = entity.pullsUrl;
  data['milestones_url'] = entity.milestonesUrl;
  data['notifications_url'] = entity.notificationsUrl;
  data['labels_url'] = entity.labelsUrl;
  data['releases_url'] = entity.releasesUrl;
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
  data['assignees_number'] = entity.assigneesNumber;
  data['testers_number'] = entity.testersNumber;
  data['assignee'] = entity.assignee?.map((v) => v.toJson()).toList();
  data['testers'] = entity.testers?.map((v) => v.toJson()).toList();
  data['status'] = entity.status;
  data['empty_repo'] = entity.emptyRepo;
  data['programs'] = entity.programs;
  data['enterprise'] = entity.enterprise;
  data['project_labels'] = entity.projectLabels;
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
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    repositoryNamespace.htmlUrl = htmlUrl;
  }
  return repositoryNamespace;
}

Map<String, dynamic> $RepositoryNamespaceToJson(RepositoryNamespace entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['name'] = entity.name;
  data['path'] = entity.path;
  data['html_url'] = entity.htmlUrl;
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
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    repositoryOwner.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    repositoryOwner.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    repositoryOwner.remark = remark;
  }
  final String? followersUrl =
      jsonConvert.convert<String>(json['followers_url']);
  if (followersUrl != null) {
    repositoryOwner.followersUrl = followersUrl;
  }
  final String? followingUrl =
      jsonConvert.convert<String>(json['following_url']);
  if (followingUrl != null) {
    repositoryOwner.followingUrl = followingUrl;
  }
  final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
  if (gistsUrl != null) {
    repositoryOwner.gistsUrl = gistsUrl;
  }
  final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
  if (starredUrl != null) {
    repositoryOwner.starredUrl = starredUrl;
  }
  final String? subscriptionsUrl =
      jsonConvert.convert<String>(json['subscriptions_url']);
  if (subscriptionsUrl != null) {
    repositoryOwner.subscriptionsUrl = subscriptionsUrl;
  }
  final String? organizationsUrl =
      jsonConvert.convert<String>(json['organizations_url']);
  if (organizationsUrl != null) {
    repositoryOwner.organizationsUrl = organizationsUrl;
  }
  final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
  if (reposUrl != null) {
    repositoryOwner.reposUrl = reposUrl;
  }
  final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
  if (eventsUrl != null) {
    repositoryOwner.eventsUrl = eventsUrl;
  }
  final String? receivedEventsUrl =
      jsonConvert.convert<String>(json['received_events_url']);
  if (receivedEventsUrl != null) {
    repositoryOwner.receivedEventsUrl = receivedEventsUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    repositoryOwner.type = type;
  }
  return repositoryOwner;
}

Map<String, dynamic> $RepositoryOwnerToJson(RepositoryOwner entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  data['url'] = entity.url;
  data['html_url'] = entity.htmlUrl;
  data['remark'] = entity.remark;
  data['followers_url'] = entity.followersUrl;
  data['following_url'] = entity.followingUrl;
  data['gists_url'] = entity.gistsUrl;
  data['starred_url'] = entity.starredUrl;
  data['subscriptions_url'] = entity.subscriptionsUrl;
  data['organizations_url'] = entity.organizationsUrl;
  data['repos_url'] = entity.reposUrl;
  data['events_url'] = entity.eventsUrl;
  data['received_events_url'] = entity.receivedEventsUrl;
  data['type'] = entity.type;
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
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    repositoryAssigner.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    repositoryAssigner.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    repositoryAssigner.remark = remark;
  }
  final String? followersUrl =
      jsonConvert.convert<String>(json['followers_url']);
  if (followersUrl != null) {
    repositoryAssigner.followersUrl = followersUrl;
  }
  final String? followingUrl =
      jsonConvert.convert<String>(json['following_url']);
  if (followingUrl != null) {
    repositoryAssigner.followingUrl = followingUrl;
  }
  final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
  if (gistsUrl != null) {
    repositoryAssigner.gistsUrl = gistsUrl;
  }
  final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
  if (starredUrl != null) {
    repositoryAssigner.starredUrl = starredUrl;
  }
  final String? subscriptionsUrl =
      jsonConvert.convert<String>(json['subscriptions_url']);
  if (subscriptionsUrl != null) {
    repositoryAssigner.subscriptionsUrl = subscriptionsUrl;
  }
  final String? organizationsUrl =
      jsonConvert.convert<String>(json['organizations_url']);
  if (organizationsUrl != null) {
    repositoryAssigner.organizationsUrl = organizationsUrl;
  }
  final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
  if (reposUrl != null) {
    repositoryAssigner.reposUrl = reposUrl;
  }
  final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
  if (eventsUrl != null) {
    repositoryAssigner.eventsUrl = eventsUrl;
  }
  final String? receivedEventsUrl =
      jsonConvert.convert<String>(json['received_events_url']);
  if (receivedEventsUrl != null) {
    repositoryAssigner.receivedEventsUrl = receivedEventsUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    repositoryAssigner.type = type;
  }
  return repositoryAssigner;
}

Map<String, dynamic> $RepositoryAssignerToJson(RepositoryAssigner entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  data['url'] = entity.url;
  data['html_url'] = entity.htmlUrl;
  data['remark'] = entity.remark;
  data['followers_url'] = entity.followersUrl;
  data['following_url'] = entity.followingUrl;
  data['gists_url'] = entity.gistsUrl;
  data['starred_url'] = entity.starredUrl;
  data['subscriptions_url'] = entity.subscriptionsUrl;
  data['organizations_url'] = entity.organizationsUrl;
  data['repos_url'] = entity.reposUrl;
  data['events_url'] = entity.eventsUrl;
  data['received_events_url'] = entity.receivedEventsUrl;
  data['type'] = entity.type;
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
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    repositoryAssignee.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    repositoryAssignee.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    repositoryAssignee.remark = remark;
  }
  final String? followersUrl =
      jsonConvert.convert<String>(json['followers_url']);
  if (followersUrl != null) {
    repositoryAssignee.followersUrl = followersUrl;
  }
  final String? followingUrl =
      jsonConvert.convert<String>(json['following_url']);
  if (followingUrl != null) {
    repositoryAssignee.followingUrl = followingUrl;
  }
  final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
  if (gistsUrl != null) {
    repositoryAssignee.gistsUrl = gistsUrl;
  }
  final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
  if (starredUrl != null) {
    repositoryAssignee.starredUrl = starredUrl;
  }
  final String? subscriptionsUrl =
      jsonConvert.convert<String>(json['subscriptions_url']);
  if (subscriptionsUrl != null) {
    repositoryAssignee.subscriptionsUrl = subscriptionsUrl;
  }
  final String? organizationsUrl =
      jsonConvert.convert<String>(json['organizations_url']);
  if (organizationsUrl != null) {
    repositoryAssignee.organizationsUrl = organizationsUrl;
  }
  final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
  if (reposUrl != null) {
    repositoryAssignee.reposUrl = reposUrl;
  }
  final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
  if (eventsUrl != null) {
    repositoryAssignee.eventsUrl = eventsUrl;
  }
  final String? receivedEventsUrl =
      jsonConvert.convert<String>(json['received_events_url']);
  if (receivedEventsUrl != null) {
    repositoryAssignee.receivedEventsUrl = receivedEventsUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    repositoryAssignee.type = type;
  }
  return repositoryAssignee;
}

Map<String, dynamic> $RepositoryAssigneeToJson(RepositoryAssignee entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  data['url'] = entity.url;
  data['html_url'] = entity.htmlUrl;
  data['remark'] = entity.remark;
  data['followers_url'] = entity.followersUrl;
  data['following_url'] = entity.followingUrl;
  data['gists_url'] = entity.gistsUrl;
  data['starred_url'] = entity.starredUrl;
  data['subscriptions_url'] = entity.subscriptionsUrl;
  data['organizations_url'] = entity.organizationsUrl;
  data['repos_url'] = entity.reposUrl;
  data['events_url'] = entity.eventsUrl;
  data['received_events_url'] = entity.receivedEventsUrl;
  data['type'] = entity.type;
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
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    repositoryTesters.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    repositoryTesters.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    repositoryTesters.remark = remark;
  }
  final String? followersUrl =
      jsonConvert.convert<String>(json['followers_url']);
  if (followersUrl != null) {
    repositoryTesters.followersUrl = followersUrl;
  }
  final String? followingUrl =
      jsonConvert.convert<String>(json['following_url']);
  if (followingUrl != null) {
    repositoryTesters.followingUrl = followingUrl;
  }
  final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
  if (gistsUrl != null) {
    repositoryTesters.gistsUrl = gistsUrl;
  }
  final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
  if (starredUrl != null) {
    repositoryTesters.starredUrl = starredUrl;
  }
  final String? subscriptionsUrl =
      jsonConvert.convert<String>(json['subscriptions_url']);
  if (subscriptionsUrl != null) {
    repositoryTesters.subscriptionsUrl = subscriptionsUrl;
  }
  final String? organizationsUrl =
      jsonConvert.convert<String>(json['organizations_url']);
  if (organizationsUrl != null) {
    repositoryTesters.organizationsUrl = organizationsUrl;
  }
  final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
  if (reposUrl != null) {
    repositoryTesters.reposUrl = reposUrl;
  }
  final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
  if (eventsUrl != null) {
    repositoryTesters.eventsUrl = eventsUrl;
  }
  final String? receivedEventsUrl =
      jsonConvert.convert<String>(json['received_events_url']);
  if (receivedEventsUrl != null) {
    repositoryTesters.receivedEventsUrl = receivedEventsUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    repositoryTesters.type = type;
  }
  return repositoryTesters;
}

Map<String, dynamic> $RepositoryTestersToJson(RepositoryTesters entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  data['url'] = entity.url;
  data['html_url'] = entity.htmlUrl;
  data['remark'] = entity.remark;
  data['followers_url'] = entity.followersUrl;
  data['following_url'] = entity.followingUrl;
  data['gists_url'] = entity.gistsUrl;
  data['starred_url'] = entity.starredUrl;
  data['subscriptions_url'] = entity.subscriptionsUrl;
  data['organizations_url'] = entity.organizationsUrl;
  data['repos_url'] = entity.reposUrl;
  data['events_url'] = entity.eventsUrl;
  data['received_events_url'] = entity.receivedEventsUrl;
  data['type'] = entity.type;
  return data;
}
