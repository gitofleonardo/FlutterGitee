import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/repo/bean/pull_request_entity.dart';

PullRequestEntity $PullRequestEntityFromJson(Map<String, dynamic> json) {
  final PullRequestEntity pullRequestEntity = PullRequestEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pullRequestEntity.id = id;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    pullRequestEntity.url = url;
  }
  final double? number = jsonConvert.convert<double>(json['number']);
  if (number != null) {
    pullRequestEntity.number = number;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    pullRequestEntity.state = state;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    pullRequestEntity.title = title;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    pullRequestEntity.body = body;
  }
  final double? assigneesNumber =
      jsonConvert.convert<double>(json['assignees_number']);
  if (assigneesNumber != null) {
    pullRequestEntity.assigneesNumber = assigneesNumber;
  }
  final double? testersNumber =
      jsonConvert.convert<double>(json['testers_number']);
  if (testersNumber != null) {
    pullRequestEntity.testersNumber = testersNumber;
  }
  final List<PullRequestLabel>? labels =
      jsonConvert.convertListNotNull<PullRequestLabel>(json['labels']);
  if (labels != null) {
    pullRequestEntity.labels = labels;
  }
  final bool? locked = jsonConvert.convert<bool>(json['locked']);
  if (locked != null) {
    pullRequestEntity.locked = locked;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    pullRequestEntity.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    pullRequestEntity.updatedAt = updatedAt;
  }
  final String? closedAt = jsonConvert.convert<String>(json['closed_at']);
  if (closedAt != null) {
    pullRequestEntity.closedAt = closedAt;
  }
  final String? mergedAt = jsonConvert.convert<String>(json['merged_at']);
  if (mergedAt != null) {
    pullRequestEntity.mergedAt = mergedAt;
  }
  final bool? mergeable = jsonConvert.convert<bool>(json['mergeable']);
  if (mergeable != null) {
    pullRequestEntity.mergeable = mergeable;
  }
  final bool? canMergeCheck =
      jsonConvert.convert<bool>(json['can_merge_check']);
  if (canMergeCheck != null) {
    pullRequestEntity.canMergeCheck = canMergeCheck;
  }
  final PullRequestHead? head =
      jsonConvert.convert<PullRequestHead>(json['head']);
  if (head != null) {
    pullRequestEntity.head = head;
  }
  final PullRequestBase? base =
      jsonConvert.convert<PullRequestBase>(json['base']);
  if (base != null) {
    pullRequestEntity.base = base;
  }
  final PullRequestLinks? pLinks =
      jsonConvert.convert<PullRequestLinks>(json['_links']);
  if (pLinks != null) {
    pullRequestEntity.pLinks = pLinks;
  }
  final PullRequestUser? user =
      jsonConvert.convert<PullRequestUser>(json['user']);
  if (user != null) {
    pullRequestEntity.user = user;
  }
  return pullRequestEntity;
}

Map<String, dynamic> $PullRequestEntityToJson(PullRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['url'] = entity.url;
  data['number'] = entity.number;
  data['state'] = entity.state;
  data['title'] = entity.title;
  data['body'] = entity.body;
  data['assignees_number'] = entity.assigneesNumber;
  data['testers_number'] = entity.testersNumber;
  data['labels'] = entity.labels?.map((v) => v.toJson()).toList();
  data['locked'] = entity.locked;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  data['closed_at'] = entity.closedAt;
  data['merged_at'] = entity.mergedAt;
  data['mergeable'] = entity.mergeable;
  data['can_merge_check'] = entity.canMergeCheck;
  data['head'] = entity.head?.toJson();
  data['base'] = entity.base?.toJson();
  data['_links'] = entity.pLinks?.toJson();
  data['user'] = entity.user?.toJson();
  return data;
}

PullRequestLabel $PullRequestLabelFromJson(Map<String, dynamic> json) {
  final PullRequestLabel pullRequestLabel = PullRequestLabel();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    pullRequestLabel.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pullRequestLabel.name = name;
  }
  final String? color = jsonConvert.convert<String>(json['color']);
  if (color != null) {
    pullRequestLabel.color = color;
  }
  final int? repositoryId = jsonConvert.convert<int>(json['repository_id']);
  if (repositoryId != null) {
    pullRequestLabel.repositoryId = repositoryId;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    pullRequestLabel.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    pullRequestLabel.updatedAt = updatedAt;
  }
  return pullRequestLabel;
}

