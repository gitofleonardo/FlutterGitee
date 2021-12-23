import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/repo/bean/issue_comment_entity.dart';

IssueCommentEntity $IssueCommentEntityFromJson(Map<String, dynamic> json) {
  final IssueCommentEntity issueCommentEntity = IssueCommentEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    issueCommentEntity.id = id;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    issueCommentEntity.body = body;
  }
  final IssueCommentUser? user =
      jsonConvert.convert<IssueCommentUser>(json['user']);
  if (user != null) {
    issueCommentEntity.user = user;
  }
  final String? xSource = jsonConvert.convert<String>(json['source']);
  if (xSource != null) {
    issueCommentEntity.xSource = xSource;
  }
  final IssueCommentTarget? target =
      jsonConvert.convert<IssueCommentTarget>(json['target']);
  if (target != null) {
    issueCommentEntity.target = target;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    issueCommentEntity.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    issueCommentEntity.updatedAt = updatedAt;
  }
  return issueCommentEntity;
}

Map<String, dynamic> $IssueCommentEntityToJson(IssueCommentEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['body'] = entity.body;
  data['user'] = entity.user?.toJson();
  data['source'] = entity.xSource;
  data['target'] = entity.target?.toJson();
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}

IssueCommentUser $IssueCommentUserFromJson(Map<String, dynamic> json) {
  final IssueCommentUser issueCommentUser = IssueCommentUser();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    issueCommentUser.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    issueCommentUser.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    issueCommentUser.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    issueCommentUser.avatarUrl = avatarUrl;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    issueCommentUser.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    issueCommentUser.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    issueCommentUser.remark = remark;
  }
  final String? followersUrl =
      jsonConvert.convert<String>(json['followers_url']);
  if (followersUrl != null) {
    issueCommentUser.followersUrl = followersUrl;
  }
  final String? followingUrl =
      jsonConvert.convert<String>(json['following_url']);
  if (followingUrl != null) {
    issueCommentUser.followingUrl = followingUrl;
  }
  final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
  if (gistsUrl != null) {
    issueCommentUser.gistsUrl = gistsUrl;
  }
  final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
  if (starredUrl != null) {
    issueCommentUser.starredUrl = starredUrl;
  }
  final String? subscriptionsUrl =
      jsonConvert.convert<String>(json['subscriptions_url']);
  if (subscriptionsUrl != null) {
    issueCommentUser.subscriptionsUrl = subscriptionsUrl;
  }
  final String? organizationsUrl =
      jsonConvert.convert<String>(json['organizations_url']);
  if (organizationsUrl != null) {
    issueCommentUser.organizationsUrl = organizationsUrl;
  }
  final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
  if (reposUrl != null) {
    issueCommentUser.reposUrl = reposUrl;
  }
  final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
  if (eventsUrl != null) {
    issueCommentUser.eventsUrl = eventsUrl;
  }
  final String? receivedEventsUrl =
      jsonConvert.convert<String>(json['received_events_url']);
  if (receivedEventsUrl != null) {
    issueCommentUser.receivedEventsUrl = receivedEventsUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    issueCommentUser.type = type;
  }
  return issueCommentUser;
}

Map<String, dynamic> $IssueCommentUserToJson(IssueCommentUser entity) {
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

IssueCommentTarget $IssueCommentTargetFromJson(Map<String, dynamic> json) {
  final IssueCommentTarget issueCommentTarget = IssueCommentTarget();
  final IssueCommentTargetIssue? issue =
      jsonConvert.convert<IssueCommentTargetIssue>(json['issue']);
  if (issue != null) {
    issueCommentTarget.issue = issue;
  }
  final dynamic? pullRequest =
      jsonConvert.convert<dynamic>(json['pull_request']);
  if (pullRequest != null) {
    issueCommentTarget.pullRequest = pullRequest;
  }
  return issueCommentTarget;
}

Map<String, dynamic> $IssueCommentTargetToJson(IssueCommentTarget entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['issue'] = entity.issue?.toJson();
  data['pull_request'] = entity.pullRequest;
  return data;
}

IssueCommentTargetIssue $IssueCommentTargetIssueFromJson(
    Map<String, dynamic> json) {
  final IssueCommentTargetIssue issueCommentTargetIssue =
      IssueCommentTargetIssue();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    issueCommentTargetIssue.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    issueCommentTargetIssue.title = title;
  }
  final String? number = jsonConvert.convert<String>(json['number']);
  if (number != null) {
    issueCommentTargetIssue.number = number;
  }
  return issueCommentTargetIssue;
}

Map<String, dynamic> $IssueCommentTargetIssueToJson(
    IssueCommentTargetIssue entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['number'] = entity.number;
  return data;
}
