import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/user/bean/event_result_entity.dart';
import 'package:flutter_gitee/user/bean/follow_result_entity.dart';
import 'package:flutter_gitee/user/bean/login_success_result_entity.dart';
import 'package:flutter_gitee/user/bean/user_profile_entity.dart';
import 'package:flutter_gitee/utils/app_secret.dart';
import 'package:flutter_gitee/utils/global_context.dart';
import 'package:flutter_gitee/utils/global_utils.dart';

Future<BaseResult<LoginSuccessResultEntity>> login(
    String username, String password) async {
  final result =
      postRequest<LoginSuccessResultEntity>("oauth/token", RequestType.post, {
    "grant_type": "password",
    "username": username,
    "password": password,
    "client_id": clientID,
    "client_secret": clientSecret,
    "scope":
        "user_info projects pull_requests issues notes keys hook groups gists enterprises"
  });
  return result;
}

Future<BaseResult<UserProfileEntity>> getMyUserProfile() async {
  final result = postRequest<UserProfileEntity>(
      "api/v5/user", RequestType.get, {"access_token": globalToken});
  return result;
}

Future<BaseResult<UserProfileEntity>> getUserProfile(String username) async {
  return postRequest<UserProfileEntity>(
      "api/v5/users/$username", RequestType.get, {"access_token": globalToken});
}

Future<BaseResult<String>> getUserFollowState(String username) async {
  return postRequest("api/v5/user/following/$username", RequestType.get,
      {"access_token": globalToken});
}

Future<BaseResult<List<FollowResultEntity>>> getFollowers(
    {required int page, required int perPage, required String user}) async {
  final result = postRequest<List<FollowResultEntity>>(
      "api/v5/users/$user/followers",
      RequestType.get,
      {"access_token": globalToken, "page": page, "per_page": perPage});
  return result;
}

Future<BaseResult<List<FollowResultEntity>>> getFollowings(
    {required int page, required int perPage, required String user}) async {
  final result = postRequest<List<FollowResultEntity>>(
      "api/v5/users/$user/following",
      RequestType.get,
      {"access_token": globalToken, "page": page, "per_page": perPage});
  return result;
}

Future<BaseResult<String>> unfollow({required String user}) async {
  final result = postRequest<String>("api/v5/user/following/$user",
      RequestType.delete, {"access_token": globalToken});
  return result;
}

Future<BaseResult<String>> followUser(String username) async {
  final result = postRequest<String>("api/v5/user/following/$username",
      RequestType.put, {"access_token": globalToken});
  return result;
}

Future<BaseResult<List<EventResultEntity>>> getUserEvent(
    {int? prevID, int limit = 10}) async {
  final map = {"access_token": globalToken, "limit": limit};
  if (prevID != null) {
    map["prev_id"] = prevID;
  }
  if (globalProfile == null) {
    final profile = await getMyUserProfile();
    globalProfile = profile.data;
  }
  final result = postRequest<List<EventResultEntity>>(
      "api/v5/users/${globalProfile?.login.toString()}/events",
      RequestType.get,
      map);
  return result;
}
