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
	final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
	if (htmlUrl != null) {
		repoCommitEntity.htmlUrl = htmlUrl;
	}
	final String? commentsUrl = jsonConvert.convert<String>(json['comments_url']);
	if (commentsUrl != null) {
		repoCommitEntity.commentsUrl = commentsUrl;
	}
	final RepoCommitCommit? commit = jsonConvert.convert<RepoCommitCommit>(json['commit']);
	if (commit != null) {
		repoCommitEntity.commit = commit;
	}
	final RepoCommitAuthor? author = jsonConvert.convert<RepoCommitAuthor>(json['author']);
	if (author != null) {
		repoCommitEntity.author = author;
	}
	final RepoCommitCommitter? committer = jsonConvert.convert<RepoCommitCommitter>(json['committer']);
	if (committer != null) {
		repoCommitEntity.committer = committer;
	}
	final List<RepoCommitParents>? parents = jsonConvert.convertListNotNull<RepoCommitParents>(json['parents']);
	if (parents != null) {
		repoCommitEntity.parents = parents;
	}
	return repoCommitEntity;
}

Map<String, dynamic> $RepoCommitEntityToJson(RepoCommitEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['url'] = entity.url;
	data['sha'] = entity.sha;
	data['html_url'] = entity.htmlUrl;
	data['comments_url'] = entity.commentsUrl;
	data['commit'] = entity.commit?.toJson();
	data['author'] = entity.author?.toJson();
	data['committer'] = entity.committer?.toJson();
	data['parents'] =  entity.parents?.map((v) => v.toJson()).toList();
	return data;
}

RepoCommitCommit $RepoCommitCommitFromJson(Map<String, dynamic> json) {
	final RepoCommitCommit repoCommitCommit = RepoCommitCommit();
	final RepoCommitCommitAuthor? author = jsonConvert.convert<RepoCommitCommitAuthor>(json['author']);
	if (author != null) {
		repoCommitCommit.author = author;
	}
	final RepoCommitCommitCommitter? committer = jsonConvert.convert<RepoCommitCommitCommitter>(json['committer']);
	if (committer != null) {
		repoCommitCommit.committer = committer;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		repoCommitCommit.message = message;
	}
	final RepoCommitCommitTree? tree = jsonConvert.convert<RepoCommitCommitTree>(json['tree']);
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

RepoCommitCommitAuthor $RepoCommitCommitAuthorFromJson(Map<String, dynamic> json) {
	final RepoCommitCommitAuthor repoCommitCommitAuthor = RepoCommitCommitAuthor();
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

Map<String, dynamic> $RepoCommitCommitAuthorToJson(RepoCommitCommitAuthor entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['date'] = entity.date;
	data['email'] = entity.email;
	return data;
}

RepoCommitCommitCommitter $RepoCommitCommitCommitterFromJson(Map<String, dynamic> json) {
	final RepoCommitCommitCommitter repoCommitCommitCommitter = RepoCommitCommitCommitter();
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

Map<String, dynamic> $RepoCommitCommitCommitterToJson(RepoCommitCommitCommitter entity) {
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
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		repoCommitAuthor.url = url;
	}
	final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
	if (htmlUrl != null) {
		repoCommitAuthor.htmlUrl = htmlUrl;
	}
	final String? remark = jsonConvert.convert<String>(json['remark']);
	if (remark != null) {
		repoCommitAuthor.remark = remark;
	}
	final String? followersUrl = jsonConvert.convert<String>(json['followers_url']);
	if (followersUrl != null) {
		repoCommitAuthor.followersUrl = followersUrl;
	}
	final String? followingUrl = jsonConvert.convert<String>(json['following_url']);
	if (followingUrl != null) {
		repoCommitAuthor.followingUrl = followingUrl;
	}
	final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
	if (gistsUrl != null) {
		repoCommitAuthor.gistsUrl = gistsUrl;
	}
	final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
	if (starredUrl != null) {
		repoCommitAuthor.starredUrl = starredUrl;
	}
	final String? subscriptionsUrl = jsonConvert.convert<String>(json['subscriptions_url']);
	if (subscriptionsUrl != null) {
		repoCommitAuthor.subscriptionsUrl = subscriptionsUrl;
	}
	final String? organizationsUrl = jsonConvert.convert<String>(json['organizations_url']);
	if (organizationsUrl != null) {
		repoCommitAuthor.organizationsUrl = organizationsUrl;
	}
	final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
	if (reposUrl != null) {
		repoCommitAuthor.reposUrl = reposUrl;
	}
	final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
	if (eventsUrl != null) {
		repoCommitAuthor.eventsUrl = eventsUrl;
	}
	final String? receivedEventsUrl = jsonConvert.convert<String>(json['received_events_url']);
	if (receivedEventsUrl != null) {
		repoCommitAuthor.receivedEventsUrl = receivedEventsUrl;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		repoCommitAuthor.type = type;
	}
	return repoCommitAuthor;
}

Map<String, dynamic> $RepoCommitAuthorToJson(RepoCommitAuthor entity) {
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
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		repoCommitCommitter.url = url;
	}
	final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
	if (htmlUrl != null) {
		repoCommitCommitter.htmlUrl = htmlUrl;
	}
	final String? remark = jsonConvert.convert<String>(json['remark']);
	if (remark != null) {
		repoCommitCommitter.remark = remark;
	}
	final String? followersUrl = jsonConvert.convert<String>(json['followers_url']);
	if (followersUrl != null) {
		repoCommitCommitter.followersUrl = followersUrl;
	}
	final String? followingUrl = jsonConvert.convert<String>(json['following_url']);
	if (followingUrl != null) {
		repoCommitCommitter.followingUrl = followingUrl;
	}
	final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
	if (gistsUrl != null) {
		repoCommitCommitter.gistsUrl = gistsUrl;
	}
	final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
	if (starredUrl != null) {
		repoCommitCommitter.starredUrl = starredUrl;
	}
	final String? subscriptionsUrl = jsonConvert.convert<String>(json['subscriptions_url']);
	if (subscriptionsUrl != null) {
		repoCommitCommitter.subscriptionsUrl = subscriptionsUrl;
	}
	final String? organizationsUrl = jsonConvert.convert<String>(json['organizations_url']);
	if (organizationsUrl != null) {
		repoCommitCommitter.organizationsUrl = organizationsUrl;
	}
	final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
	if (reposUrl != null) {
		repoCommitCommitter.reposUrl = reposUrl;
	}
	final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
	if (eventsUrl != null) {
		repoCommitCommitter.eventsUrl = eventsUrl;
	}
	final String? receivedEventsUrl = jsonConvert.convert<String>(json['received_events_url']);
	if (receivedEventsUrl != null) {
		repoCommitCommitter.receivedEventsUrl = receivedEventsUrl;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		repoCommitCommitter.type = type;
	}
	return repoCommitCommitter;
}

Map<String, dynamic> $RepoCommitCommitterToJson(RepoCommitCommitter entity) {
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