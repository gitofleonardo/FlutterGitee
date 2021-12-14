import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/repo/attrs/sort_attrs.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/repo/repository_page.dart';
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
