import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/repo/bean/issue_result_entity.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/user/bean/result/success/user_profile_entity.dart';

IssueResultEntity $IssueResultEntityFromJson(Map<String, dynamic> json) {
  final IssueResultEntity issueResultEntity = IssueResultEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    issueResultEntity.id = id;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    issueResultEntity.url = url;
  }
  final String? repositoryUrl =
      jsonConvert.convert<String>(json['repository_url']);
  if (repositoryUrl != null) {
    issueResultEntity.repositoryUrl = repositoryUrl;
  }
  final String? labelsUrl = jsonConvert.convert<String>(json['labels_url']);
  if (labelsUrl != null) {
    issueResultEntity.labelsUrl = labelsUrl;
  }
  final String? commentsUrl = jsonConvert.convert<String>(json['comments_url']);
  if (commentsUrl != null) {
    issueResultEntity.commentsUrl = commentsUrl;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    issueResultEntity.htmlUrl = htmlUrl;
  }
  final String? parentUrl = jsonConvert.convert<String>(json['parent_url']);
  if (parentUrl != null) {
    issueResultEntity.parentUrl = parentUrl;
  }
  final String? number = jsonConvert.convert<String>(json['number']);
  if (number != null) {
    issueResultEntity.number = number;
  }
  final double? parentId = jsonConvert.convert<double>(json['parent_id']);
  if (parentId != null) {
    issueResultEntity.parentId = parentId;
  }
  final double? depth = jsonConvert.convert<double>(json['depth']);
  if (depth != null) {
    issueResultEntity.depth = depth;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    issueResultEntity.state = state;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    issueResultEntity.title = title;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    issueResultEntity.body = body;
  }
  final UserProfileEntity? user =
      jsonConvert.convert<UserProfileEntity>(json['user']);
  if (user != null) {
    issueResultEntity.user = user;
  }
  final List<IssueResultLabel>? labels =
      jsonConvert.convertListNotNull<IssueResultLabel>(json['labels']);
  if (labels != null) {
    issueResultEntity.labels = labels;
  }
  final IssueResultAssignee? assignee =
      jsonConvert.convert<IssueResultAssignee>(json['assignee']);
  if (assignee != null) {
    issueResultEntity.assignee = assignee;
  }
  final List<dynamic>? collaborators =
      jsonConvert.convertListNotNull<dynamic>(json['collaborators']);
  if (collaborators != null) {
    issueResultEntity.collaborators = collaborators;
  }
  final RepositoryEntity? repository =
      jsonConvert.convert<RepositoryEntity>(json['repository']);
  if (repository != null) {
    issueResultEntity.repository = repository;
  }
  final IssueResultMilestone? milestone =
      jsonConvert.convert<IssueResultMilestone>(json['milestone']);
  if (milestone != null) {
    issueResultEntity.milestone = milestone;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    issueResultEntity.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    issueResultEntity.updatedAt = updatedAt;
  }
  final String? planStartedAt =
      jsonConvert.convert<String>(json['plan_started_at']);
  if (planStartedAt != null) {
    issueResultEntity.planStartedAt = planStartedAt;
  }
  final String? deadline = jsonConvert.convert<String>(json['deadline']);
  if (deadline != null) {
    issueResultEntity.deadline = deadline;
  }
  final String? finishedAt = jsonConvert.convert<String>(json['finished_at']);
  if (finishedAt != null) {
    issueResultEntity.finishedAt = finishedAt;
  }
  final double? scheduledTime =
      jsonConvert.convert<double>(json['scheduled_time']);
  if (scheduledTime != null) {
    issueResultEntity.scheduledTime = scheduledTime;
  }
  final double? comments = jsonConvert.convert<double>(json['comments']);
  if (comments != null) {
    issueResultEntity.comments = comments;
  }
  final double? priority = jsonConvert.convert<double>(json['priority']);
  if (priority != null) {
    issueResultEntity.priority = priority;
  }
  final String? issueType = jsonConvert.convert<String>(json['issue_type']);
  if (issueType != null) {
    issueResultEntity.issueType = issueType;
  }
  final IssueResultProgram? program =
      jsonConvert.convert<IssueResultProgram>(json['program']);
  if (program != null) {
    issueResultEntity.program = program;
  }
  final bool? securityHole = jsonConvert.convert<bool>(json['security_hole']);
  if (securityHole != null) {
    issueResultEntity.securityHole = securityHole;
  }
  final String? issueState = jsonConvert.convert<String>(json['issue_state']);
  if (issueState != null) {
    issueResultEntity.issueState = issueState;
  }
  final String? branch = jsonConvert.convert<String>(json['branch']);
  if (branch != null) {
    issueResultEntity.branch = branch;
  }
  final IssueResultIssueTypeDetail? issueTypeDetail = jsonConvert
      .convert<IssueResultIssueTypeDetail>(json['issue_type_detail']);
  if (issueTypeDetail != null) {
    issueResultEntity.issueTypeDetail = issueTypeDetail;
  }
  final IssueResultIssueStateDetail? issueStateDetail = jsonConvert
      .convert<IssueResultIssueStateDetail>(json['issue_state_detail']);
  if (issueStateDetail != null) {
    issueResultEntity.issueStateDetail = issueStateDetail;
  }
  return issueResultEntity;
}

