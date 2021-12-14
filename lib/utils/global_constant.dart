// For keys in SharedPreferences
import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/ui/view_picture_page.dart';
import 'package:flutter_gitee/main/start/start_page.dart';
import 'package:flutter_gitee/repo/search_page.dart';
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
};

class GlobalTheme {
  final ThemeData theme;
  final String name;

  GlobalTheme(this.theme, this.name);
}

final globalThemes = [
  GlobalTheme(
      ThemeData(primarySwatch: Colors.red, backgroundColor: Colors.white),
      "Default"),
  GlobalTheme(
      ThemeData(primarySwatch: Colors.teal, backgroundColor: Colors.white),
      "Teal"),
  GlobalTheme(
      ThemeData(primarySwatch: Colors.pink, backgroundColor: Colors.white),
      "Pink"),
  GlobalTheme(
      ThemeData(primarySwatch: Colors.green, backgroundColor: Colors.white),
      "Green"),
  GlobalTheme(
      ThemeData(primarySwatch: Colors.amber, backgroundColor: Colors.white),
      "Amber"),
  GlobalTheme(
      ThemeData(primarySwatch: Colors.brown, backgroundColor: Colors.white),
      "Brown"),
  GlobalTheme(
      ThemeData(primarySwatch: Colors.blueGrey, backgroundColor: Colors.white),
      "BlueGrey"),
  GlobalTheme(
      ThemeData(primarySwatch: Colors.purple, backgroundColor: Colors.white),
      "Purple"),
  GlobalTheme(
      ThemeData(primarySwatch: Colors.cyan, backgroundColor: Colors.white),
      "Cyan"),
  GlobalTheme(
      ThemeData(
          primarySwatch: Colors.deepOrange, backgroundColor: Colors.white),
      "DeepOrange"),
  GlobalTheme(ThemeData(brightness: Brightness.dark), "Dark"),
  GlobalTheme(
      ThemeData(brightness: Brightness.light, backgroundColor: Colors.white),
      "Light")
];

final themeNames = ["Red", "Brown", "Teal", "Pink", "Orange"];
