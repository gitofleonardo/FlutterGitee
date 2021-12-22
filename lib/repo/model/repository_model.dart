import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/repo/attrs/filter_attrs.dart';
import 'package:flutter_gitee/repo/bean/branch_entity.dart';
import 'package:flutter_gitee/repo/bean/commit_detail_entity.dart';
import 'package:flutter_gitee/repo/bean/issue_result_entity.dart';
import 'package:flutter_gitee/repo/bean/pull_request_entity.dart';
import 'package:flutter_gitee/repo/bean/repo_commit_entity.dart';
import 'package:flutter_gitee/repo/bean/repo_file_entity.dart';
import 'package:flutter_gitee/repo/bean/repository_blob_entity.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/repo/bean/repository_tree_entity.dart';
import 'package:flutter_gitee/repo/ui/repository_page.dart';
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

Future<BaseResult<RepositoryEntity>> getRepositoryInfo(String fullName) async {
  final repo = await postRequest<RepositoryEntity>(
      "api/v5/repos/$fullName", RequestType.get, {"access_token": globalToken});
  final readme = await postRequest<RepoFileEntity>(
      "api/v5/repos/$fullName/readme",
      RequestType.get,
      {"access_token": globalToken});
  if (repo.success && (readme.success || readme.resultCode == 404)) {
    repo.data!.readme = readme.data;
    return repo;
  }
  if (!repo.success) {
    return repo;
  }
  repo.state = readme.state;
  repo.resultCode = readme.resultCode;
  return repo;
}

Future<BaseResult<String>> toggleRepositoryStar(String fullname, bool star) {
  final RequestType method = star ? RequestType.put : RequestType.delete;
  return postRequest<String>(
      "api/v5/user/starred/$fullname", method, {"access_token": globalToken});
}

Future<BaseResult<RepoFileEntity>> getRepoFile(
    String fullname, String filename) {
  return postRequest("api/v5/repos/$fullname/contents/$filename",
      RequestType.get, {"access_token": globalToken});
}

Future<BaseResult<RepositoryBlobEntity>> getRepoBlobFile(
    String fullname, String filename) {
  return postRequest("api/v5/repos/$fullname/git/blobs/$filename",
      RequestType.get, {"access_token": globalToken});
}

Future<BaseResult<List<BranchEntity>>> getBranches(String fullname) {
  return postRequest("api/v5/repos/$fullname/branches", RequestType.get,
      {"access_token": globalToken});
}

Future<BaseResult<RepositoryTreeEntity>> getRepositoryTree(
    String fullname, String sha) {
  return postRequest("api/v5/repos/$fullname/git/trees/$sha", RequestType.get,
      {"access_token": globalToken});
}

Future<BaseResult<List<UserProfileEntity>>> getStargazers(
    String fullName, int page, int perPage) {
  return postRequest<List<UserProfileEntity>>(
      "api/v5/repos/$fullName/stargazers",
      RequestType.get,
      {"access_token": globalToken, "page": page, "per_page": perPage});
}

Future<BaseResult<List<UserProfileEntity>>> getWatchers(
    String fullName, int page, int perPage) {
  return postRequest<List<UserProfileEntity>>(
      "api/v5/repos/$fullName/subscribers",
      RequestType.get,
      {"access_token": globalToken, "page": page, "per_page": perPage});
}

Future<BaseResult<List<RepoCommitEntity>>> getRepoCommits(
    String fullName, String branch, int page, int perPage) {
  return postRequest("api/v5/repos/$fullName/commits", RequestType.get, {
    "access_token": globalToken,
    "page": page,
    "per_page": perPage,
    "sha": branch
  });
}

Future<BaseResult<CommitDetailEntity>> getRepoCommitDetail(
    String fullName, String sha) {
  return postRequest<CommitDetailEntity>("api/v5/repos/$fullName/commits/$sha",
      RequestType.get, {"access_token": globalToken});
}

Future<BaseResult<List<RepositoryEntity>>> getRepoForks(
    String fullName, int page, int perPage) {
  return postRequest<List<RepositoryEntity>>(
      "api/v5/repos/$fullName/forks",
      RequestType.get,
      {"access_token": globalToken, "page": page, "per_page": perPage});
}

Future<BaseResult<List<IssueResultEntity>>> getRepositoryIssue(String fullName,
    int page, int perPage, String sort, String sortDirection, String state) {
  final params = {
    "access_token": globalToken,
    "page": page,
    "per_page": perPage
  };
  if (sort.isNotEmpty) {
    params["sort"] = sort;
  }
  if (sortDirection.isNotEmpty) {
    params["direction"] = sortDirection;
  }
  if (state.isNotEmpty) {
    params["state"] = state;
  }
  return postRequest("api/v5/repos/$fullName/issues", RequestType.get, params);
}

Future<BaseResult<List<UserProfileEntity>>> getRepoCollaborator(
    String fullName, int page, int perPage) {
  return postRequest("api/v5/repos/$fullName/collaborators", RequestType.get,
      {"access_token": globalToken, "page": page, "per_page": perPage});
}

Future<BaseResult<List<PullRequestEntity>>> getRepoPullRequest(String fullName,
    int page, int perPage, String sort, String sortDirection, String state) {
  final params = {
    "access_token": globalToken,
    "page": page,
    "per_page": perPage
  };
  if (sort.isNotEmpty) {
    params["sort"] = sort;
  }
  if (sortDirection.isNotEmpty) {
    params["direction"] = sortDirection;
  }
  if (state.isNotEmpty) {
    params["state"] = state;
  }
  return postRequest("api/v5/repos/$fullName/pulls", RequestType.get, params);
}
