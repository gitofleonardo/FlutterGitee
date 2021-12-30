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
  return issueCommentUser;
}

Map<String, dynamic> $IssueCommentUserToJson(IssueCommentUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

IssueCommentTarget $IssueCommentTargetFromJson(Map<String, dynamic> json) {
  final IssueCommentTarget issueCommentTarget = IssueCommentTarget();
  final IssueCommentTargetIssue? issue =
      jsonConvert.convert<IssueCommentTargetIssue>(json['issue']);
  if (issue != null) {
    issueCommentTarget.issue = issue;
  }
  return issueCommentTarget;
}

Map<String, dynamic> $IssueCommentTargetToJson(IssueCommentTarget entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['issue'] = entity.issue?.toJson();
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