Map<String, dynamic> $IssueResultEntityToJson(IssueResultEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['url'] = entity.url;
  data['repository_url'] = entity.repositoryUrl;
  data['labels_url'] = entity.labelsUrl;
  data['comments_url'] = entity.commentsUrl;
  data['html_url'] = entity.htmlUrl;
  data['parent_url'] = entity.parentUrl;
  data['number'] = entity.number;
  data['parent_id'] = entity.parentId;
  data['depth'] = entity.depth;
  data['state'] = entity.state;
  data['title'] = entity.title;
  data['body'] = entity.body;
  data['user'] = entity.user?.toJson();
  data['labels'] = entity.labels?.map((v) => v.toJson()).toList();
  data['assignee'] = entity.assignee?.toJson();
  data['collaborators'] = entity.collaborators;
  data['repository'] = entity.repository?.toJson();
  data['milestone'] = entity.milestone?.toJson();
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  data['plan_started_at'] = entity.planStartedAt;
  data['deadline'] = entity.deadline;
  data['finished_at'] = entity.finishedAt;
  data['scheduled_time'] = entity.scheduledTime;
  data['comments'] = entity.comments;
  data['priority'] = entity.priority;
  data['issue_type'] = entity.issueType;
  data['program'] = entity.program?.toJson();
  data['security_hole'] = entity.securityHole;
  data['issue_state'] = entity.issueState;
  data['branch'] = entity.branch;
  data['issue_type_detail'] = entity.issueTypeDetail?.toJson();
  data['issue_state_detail'] = entity.issueStateDetail?.toJson();
  return data;
}

IssueResultLabel $IssueResultLabelFromJson(Map<String, dynamic> json) {
  final IssueResultLabel issueResultLabel = IssueResultLabel();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    issueResultLabel.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    issueResultLabel.name = name;
  }
  final String? color = jsonConvert.convert<String>(json['color']);
  if (color != null) {
    issueResultLabel.color = color;
  }
  final int? repositoryId = jsonConvert.convert<int>(json['repository_id']);
  if (repositoryId != null) {
    issueResultLabel.repositoryId = repositoryId;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    issueResultLabel.url = url;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    issueResultLabel.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    issueResultLabel.updatedAt = updatedAt;
  }
  return issueResultLabel;
}

Map<String, dynamic> $IssueResultLabelToJson(IssueResultLabel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['color'] = entity.color;
  data['repository_id'] = entity.repositoryId;
  data['url'] = entity.url;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}