Map<String, dynamic> $PullRequestLabelToJson(PullRequestLabel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['color'] = entity.color;
  data['repository_id'] = entity.repositoryId;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}

PullRequestHead $PullRequestHeadFromJson(Map<String, dynamic> json) {
  final PullRequestHead pullRequestHead = PullRequestHead();
  final String? label = jsonConvert.convert<String>(json['label']);
  if (label != null) {
    pullRequestHead.label = label;
  }
  final String? ref = jsonConvert.convert<String>(json['ref']);
  if (ref != null) {
    pullRequestHead.ref = ref;
  }
  final String? sha = jsonConvert.convert<String>(json['sha']);
  if (sha != null) {
    pullRequestHead.sha = sha;
  }
  final PullRequestHeadUser? user =
      jsonConvert.convert<PullRequestHeadUser>(json['user']);
  if (user != null) {
    pullRequestHead.user = user;
  }
  final PullRequestHeadRepo? repo =
      jsonConvert.convert<PullRequestHeadRepo>(json['repo']);
  if (repo != null) {
    pullRequestHead.repo = repo;
  }
  return pullRequestHead;
}

Map<String, dynamic> $PullRequestHeadToJson(PullRequestHead entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['label'] = entity.label;
  data['ref'] = entity.ref;
  data['sha'] = entity.sha;
  data['user'] = entity.user?.toJson();
  data['repo'] = entity.repo?.toJson();
  return data;
}

PullRequestHeadUser $PullRequestHeadUserFromJson(Map<String, dynamic> json) {
  final PullRequestHeadUser pullRequestHeadUser = PullRequestHeadUser();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pullRequestHeadUser.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    pullRequestHeadUser.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pullRequestHeadUser.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    pullRequestHeadUser.avatarUrl = avatarUrl;
  }
  return pullRequestHeadUser;
}

Map<String, dynamic> $PullRequestHeadUserToJson(PullRequestHeadUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

PullRequestHeadRepo $PullRequestHeadRepoFromJson(Map<String, dynamic> json) {
  final PullRequestHeadRepo pullRequestHeadRepo = PullRequestHeadRepo();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pullRequestHeadRepo.id = id;
  }
  final String? fullName = jsonConvert.convert<String>(json['full_name']);
  if (fullName != null) {
    pullRequestHeadRepo.fullName = fullName;
  }
  return pullRequestHeadRepo;
}

Map<String, dynamic> $PullRequestHeadRepoToJson(PullRequestHeadRepo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['full_name'] = entity.fullName;
  return data;
}

PullRequestHeadRepoNamespace $PullRequestHeadRepoNamespaceFromJson(
    Map<String, dynamic> json) {
  final PullRequestHeadRepoNamespace pullRequestHeadRepoNamespace =
      PullRequestHeadRepoNamespace();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pullRequestHeadRepoNamespace.id = id;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    pullRequestHeadRepoNamespace.type = type;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pullRequestHeadRepoNamespace.name = name;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    pullRequestHeadRepoNamespace.path = path;
  }
  return pullRequestHeadRepoNamespace;
}

Map<String, dynamic> $PullRequestHeadRepoNamespaceToJson(
    PullRequestHeadRepoNamespace entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['name'] = entity.name;
  data['path'] = entity.path;
  return data;
}

PullRequestHeadRepoOwner $PullRequestHeadRepoOwnerFromJson(
    Map<String, dynamic> json) {
  final PullRequestHeadRepoOwner pullRequestHeadRepoOwner =
      PullRequestHeadRepoOwner();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pullRequestHeadRepoOwner.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    pullRequestHeadRepoOwner.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pullRequestHeadRepoOwner.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    pullRequestHeadRepoOwner.avatarUrl = avatarUrl;
  }
  return pullRequestHeadRepoOwner;
}

Map<String, dynamic> $PullRequestHeadRepoOwnerToJson(
    PullRequestHeadRepoOwner entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

PullRequestHeadRepoAssigner $PullRequestHeadRepoAssignerFromJson(
    Map<String, dynamic> json) {
  final PullRequestHeadRepoAssigner pullRequestHeadRepoAssigner =
      PullRequestHeadRepoAssigner();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pullRequestHeadRepoAssigner.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    pullRequestHeadRepoAssigner.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pullRequestHeadRepoAssigner.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    pullRequestHeadRepoAssigner.avatarUrl = avatarUrl;
  }
  return pullRequestHeadRepoAssigner;
}

