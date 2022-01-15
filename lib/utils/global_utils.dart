import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/repo/bean/repo_file_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/user/bean/login_success_result_entity.dart';
import 'package:flutter_gitee/utils/global_constant.dart';
import 'package:flutter_gitee/utils/global_context.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global_events.dart';

Future<String?> getLocalToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(tokenName);
}

Future<void> setLocalToken(String? token) async {
  final prefs = await SharedPreferences.getInstance();
  if (token == null) {
    prefs.remove(tokenName);
    return;
  }
  prefs.setString(tokenName, token);
  globalToken = token;
}

Future<String?> getLocalRefreshToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(refreshTokenName);
}

Future<void> setLocalRefreshToken(String? token) async {
  final prefs = await SharedPreferences.getInstance();
  if (token == null) {
    prefs.remove(refreshTokenName);
    return;
  }
  prefs.setString(refreshTokenName, token);
  globalRefreshToken = token;
}

Future<void> clearLocalAuth() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(tokenName);
  prefs.remove(refreshTokenName);
  globalRefreshToken = null;
  globalToken = null;
  globalProfile = null;
}

class UserAccount {
  String username;
  String password;
  UserAccount(this.username, this.password);
}

Future<UserAccount?> getLastLoginAccount() async {
  final prefs = await SharedPreferences.getInstance();
  final uname = prefs.getString(usernameName);
  final pwd = prefs.getString(passwordName);
  if (uname == null || pwd == null) {
    return null;
  }
  return UserAccount(uname, pwd);
}

Future<void> setLastLoginAccount(String? username, String? password) async {
  final prefs = await SharedPreferences.getInstance();
  if (username == null || password == null) {
    prefs.remove(usernameName);
    prefs.remove(passwordName);
  } else {
    prefs.setString(usernameName, username);
    prefs.setString(passwordName, password);
  }
}

Future<GlobalTheme> getCurrentTheme() async {
  final prefs = await SharedPreferences.getInstance();
  final theme = prefs.getInt(themeName);
  if (theme == null) {
    return globalThemes[0];
  }
  return globalThemes[theme];
}

Future<void> setCurrentTheme(GlobalTheme theme) async {
  globalTheme = theme;
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(themeName, globalThemes.indexOf(theme));
}

ThemeData getTheme(int themeIndex) {
  return globalThemes[themeIndex].theme;
}

Future<void> setCurrentLanguage(String lang) async {
  globalLanguage = lang;
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(languageName, lang);
}

Future<String> getCurrentLanguage() async {
  final prefs = await SharedPreferences.getInstance();
  final lang = prefs.getString(languageName);
  if (lang == null) {
    return globalLanguages[0];
  }
  return lang;
}

Dio getDioInstance() {
  final options = BaseOptions(baseUrl: giteeBaseUrl);
  return Dio(options);
}

enum RequestType { post, get, delete, put }

Future<BaseResult<T>> postRequest<T>(String url, RequestType method,
    [Map<String, dynamic>? params, dynamic data]) async {
  var result = await _postRequest<T>(url, method, params, data);
  if (result.state == BaseStatus.unauthorized) {
    final status = await _refreshToken();
    if (status == BaseStatus.unauthorized) {
      globalEventBus.fire(UserStateEvent(UserState.tokenExpired));
      return result;
    } else if (status == BaseStatus.success) {
      result = await _postRequest<T>(url, method, params, data);
    } else {
      result.state = status;
    }
  }
  return result;
}

Future<BaseResult<T>> _postRequest<T>(String url, RequestType method,
    [Map<String, dynamic>? params, dynamic data]) async {
  debugPrint(url);
  debugPrint(params.toString());
  debugPrint(data);

  final instance = getDioInstance();
  Response? response;
  BaseResult<T> result = BaseResult();
  try {
    switch (method) {
      case RequestType.post:
        response = await instance.post<String>(url,
            queryParameters: params, data: data);
        break;
      case RequestType.get:
        response = await instance.get<String>(url, queryParameters: params);
        break;
      case RequestType.delete:
        response = await instance.delete<String>(url,
            queryParameters: params, data: data);
        break;
      case RequestType.put:
        response = await instance.put<String>(url,
            queryParameters: params, data: data);
        break;
    }
    final body = response.data.toString();
    debugPrint(body);
    if (body.trim().isEmpty) {
      result.data = body as T?;
    } else {
      result.data = JsonConvert.fromJsonAsT(jsonDecode(body));
    }
    result.state = BaseStatus.success;
    result.resultCode = response.statusCode ?? 0;
  } on DioError catch (e) {
    response = e.response;
    result.resultCode = response?.statusCode ?? -1;
    if (response != null && response.statusCode == 401) {
      result.state = BaseStatus.unauthorized;
    } else {
      result.state = BaseStatus.failure;
    }
    result.errorMessage = e.toString();
    debugPrint(e.response.toString());
    debugPrint(e.toString());
  }
  return result;
}

Future<BaseStatus> _refreshToken() async {
  debugPrint("Refreshing access token");
  final refreshToken = await getLocalRefreshToken();
  debugPrint("Refresh token: $refreshToken");
  if (refreshToken == null) {
    return BaseStatus.unauthorized;
  }
  final dio = getDioInstance();
  Response? resp;
  try {
    resp = await dio.post<String>("oauth/token", queryParameters: {
      "grant_type": "refresh_token",
      "refresh_token": refreshToken
    });
    final result =
        JsonConvert.fromJsonAsT(resp.data) as LoginSuccessResultEntity;
    setLocalToken(result.accessToken);
    setLocalRefreshToken(result.refreshToken);
    return BaseStatus.success;
  } on DioError catch (e) {
    debugPrint(e.response.toString());
    debugPrint(e.toString());
    resp = e.response;

    if (resp == null) {
      return BaseStatus.networkFailure;
    }
    if (resp.statusCode == 401) {
      return BaseStatus.unauthorized;
    }
    return BaseStatus.failure;
  }
}

String formatDate(String dateString) {
  final date = DateTime.tryParse(dateString) ?? DateTime.now();
  final timeGap = DateTime.now().difference(date);
  if (timeGap.inSeconds < 60) {
    return "Just now";
  } else if (timeGap.inMinutes < 60) {
    return "${timeGap.inMinutes} minutes ago";
  } else if (timeGap.inHours < 24) {
    return "About ${timeGap.inHours} hours ago";
  } else if (timeGap.inDays < 7) {
    return "${timeGap.inDays} day${timeGap.inDays > 1 ? 's' : ''} ago";
  }
  return DateFormat("yy-MM-dd hh:mm").format(date);
}

String formatGitCount(int? count) {
  final cnt = count ?? 0;
  return cnt < 1000 ? "$cnt" : "${cnt / 1000}K";
}

String base64ToString(String? src) {
  if (src == null || src.isEmpty) {
    return "";
  }
  Codec<String, String> codec = utf8.fuse(base64);
  return codec.decode(src);
}

Widget repositoryMarkdownImageBuilder(
    Uri uri, String fullName, String title, String alt) {
  var url = uri.toString().trim();
  if (!url.startsWith("http")) {
    return FutureBuilder<BaseResult<RepoFileEntity>>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data;
            if (data != null && data.success) {
              return Image.memory(
                  const Base64Decoder().convert(data.data?.content ?? ""));
            }
          }
          return const SizedBox(width: 0, height: 0);
        },
        future: getRepoFile(fullName, url));
  } else {
    return Image.network(url);
  }
}

Uint8List base64ToUint8ListImage(String dat) {
  return const Base64Decoder().convert(dat);
}