IssueResultAssignee $IssueResultAssigneeFromJson(Map<String, dynamic> json) {
  final IssueResultAssignee issueResultAssignee = IssueResultAssignee();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    issueResultAssignee.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    issueResultAssignee.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    issueResultAssignee.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    issueResultAssignee.avatarUrl = avatarUrl;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    issueResultAssignee.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    issueResultAssignee.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    issueResultAssignee.remark = remark;
  }
  final String? followersUrl =
      jsonConvert.convert<String>(json['followers_url']);
  if (followersUrl != null) {
    issueResultAssignee.followersUrl = followersUrl;
  }
  final String? followingUrl =
      jsonConvert.convert<String>(json['following_url']);
  if (followingUrl != null) {
    issueResultAssignee.followingUrl = followingUrl;
  }
  final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
  if (gistsUrl != null) {
    issueResultAssignee.gistsUrl = gistsUrl;
  }
  final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
  if (starredUrl != null) {
    issueResultAssignee.starredUrl = starredUrl;
  }
  final String? subscriptionsUrl =
      jsonConvert.convert<String>(json['subscriptions_url']);
  if (subscriptionsUrl != null) {
    issueResultAssignee.subscriptionsUrl = subscriptionsUrl;
  }
  final String? organizationsUrl =
      jsonConvert.convert<String>(json['organizations_url']);
  if (organizationsUrl != null) {
    issueResultAssignee.organizationsUrl = organizationsUrl;
  }
  final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
  if (reposUrl != null) {
    issueResultAssignee.reposUrl = reposUrl;
  }
  final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
  if (eventsUrl != null) {
    issueResultAssignee.eventsUrl = eventsUrl;
  }
  final String? receivedEventsUrl =
      jsonConvert.convert<String>(json['received_events_url']);
  if (receivedEventsUrl != null) {
    issueResultAssignee.receivedEventsUrl = receivedEventsUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    issueResultAssignee.type = type;
  }
  return issueResultAssignee;
}

Map<String, dynamic> $IssueResultAssigneeToJson(IssueResultAssignee entity) {
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

IssueResultMilestone $IssueResultMilestoneFromJson(Map<String, dynamic> json) {
  final IssueResultMilestone issueResultMilestone = IssueResultMilestone();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    issueResultMilestone.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    issueResultMilestone.htmlUrl = htmlUrl;
  }
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    issueResultMilestone.id = id;
  }
  final double? number = jsonConvert.convert<double>(json['number']);
  if (number != null) {
    issueResultMilestone.number = number;
  }
  final double? repositoryId =
      jsonConvert.convert<double>(json['repository_id']);
  if (repositoryId != null) {
    issueResultMilestone.repositoryId = repositoryId;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    issueResultMilestone.state = state;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    issueResultMilestone.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    issueResultMilestone.description = description;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    issueResultMilestone.updatedAt = updatedAt;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    issueResultMilestone.createdAt = createdAt;
  }
  final double? openIssues = jsonConvert.convert<double>(json['open_issues']);
  if (openIssues != null) {
    issueResultMilestone.openIssues = openIssues;
  }
  final double? closedIssues =
      jsonConvert.convert<double>(json['closed_issues']);
  if (closedIssues != null) {
    issueResultMilestone.closedIssues = closedIssues;
  }
  final String? dueOn = jsonConvert.convert<String>(json['due_on']);
  if (dueOn != null) {
    issueResultMilestone.dueOn = dueOn;
  }
  return issueResultMilestone;
}

Map<String, dynamic> $IssueResultMilestoneToJson(IssueResultMilestone entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['html_url'] = entity.htmlUrl;
  data['id'] = entity.id;
  data['number'] = entity.number;
  data['repository_id'] = entity.repositoryId;
  data['state'] = entity.state;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['updated_at'] = entity.updatedAt;
  data['created_at'] = entity.createdAt;
  data['open_issues'] = entity.openIssues;
  data['closed_issues'] = entity.closedIssues;
  data['due_on'] = entity.dueOn;
  return data;
}