Map<String, dynamic> $PullRequestHeadRepoAssignerToJson(
    PullRequestHeadRepoAssigner entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

PullRequestBase $PullRequestBaseFromJson(Map<String, dynamic> json) {
  final PullRequestBase pullRequestBase = PullRequestBase();
  final String? label = jsonConvert.convert<String>(json['label']);
  if (label != null) {
    pullRequestBase.label = label;
  }
  final String? ref = jsonConvert.convert<String>(json['ref']);
  if (ref != null) {
    pullRequestBase.ref = ref;
  }
  final String? sha = jsonConvert.convert<String>(json['sha']);
  if (sha != null) {
    pullRequestBase.sha = sha;
  }
  final PullRequestBaseUser? user =
      jsonConvert.convert<PullRequestBaseUser>(json['user']);
  if (user != null) {
    pullRequestBase.user = user;
  }
  final PullRequestBaseRepo? repo =
      jsonConvert.convert<PullRequestBaseRepo>(json['repo']);
  if (repo != null) {
    pullRequestBase.repo = repo;
  }
  return pullRequestBase;
}

Map<String, dynamic> $PullRequestBaseToJson(PullRequestBase entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['label'] = entity.label;
  data['ref'] = entity.ref;
  data['sha'] = entity.sha;
  data['user'] = entity.user?.toJson();
  data['repo'] = entity.repo?.toJson();
  return data;
}

PullRequestBaseUser $PullRequestBaseUserFromJson(Map<String, dynamic> json) {
  final PullRequestBaseUser pullRequestBaseUser = PullRequestBaseUser();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pullRequestBaseUser.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    pullRequestBaseUser.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pullRequestBaseUser.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    pullRequestBaseUser.avatarUrl = avatarUrl;
  }
  return pullRequestBaseUser;
}

Map<String, dynamic> $PullRequestBaseUserToJson(PullRequestBaseUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

PullRequestBaseRepo $PullRequestBaseRepoFromJson(Map<String, dynamic> json) {
  final PullRequestBaseRepo pullRequestBaseRepo = PullRequestBaseRepo();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pullRequestBaseRepo.id = id;
  }
  final String? fullName = jsonConvert.convert<String>(json['full_name']);
  if (fullName != null) {
    pullRequestBaseRepo.fullName = fullName;
  }
  final String? humanName = jsonConvert.convert<String>(json['human_name']);
  if (humanName != null) {
    pullRequestBaseRepo.humanName = humanName;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    pullRequestBaseRepo.url = url;
  }
  final PullRequestBaseRepoNamespace? namespace =
      jsonConvert.convert<PullRequestBaseRepoNamespace>(json['namespace']);
  if (namespace != null) {
    pullRequestBaseRepo.namespace = namespace;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    pullRequestBaseRepo.path = path;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pullRequestBaseRepo.name = name;
  }
  final PullRequestBaseRepoOwner? owner =
      jsonConvert.convert<PullRequestBaseRepoOwner>(json['owner']);
  if (owner != null) {
    pullRequestBaseRepo.owner = owner;
  }
  final PullRequestBaseRepoAssigner? assigner =
      jsonConvert.convert<PullRequestBaseRepoAssigner>(json['assigner']);
  if (assigner != null) {
    pullRequestBaseRepo.assigner = assigner;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    pullRequestBaseRepo.description = description;
  }
  final bool? private = jsonConvert.convert<bool>(json['private']);
  if (private != null) {
    pullRequestBaseRepo.private = private;
  }
  final bool? public = jsonConvert.convert<bool>(json['public']);
  if (public != null) {
    pullRequestBaseRepo.public = public;
  }
  final bool? internal = jsonConvert.convert<bool>(json['internal']);
  if (internal != null) {
    pullRequestBaseRepo.internal = internal;
  }
  final bool? fork = jsonConvert.convert<bool>(json['fork']);
  if (fork != null) {
    pullRequestBaseRepo.fork = fork;
  }
  return pullRequestBaseRepo;
}

Map<String, dynamic> $PullRequestBaseRepoToJson(PullRequestBaseRepo entity) {
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
  return data;
}

