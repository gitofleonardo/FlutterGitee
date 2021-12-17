// For keys in SharedPreferences
import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/ui/view_picture_page.dart';
import 'package:flutter_gitee/main/start/start_page.dart';
import 'package:flutter_gitee/repo/repository_detail_page.dart';
import 'package:flutter_gitee/repo/repository_tree_viewer.dart';
import 'package:flutter_gitee/repo/search/search_page.dart';
import 'package:flutter_gitee/user/follower_page.dart';
import 'package:flutter_gitee/user/following_page.dart';
import 'package:flutter_gitee/user/login_page.dart';
import 'package:flutter_gitee/user/user_profile_page.dart';

const tokenName = "token";
const refreshTokenName = "refreshToken";
const themeName = "theme";
const usernameName = "username";
const passwordName = "password";

//routes
final routes = {
  "home_page": (ctx) => const StartPage(),
  "login_page": (ctx) => const LoginPage(),
  "follower_page": (ctx) =>
      FollowerPage(user: ModalRoute.of(ctx)!.settings.arguments.toString()),
  "following_page": (ctx) =>
      FollowingPage(user: ModalRoute.of(ctx)!.settings.arguments.toString()),
  "view_picture_page": (ctx) =>
      ViewPicturePage(url: ModalRoute.of(ctx)!.settings.arguments.toString()),
  "user_profile_page": (ctx) =>
      UserProfilePage(user: ModalRoute.of(ctx)!.settings.arguments.toString()),
  "search_page": (ctx) => const SearchPage(),
  "repository_detail_page": (ctx) => RepositoryDetailPage(
      fullname: ModalRoute.of(ctx)!.settings.arguments.toString()),
  "repository_tree_page": (ctx) => RepositoryTreeViewer(
      treeInfo: ModalRoute.of(ctx)!.settings.arguments as TreeInfo)
};

class GlobalTheme {
  final ThemeData theme;
  final String name;

  GlobalTheme(this.theme, this.name);
}

const lightThemeBackgroundColor = Color(0xffeaeaea);

final globalThemes = [
  GlobalTheme(
      ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: lightThemeBackgroundColor,
          backgroundColor: Colors.white),
      "Default"),
  GlobalTheme(
      ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: lightThemeBackgroundColor,
          backgroundColor: Colors.white),
      "Teal"),
  GlobalTheme(
      ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: lightThemeBackgroundColor),
      "Pink"),
  GlobalTheme(
      ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: lightThemeBackgroundColor,
          backgroundColor: Colors.white),
      "Green"),
  GlobalTheme(
      ThemeData(
          primarySwatch: Colors.amber,
          scaffoldBackgroundColor: lightThemeBackgroundColor,
          backgroundColor: Colors.white),
      "Amber"),
  GlobalTheme(
      ThemeData(
          primarySwatch: Colors.brown,
          scaffoldBackgroundColor: lightThemeBackgroundColor,
          backgroundColor: Colors.white),
      "Brown"),
  GlobalTheme(
      ThemeData(
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: lightThemeBackgroundColor,
          backgroundColor: Colors.white),
      "BlueGrey"),
  GlobalTheme(
      ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: lightThemeBackgroundColor,
          backgroundColor: Colors.white),
      "Purple"),
  GlobalTheme(
      ThemeData(
          primarySwatch: Colors.cyan,
          scaffoldBackgroundColor: lightThemeBackgroundColor,
          backgroundColor: Colors.white),
      "Cyan"),
  GlobalTheme(
      ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: lightThemeBackgroundColor,
          backgroundColor: Colors.white),
      "DeepOrange"),
  GlobalTheme(
      ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xff262626),
          backgroundColor: const Color(0xff2b2b2b)),
      "Dark"),
  GlobalTheme(
      ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: lightThemeBackgroundColor,
          backgroundColor: Colors.white),
      "Light")
];

const giteeBaseUrl = "https://gitee.com/";
