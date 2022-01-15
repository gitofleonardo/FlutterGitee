// For keys in SharedPreferences
import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/about_page.dart';
import 'package:flutter_gitee/main/base/ui/view_picture_page.dart';
import 'package:flutter_gitee/main/start/start_page.dart';
import 'package:flutter_gitee/repo/search/search_page.dart';
import 'package:flutter_gitee/repo/ui/my_issue_page.dart';
import 'package:flutter_gitee/repo/ui/repo_collaborator_page.dart';
import 'package:flutter_gitee/repo/ui/repo_forks_page.dart';
import 'package:flutter_gitee/repo/ui/repo_issue_page.dart';
import 'package:flutter_gitee/repo/ui/repo_pull_request_page.dart';
import 'package:flutter_gitee/repo/ui/repo_releases_page.dart';
import 'package:flutter_gitee/repo/ui/repo_stargazers_page.dart';
import 'package:flutter_gitee/repo/ui/repo_watchers_page.dart';
import 'package:flutter_gitee/repo/ui/repository_detail_page.dart';
import 'package:flutter_gitee/repo/ui/repository_tree_viewer.dart';
import 'package:flutter_gitee/user/follower_page.dart';
import 'package:flutter_gitee/user/following_page.dart';
import 'package:flutter_gitee/user/login_page.dart';
import 'package:flutter_gitee/user/user_profile_page.dart';

// local database keys
const tokenName = "token";
const refreshTokenName = "refreshToken";
const themeName = "theme";
const usernameName = "username";
const passwordName = "password";
const languageName = "language";

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
      fullName: ModalRoute.of(ctx)!.settings.arguments.toString()),
  "repository_tree_page": (ctx) => RepositoryTreeViewer(
      treeInfo: ModalRoute.of(ctx)!.settings.arguments as TreeInfo),
  "repository_stargazers_page": (ctx) => RepoStargazersPage(
      fullName: ModalRoute.of(ctx)!.settings.arguments.toString()),
  "repository_watchers_page": (ctx) => RepoWatchersPage(
      fullName: ModalRoute.of(ctx)!.settings.arguments.toString()),
  "about_page": (ctx) => const AboutPage(),
  "repository_forks_page": (ctx) => RepoForksPage(
      fullName: ModalRoute.of(ctx)!.settings.arguments.toString()),
  "repository_issue_page": (ctx) => RepoIssuePage(
      fullName: ModalRoute.of(ctx)!.settings.arguments.toString()),
  "repository_collaborator_page": (ctx) => RepoCollaboratorPage(
      fullName: ModalRoute.of(ctx)!.settings.arguments.toString()),
  "repository_pull_request_page": (ctx) => RepoPullRequestPage(
      fullName: ModalRoute.of(ctx)!.settings.arguments.toString()),
  "my_issue_page": (ctx) => const MyIssuePage(),
  "repository_releases_page": (ctx) => RepoReleasesPage(
      fullName: ModalRoute.of(ctx)!.settings.arguments.toString()),
};

class GlobalTheme {
  final ThemeData theme;
  final String name;

  GlobalTheme(this.theme, this.name);
}

final defaultTheme = GlobalTheme(
    ThemeData(brightness: Brightness.light, backgroundColor: Colors.white),
    "Light");

const defaultLanguage = "zh";

final darkTheme = GlobalTheme(
    ThemeData(
        brightness: Brightness.dark, backgroundColor: const Color(0xff2b2b2b)),
    "Dark");

final globalThemes = [
  GlobalTheme(
      ThemeData(primarySwatch: Colors.red, backgroundColor: Colors.white),
      "Default"),
  GlobalTheme(
      ThemeData(primarySwatch: Colors.teal, backgroundColor: Colors.white),
      "Teal"),
  GlobalTheme(
      ThemeData(
        primarySwatch: Colors.pink,
      ),
      "Pink"),
  GlobalTheme(
      ThemeData(primarySwatch: Colors.green, backgroundColor: Colors.white),
      "Green"),
  GlobalTheme(
      ThemeData(primarySwatch: Colors.brown, backgroundColor: Colors.white),
      "Brown"),
  GlobalTheme(
      ThemeData(primarySwatch: Colors.blueGrey, backgroundColor: Colors.white),
      "BlueGrey"),
  GlobalTheme(
      ThemeData(primarySwatch: Colors.cyan, backgroundColor: Colors.white),
      "Cyan"),
  GlobalTheme(
      ThemeData(
          primarySwatch: Colors.deepOrange, backgroundColor: Colors.white),
      "DeepOrange"),
  defaultTheme,
  darkTheme
];

final globalLanguages = ["zh", "en"];

const giteeBaseUrl = "https://gitee.com/";