PullRequestBaseRepoNamespace $PullRequestBaseRepoNamespaceFromJson(
    Map<String, dynamic> json) {
  final PullRequestBaseRepoNamespace pullRequestBaseRepoNamespace =
      PullRequestBaseRepoNamespace();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pullRequestBaseRepoNamespace.id = id;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    pullRequestBaseRepoNamespace.type = type;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pullRequestBaseRepoNamespace.name = name;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    pullRequestBaseRepoNamespace.path = path;
  }
  return pullRequestBaseRepoNamespace;
}

Map<String, dynamic> $PullRequestBaseRepoNamespaceToJson(
    PullRequestBaseRepoNamespace entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['name'] = entity.name;
  data['path'] = entity.path;
  return data;
}

PullRequestBaseRepoOwner $PullRequestBaseRepoOwnerFromJson(
    Map<String, dynamic> json) {
  final PullRequestBaseRepoOwner pullRequestBaseRepoOwner =
      PullRequestBaseRepoOwner();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pullRequestBaseRepoOwner.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    pullRequestBaseRepoOwner.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pullRequestBaseRepoOwner.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    pullRequestBaseRepoOwner.avatarUrl = avatarUrl;
  }
  return pullRequestBaseRepoOwner;
}

Map<String, dynamic> $PullRequestBaseRepoOwnerToJson(
    PullRequestBaseRepoOwner entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

PullRequestBaseRepoAssigner $PullRequestBaseRepoAssignerFromJson(
    Map<String, dynamic> json) {
  final PullRequestBaseRepoAssigner pullRequestBaseRepoAssigner =
      PullRequestBaseRepoAssigner();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pullRequestBaseRepoAssigner.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    pullRequestBaseRepoAssigner.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pullRequestBaseRepoAssigner.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    pullRequestBaseRepoAssigner.avatarUrl = avatarUrl;
  }
  return pullRequestBaseRepoAssigner;
}

Map<String, dynamic> $PullRequestBaseRepoAssignerToJson(
    PullRequestBaseRepoAssigner entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}

PullRequestLinks $PullRequestLinksFromJson(Map<String, dynamic> json) {
  final PullRequestLinks pullRequestLinks = PullRequestLinks();
  final PullRequestLinksSelf? self =
      jsonConvert.convert<PullRequestLinksSelf>(json['self']);
  if (self != null) {
    pullRequestLinks.self = self;
  }
  final PullRequestLinksHtml? html =
      jsonConvert.convert<PullRequestLinksHtml>(json['html']);
  if (html != null) {
    pullRequestLinks.html = html;
  }
  final PullRequestLinksIssue? issue =
      jsonConvert.convert<PullRequestLinksIssue>(json['issue']);
  if (issue != null) {
    pullRequestLinks.issue = issue;
  }
  final PullRequestLinksComments? comments =
      jsonConvert.convert<PullRequestLinksComments>(json['comments']);
  if (comments != null) {
    pullRequestLinks.comments = comments;
  }
  final PullRequestLinksReviewComments? reviewComments = jsonConvert
      .convert<PullRequestLinksReviewComments>(json['review_comments']);
  if (reviewComments != null) {
    pullRequestLinks.reviewComments = reviewComments;
  }
  final PullRequestLinksReviewComment? reviewComment = jsonConvert
      .convert<PullRequestLinksReviewComment>(json['review_comment']);
  if (reviewComment != null) {
    pullRequestLinks.reviewComment = reviewComment;
  }
  final PullRequestLinksCommits? commits =
      jsonConvert.convert<PullRequestLinksCommits>(json['commits']);
  if (commits != null) {
    pullRequestLinks.commits = commits;
  }
  return pullRequestLinks;
}

Map<String, dynamic> $PullRequestLinksToJson(PullRequestLinks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['self'] = entity.self?.toJson();
  data['html'] = entity.html?.toJson();
  data['issue'] = entity.issue?.toJson();
  data['comments'] = entity.comments?.toJson();
  data['review_comments'] = entity.reviewComments?.toJson();
  data['review_comment'] = entity.reviewComment?.toJson();
  data['commits'] = entity.commits?.toJson();
  return data;
}

