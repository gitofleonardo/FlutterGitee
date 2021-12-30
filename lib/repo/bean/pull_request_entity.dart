import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/pull_request_entity.g.dart';

@JsonSerializable()
class PullRequestEntity {
  double? id;
  String? url;
  double? number;
  String? state;
  String? title;
  String? body;
  @JSONField(name: "assignees_number")
  double? assigneesNumber;
  @JSONField(name: "testers_number")
  double? testersNumber;
  List<PullRequestLabel>? labels;
  bool? locked;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "updated_at")
  String? updatedAt;
  @JSONField(name: "closed_at")
  String? closedAt;
  @JSONField(name: "merged_at")
  String? mergedAt;
  bool? mergeable;
  @JSONField(name: "can_merge_check")
  bool? canMergeCheck;
  PullRequestHead? head;
  PullRequestBase? base;
  @JSONField(name: "_links")
  PullRequestLinks? pLinks;
  PullRequestUser? user;

  PullRequestEntity();

  factory PullRequestEntity.fromJson(Map<String, dynamic> json) =>
      $PullRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestLabel {
  int? id;
  String? name;
  String? color;
  @JSONField(name: "repository_id")
  int? repositoryId;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "updated_at")
  String? updatedAt;

  PullRequestLabel();

  factory PullRequestLabel.fromJson(Map<String, dynamic> json) =>
      $PullRequestLabelFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestLabelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestHead {
  String? label;
  String? ref;
  String? sha;
  PullRequestHeadUser? user;
  PullRequestHeadRepo? repo;

  PullRequestHead();

  factory PullRequestHead.fromJson(Map<String, dynamic> json) =>
      $PullRequestHeadFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestHeadToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestHeadUser {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  PullRequestHeadUser();

  factory PullRequestHeadUser.fromJson(Map<String, dynamic> json) =>
      $PullRequestHeadUserFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestHeadUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestHeadRepo {
  double? id;
  @JSONField(name: "full_name")
  String? fullName;

  PullRequestHeadRepo();

  factory PullRequestHeadRepo.fromJson(Map<String, dynamic> json) =>
      $PullRequestHeadRepoFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestHeadRepoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestHeadRepoNamespace {
  double? id;
  String? type;
  String? name;
  String? path;

  PullRequestHeadRepoNamespace();

  factory PullRequestHeadRepoNamespace.fromJson(Map<String, dynamic> json) =>
      $PullRequestHeadRepoNamespaceFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestHeadRepoNamespaceToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestHeadRepoOwner {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  PullRequestHeadRepoOwner();

  factory PullRequestHeadRepoOwner.fromJson(Map<String, dynamic> json) =>
      $PullRequestHeadRepoOwnerFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestHeadRepoOwnerToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestHeadRepoAssigner {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  PullRequestHeadRepoAssigner();

  factory PullRequestHeadRepoAssigner.fromJson(Map<String, dynamic> json) =>
      $PullRequestHeadRepoAssignerFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestHeadRepoAssignerToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestBase {
  String? label;
  String? ref;
  String? sha;
  PullRequestBaseUser? user;
  PullRequestBaseRepo? repo;

  PullRequestBase();

  factory PullRequestBase.fromJson(Map<String, dynamic> json) =>
      $PullRequestBaseFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestBaseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestBaseUser {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  PullRequestBaseUser();

  factory PullRequestBaseUser.fromJson(Map<String, dynamic> json) =>
      $PullRequestBaseUserFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestBaseUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestBaseRepo {
  double? id;
  @JSONField(name: "full_name")
  String? fullName;
  @JSONField(name: "human_name")
  String? humanName;
  String? url;
  PullRequestBaseRepoNamespace? namespace;
  String? path;
  String? name;
  PullRequestBaseRepoOwner? owner;
  PullRequestBaseRepoAssigner? assigner;
  String? description;
  bool? private;
  bool? public;
  bool? internal;
  bool? fork;

  PullRequestBaseRepo();

  factory PullRequestBaseRepo.fromJson(Map<String, dynamic> json) =>
      $PullRequestBaseRepoFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestBaseRepoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestBaseRepoNamespace {
  double? id;
  String? type;
  String? name;
  String? path;

  PullRequestBaseRepoNamespace();

  factory PullRequestBaseRepoNamespace.fromJson(Map<String, dynamic> json) =>
      $PullRequestBaseRepoNamespaceFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestBaseRepoNamespaceToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestBaseRepoOwner {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  PullRequestBaseRepoOwner();

  factory PullRequestBaseRepoOwner.fromJson(Map<String, dynamic> json) =>
      $PullRequestBaseRepoOwnerFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestBaseRepoOwnerToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestBaseRepoAssigner {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  PullRequestBaseRepoAssigner();

  factory PullRequestBaseRepoAssigner.fromJson(Map<String, dynamic> json) =>
      $PullRequestBaseRepoAssignerFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestBaseRepoAssignerToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestLinks {
  PullRequestLinksSelf? self;
  PullRequestLinksHtml? html;
  PullRequestLinksIssue? issue;
  PullRequestLinksComments? comments;
  @JSONField(name: "review_comments")
  PullRequestLinksReviewComments? reviewComments;
  @JSONField(name: "review_comment")
  PullRequestLinksReviewComment? reviewComment;
  PullRequestLinksCommits? commits;

  PullRequestLinks();

  factory PullRequestLinks.fromJson(Map<String, dynamic> json) =>
      $PullRequestLinksFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestLinksToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestLinksSelf {
  String? href;

  PullRequestLinksSelf();

  factory PullRequestLinksSelf.fromJson(Map<String, dynamic> json) =>
      $PullRequestLinksSelfFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestLinksSelfToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestLinksHtml {
  String? href;

  PullRequestLinksHtml();

  factory PullRequestLinksHtml.fromJson(Map<String, dynamic> json) =>
      $PullRequestLinksHtmlFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestLinksHtmlToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestLinksIssue {
  String? href;

  PullRequestLinksIssue();

  factory PullRequestLinksIssue.fromJson(Map<String, dynamic> json) =>
      $PullRequestLinksIssueFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestLinksIssueToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestLinksComments {
  String? href;

  PullRequestLinksComments();

  factory PullRequestLinksComments.fromJson(Map<String, dynamic> json) =>
      $PullRequestLinksCommentsFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestLinksCommentsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestLinksReviewComments {
  String? href;

  PullRequestLinksReviewComments();

  factory PullRequestLinksReviewComments.fromJson(Map<String, dynamic> json) =>
      $PullRequestLinksReviewCommentsFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestLinksReviewCommentsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestLinksReviewComment {
  String? href;

  PullRequestLinksReviewComment();

  factory PullRequestLinksReviewComment.fromJson(Map<String, dynamic> json) =>
      $PullRequestLinksReviewCommentFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestLinksReviewCommentToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestLinksCommits {
  String? href;

  PullRequestLinksCommits();

  factory PullRequestLinksCommits.fromJson(Map<String, dynamic> json) =>
      $PullRequestLinksCommitsFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestLinksCommitsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PullRequestUser {
  double? id;
  String? login;
  String? name;
  @JSONField(name: "avatar_url")
  String? avatarUrl;

  PullRequestUser();

  factory PullRequestUser.fromJson(Map<String, dynamic> json) =>
      $PullRequestUserFromJson(json);

  Map<String, dynamic> toJson() => $PullRequestUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