IssueResultProgram $IssueResultProgramFromJson(Map<String, dynamic> json) {
  final IssueResultProgram issueResultProgram = IssueResultProgram();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    issueResultProgram.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    issueResultProgram.name = name;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    issueResultProgram.description = description;
  }
  final IssueResultProgramAssignee? assignee =
      jsonConvert.convert<IssueResultProgramAssignee>(json['assignee']);
  if (assignee != null) {
    issueResultProgram.assignee = assignee;
  }
  final IssueResultProgramAuthor? author =
      jsonConvert.convert<IssueResultProgramAuthor>(json['author']);
  if (author != null) {
    issueResultProgram.author = author;
  }
  return issueResultProgram;
}

Map<String, dynamic> $IssueResultProgramToJson(IssueResultProgram entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['description'] = entity.description;
  data['assignee'] = entity.assignee?.toJson();
  data['author'] = entity.author?.toJson();
  return data;
}

IssueResultProgramAssignee $IssueResultProgramAssigneeFromJson(
    Map<String, dynamic> json) {
  final IssueResultProgramAssignee issueResultProgramAssignee =
      IssueResultProgramAssignee();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    issueResultProgramAssignee.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    issueResultProgramAssignee.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    issueResultProgramAssignee.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    issueResultProgramAssignee.avatarUrl = avatarUrl;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    issueResultProgramAssignee.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    issueResultProgramAssignee.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    issueResultProgramAssignee.remark = remark;
  }
  final String? followersUrl =
      jsonConvert.convert<String>(json['followers_url']);
  if (followersUrl != null) {
    issueResultProgramAssignee.followersUrl = followersUrl;
  }
  final String? followingUrl =
      jsonConvert.convert<String>(json['following_url']);
  if (followingUrl != null) {
    issueResultProgramAssignee.followingUrl = followingUrl;
  }
  final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
  if (gistsUrl != null) {
    issueResultProgramAssignee.gistsUrl = gistsUrl;
  }
  final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
  if (starredUrl != null) {
    issueResultProgramAssignee.starredUrl = starredUrl;
  }
  final String? subscriptionsUrl =
      jsonConvert.convert<String>(json['subscriptions_url']);
  if (subscriptionsUrl != null) {
    issueResultProgramAssignee.subscriptionsUrl = subscriptionsUrl;
  }
  final String? organizationsUrl =
      jsonConvert.convert<String>(json['organizations_url']);
  if (organizationsUrl != null) {
    issueResultProgramAssignee.organizationsUrl = organizationsUrl;
  }
  final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
  if (reposUrl != null) {
    issueResultProgramAssignee.reposUrl = reposUrl;
  }
  final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
  if (eventsUrl != null) {
    issueResultProgramAssignee.eventsUrl = eventsUrl;
  }
  final String? receivedEventsUrl =
      jsonConvert.convert<String>(json['received_events_url']);
  if (receivedEventsUrl != null) {
    issueResultProgramAssignee.receivedEventsUrl = receivedEventsUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    issueResultProgramAssignee.type = type;
  }
  return issueResultProgramAssignee;
}

