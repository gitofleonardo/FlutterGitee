import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/repo/attrs/filter_attrs.dart';
import 'package:flutter_gitee/repo/bean/issue_result_entity.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/repo/repository_page.dart';
import 'package:flutter_gitee/user/bean/result/success/user_profile_entity.dart';
import 'package:flutter_gitee/utils/global_context.dart';
import 'package:flutter_gitee/utils/global_utils.dart';

Future<BaseResult<List<RepositoryEntity>>> getRepository(
    {required int page,
    required int perPage,
    required RepositoryType type,
    SortBy sortBy = SortBy.created,
    SortDirection direction = SortDirection.desc}) {
  final String url;
  switch (type) {
    case RepositoryType.star:
      url = "api/v5/user/starred";
      break;
    case RepositoryType.watch:
      url = "api/v5/user/subscriptions";
      break;
  }
  final String sort;
  switch (sortBy) {
    case SortBy.created:
      sort = "created";
      break;
    case SortBy.lastPush:
      sort = "last_push";
      break;
  }
  final String d;
  switch (direction) {
    case SortDirection.desc:
      d = "desc";
      break;
    case SortDirection.asc:
      d = "asc";
      break;
  }
  final res = postRequest<List<RepositoryEntity>>(url, RequestType.get, {
    "access_token": globalToken,
    "page": page,
    "per_page": perPage,
    "sort": sort,
    "direction": d
  });
  return res;
}

Future<BaseResult<List<RepositoryEntity>>> getMyRepository(
    {required int page,
    required int perPage,
    SortBy sortBy = SortBy.created,
    SortDirection direction = SortDirection.desc,
    RepoType type = RepoType.all}) {
  final String sort;
  switch (sortBy) {
    case SortBy.created:
      sort = "created";
      break;
    case SortBy.lastPush:
      sort = "updated";
      break;
  }
  final String d;
  switch (direction) {
    case SortDirection.desc:
      d = "desc";
      break;
    case SortDirection.asc:
      d = "asc";
      break;
  }
  final String t;
  switch (type) {
    case RepoType.all:
      t = "all";
      break;
    case RepoType.member:
      t = "member";
      break;
    case RepoType.owner:
      t = "owner";
      break;
    case RepoType.personal:
      t = "personal";
      break;
    case RepoType.public:
      t = "public";
      break;
    case RepoType.private:
      t = "private";
      break;
  }
  final res = postRequest<List<RepositoryEntity>>(
      "api/v5/user/repos", RequestType.get, {
    "access_token": globalToken,
    "page": page,
    "per_page": perPage,
    "sort": sort,
    "direction": d,
    "type": t
  });
  return res;
}

Future<BaseResult<List<RepositoryEntity>>> searchRepository(
    String text, int page, int perPage,
    {RepositoryFilter? filter}) {
  final params = {
    "access_token": globalToken,
    "q": text,
    "page": page,
    "per_page": perPage
  };
  if (filter != null) {
    if (filter.language != null) {
      params["language"] = filter.language;
    }
    if (filter.fork != null) {
      params["fork"] = filter.fork;
    }
    if (filter.order != null) {
      switch (filter.order!) {
        case SortDirection.asc:
          params["order"] = "asc";
          break;
        case SortDirection.desc:
          params["order"] = "desc";
          break;
      }
    }
    if (filter.sort != null) {
      switch (filter.sort!) {
        case RepositoryFilterSort.lastPushAt:
          params["sort"] = "last_push_at";
          break;
        case RepositoryFilterSort.starsCount:
          params["sort"] = "stars_count";
          break;
        case RepositoryFilterSort.forksCount:
          params["sort"] = "forks_count";
          break;
        case RepositoryFilterSort.watchesCount:
          params["sort"] = "watches_count";
          break;
      }
    }
  }
  return postRequest("api/v5/search/repositories", RequestType.get, params);
}

Future<BaseResult<List<UserProfileEntity>>> searchUser(
    String text, int page, int perPage,
    {UserFilter? filter}) {
  final params = {
    "access_token": globalToken,
    "q": text,
    "page": page,
    "per_page": perPage
  };
  if (filter != null) {
    if (filter.sort != null) {
      switch (filter.sort!) {
        case UserFilterSort.joinedAt:
          params["sort"] = "joined_at";
          break;
      }
    }
    if (filter.order != null) {
      switch (filter.order!) {
        case SortDirection.asc:
          params["order"] = "asc";
          break;
        case SortDirection.desc:
          params["order"] = "desc";
          break;
      }
    }
  }
  return postRequest("api/v5/search/users", RequestType.get, params);
}

Future<BaseResult<List<IssueResultEntity>>> searchIssue(
    String text, int page, int perPage,
    {IssueFilter? filter}) {
  final params = {
    "access_token": globalToken,
    "page": page,
    "per_page": perPage,
    "q": text
  };
  if (filter != null) {
    if (filter.language != null) {
      params["language"] = filter.language;
    }
    if (filter.order != null) {
      switch (filter.order!) {
        case SortDirection.asc:
          params["order"] = "asc";
          break;
        case SortDirection.desc:
          params["order"] = "desc";
          break;
      }
    }
    if (filter.sort != null) {
      switch (filter.sort!) {
        case IssueFilterSort.createAt:
          params["sort"] = "created_at";
          break;
        case IssueFilterSort.updatedAt:
          params["sort"] = "updated_at";
          break;
        case IssueFilterSort.notesCount:
          params["sort"] = "notes_count";
          break;
      }
    }
    if (filter.state != null) {
      switch (filter.state!) {
        case IssueState.open:
          params["state"] = "open";
          break;
        case IssueState.progressing:
          params["state"] = "progressing";
          break;
        case IssueState.closed:
          params["state"] = "closed";
          break;
        case IssueState.rejected:
          params["state"] = "rejected";
          break;
      }
    }
  }
  return postRequest("api/v5/search/issues", RequestType.get, params);
}