PullRequestLinksSelf $PullRequestLinksSelfFromJson(Map<String, dynamic> json) {
  final PullRequestLinksSelf pullRequestLinksSelf = PullRequestLinksSelf();
  final String? href = jsonConvert.convert<String>(json['href']);
  if (href != null) {
    pullRequestLinksSelf.href = href;
  }
  return pullRequestLinksSelf;
}

Map<String, dynamic> $PullRequestLinksSelfToJson(PullRequestLinksSelf entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['href'] = entity.href;
  return data;
}

PullRequestLinksHtml $PullRequestLinksHtmlFromJson(Map<String, dynamic> json) {
  final PullRequestLinksHtml pullRequestLinksHtml = PullRequestLinksHtml();
  final String? href = jsonConvert.convert<String>(json['href']);
  if (href != null) {
    pullRequestLinksHtml.href = href;
  }
  return pullRequestLinksHtml;
}

Map<String, dynamic> $PullRequestLinksHtmlToJson(PullRequestLinksHtml entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['href'] = entity.href;
  return data;
}

PullRequestLinksIssue $PullRequestLinksIssueFromJson(
    Map<String, dynamic> json) {
  final PullRequestLinksIssue pullRequestLinksIssue = PullRequestLinksIssue();
  final String? href = jsonConvert.convert<String>(json['href']);
  if (href != null) {
    pullRequestLinksIssue.href = href;
  }
  return pullRequestLinksIssue;
}

Map<String, dynamic> $PullRequestLinksIssueToJson(
    PullRequestLinksIssue entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['href'] = entity.href;
  return data;
}

PullRequestLinksComments $PullRequestLinksCommentsFromJson(
    Map<String, dynamic> json) {
  final PullRequestLinksComments pullRequestLinksComments =
      PullRequestLinksComments();
  final String? href = jsonConvert.convert<String>(json['href']);
  if (href != null) {
    pullRequestLinksComments.href = href;
  }
  return pullRequestLinksComments;
}

Map<String, dynamic> $PullRequestLinksCommentsToJson(
    PullRequestLinksComments entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['href'] = entity.href;
  return data;
}

PullRequestLinksReviewComments $PullRequestLinksReviewCommentsFromJson(
    Map<String, dynamic> json) {
  final PullRequestLinksReviewComments pullRequestLinksReviewComments =
      PullRequestLinksReviewComments();
  final String? href = jsonConvert.convert<String>(json['href']);
  if (href != null) {
    pullRequestLinksReviewComments.href = href;
  }
  return pullRequestLinksReviewComments;
}

Map<String, dynamic> $PullRequestLinksReviewCommentsToJson(
    PullRequestLinksReviewComments entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['href'] = entity.href;
  return data;
}

PullRequestLinksReviewComment $PullRequestLinksReviewCommentFromJson(
    Map<String, dynamic> json) {
  final PullRequestLinksReviewComment pullRequestLinksReviewComment =
      PullRequestLinksReviewComment();
  final String? href = jsonConvert.convert<String>(json['href']);
  if (href != null) {
    pullRequestLinksReviewComment.href = href;
  }
  return pullRequestLinksReviewComment;
}

Map<String, dynamic> $PullRequestLinksReviewCommentToJson(
    PullRequestLinksReviewComment entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['href'] = entity.href;
  return data;
}

PullRequestLinksCommits $PullRequestLinksCommitsFromJson(
    Map<String, dynamic> json) {
  final PullRequestLinksCommits pullRequestLinksCommits =
      PullRequestLinksCommits();
  final String? href = jsonConvert.convert<String>(json['href']);
  if (href != null) {
    pullRequestLinksCommits.href = href;
  }
  return pullRequestLinksCommits;
}

Map<String, dynamic> $PullRequestLinksCommitsToJson(
    PullRequestLinksCommits entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['href'] = entity.href;
  return data;
}

PullRequestUser $PullRequestUserFromJson(Map<String, dynamic> json) {
  final PullRequestUser pullRequestUser = PullRequestUser();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pullRequestUser.id = id;
  }
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    pullRequestUser.login = login;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pullRequestUser.name = name;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
  if (avatarUrl != null) {
    pullRequestUser.avatarUrl = avatarUrl;
  }
  return pullRequestUser;
}

Map<String, dynamic> $PullRequestUserToJson(PullRequestUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['login'] = entity.login;
  data['name'] = entity.name;
  data['avatar_url'] = entity.avatarUrl;
  return data;
}