Map<String, dynamic> $IssueResultProgramAssigneeToJson(
    IssueResultProgramAssignee entity) {
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

IssueResultProgramAuthor $IssueResultProgramAuthorFromJson(
    Map<String, dynamic> json) {
  final IssueResultProgramAuthor issueResultProgramAuthor =
      IssueResultProgramAuthor();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    issueResultProgramAuthor.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    issueResultProgramAuthor.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    issueResultProgramAuthor.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    issueResultProgramAuthor.avatarUrl = avatarUrl;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    issueResultProgramAuthor.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
  if (htmlUrl != null) {
    issueResultProgramAuthor.htmlUrl = htmlUrl;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    issueResultProgramAuthor.remark = remark;
  }
  final String? followersUrl =
      jsonConvert.convert<String>(json['followers_url']);
  if (followersUrl != null) {
    issueResultProgramAuthor.followersUrl = followersUrl;
  }
  final String? followingUrl =
      jsonConvert.convert<String>(json['following_url']);
  if (followingUrl != null) {
    issueResultProgramAuthor.followingUrl = followingUrl;
  }
  final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
  if (gistsUrl != null) {
    issueResultProgramAuthor.gistsUrl = gistsUrl;
  }
  final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
  if (starredUrl != null) {
    issueResultProgramAuthor.starredUrl = starredUrl;
  }
  final String? subscriptionsUrl =
      jsonConvert.convert<String>(json['subscriptions_url']);
  if (subscriptionsUrl != null) {
    issueResultProgramAuthor.subscriptionsUrl = subscriptionsUrl;
  }
  final String? organizationsUrl =
      jsonConvert.convert<String>(json['organizations_url']);
  if (organizationsUrl != null) {
    issueResultProgramAuthor.organizationsUrl = organizationsUrl;
  }
  final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
  if (reposUrl != null) {
    issueResultProgramAuthor.reposUrl = reposUrl;
  }
  final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
  if (eventsUrl != null) {
    issueResultProgramAuthor.eventsUrl = eventsUrl;
  }
  final String? receivedEventsUrl =
      jsonConvert.convert<String>(json['received_events_url']);
  if (receivedEventsUrl != null) {
    issueResultProgramAuthor.receivedEventsUrl = receivedEventsUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    issueResultProgramAuthor.type = type;
  }
  return issueResultProgramAuthor;
}

Map<String, dynamic> $IssueResultProgramAuthorToJson(
    IssueResultProgramAuthor entity) {
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

IssueResultIssueTypeDetail $IssueResultIssueTypeDetailFromJson(
    Map<String, dynamic> json) {
  final IssueResultIssueTypeDetail issueResultIssueTypeDetail =
      IssueResultIssueTypeDetail();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    issueResultIssueTypeDetail.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    issueResultIssueTypeDetail.title = title;
  }
  final String? template = jsonConvert.convert<String>(json['template']);
  if (template != null) {
    issueResultIssueTypeDetail.template = template;
  }
  final String? ident = jsonConvert.convert<String>(json['ident']);
  if (ident != null) {
    issueResultIssueTypeDetail.ident = ident;
  }
  final String? color = jsonConvert.convert<String>(json['color']);
  if (color != null) {
    issueResultIssueTypeDetail.color = color;
  }
  final bool? isSystem = jsonConvert.convert<bool>(json['is_system']);
  if (isSystem != null) {
    issueResultIssueTypeDetail.isSystem = isSystem;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    issueResultIssueTypeDetail.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    issueResultIssueTypeDetail.updatedAt = updatedAt;
  }
  return issueResultIssueTypeDetail;
}

Map<String, dynamic> $IssueResultIssueTypeDetailToJson(
    IssueResultIssueTypeDetail entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['template'] = entity.template;
  data['ident'] = entity.ident;
  data['color'] = entity.color;
  data['is_system'] = entity.isSystem;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}

IssueResultIssueStateDetail $IssueResultIssueStateDetailFromJson(
    Map<String, dynamic> json) {
  final IssueResultIssueStateDetail issueResultIssueStateDetail =
      IssueResultIssueStateDetail();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    issueResultIssueStateDetail.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    issueResultIssueStateDetail.title = title;
  }
  final String? color = jsonConvert.convert<String>(json['color']);
  if (color != null) {
    issueResultIssueStateDetail.color = color;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    issueResultIssueStateDetail.icon = icon;
  }
  final String? command = jsonConvert.convert<String>(json['command']);
  if (command != null) {
    issueResultIssueStateDetail.command = command;
  }
  final double? serial = jsonConvert.convert<double>(json['serial']);
  if (serial != null) {
    issueResultIssueStateDetail.serial = serial;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    issueResultIssueStateDetail.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    issueResultIssueStateDetail.updatedAt = updatedAt;
  }
  return issueResultIssueStateDetail;
}

Map<String, dynamic> $IssueResultIssueStateDetailToJson(
    IssueResultIssueStateDetail entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['color'] = entity.color;
  data['icon'] = entity.icon;
  data['command'] = entity.command;
  data['serial'] = entity.serial;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}
