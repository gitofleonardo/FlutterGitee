// For keys in SharedPreferences
import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/about_page.dart';
import 'package:flutter_gitee/main/base/ui/view_picture_page.dart';
import 'package:flutter_gitee/main/language_selection_page.dart';
import 'package:flutter_gitee/main/start/home/start_page.dart';
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
  "language_page": (ctx) => const LanguageSelectionPage(),
};

class GlobalTheme {
  final ThemeData theme;
  final String name;

  GlobalTheme(this.theme, this.name);
}

final defaultTheme = GlobalTheme(
    ThemeData(
      dialogTheme: const DialogTheme(
        backgroundColor: Color(0xFFfdfbff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
      ),
      buttonTheme: const ButtonThemeData(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
      )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        sizeConstraints: BoxConstraints(minWidth: 64, minHeight: 64),
        extendedSizeConstraints: BoxConstraints(minHeight: 64),
      ),
      cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
        ),
        elevation: 0,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFfdfbff),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff175db2),
        onPrimary: Color(0xFFffffff),
        secondary: Color(0xFF565f71),
        onSecondary: Color(0xFFffffff),
        error: Color(0xFFba1b1b),
        onError: Color(0xFFffffff),
        background: Color(0xFFfdfbff),
        onBackground: Color(0xFF1a1b1f),
        surface: Color(0xFFfdfbff),
        onSurface: Color(0xFF1a1b1f),
        tertiary: Color(0xFF6f5574),
        onTertiary: Color(0xFFffffff),
        primaryContainer: Color(0xFFd6e3ff),
        onPrimaryContainer: Color(0xFF001b3f),
        secondaryContainer: Color(0xFFdae3f9),
        onSecondaryContainer: Color(0xFF131c2b),
        tertiaryContainer: Color(0xFFf9d8fd),
        onTertiaryContainer: Color(0xFF28132e),
      ),
    ),
    "Light");

const defaultLanguage = "zh";

final darkTheme = GlobalTheme(
    ThemeData(
      dialogTheme: const DialogTheme(
        backgroundColor: Color(0xFFfdfbff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
      ),
      buttonTheme: const ButtonThemeData(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
      )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        sizeConstraints: BoxConstraints(minWidth: 64, minHeight: 64),
        extendedSizeConstraints: BoxConstraints(minHeight: 64),
      ),
      cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
        ),
        elevation: 0,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
      ),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF1a1b1f),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFa8c7ff),
        onPrimary: Color(0xFF002f66),
        secondary: Color(0xFFbec7dd),
        onSecondary: Color(0xFF283141),
        error: Color(0xFFffb4a9),
        onError: Color(0xFF680003),
        background: Color(0xFF1a1b1f),
        onBackground: Color(0xFFe3e2e6),
        surface: Color(0xFF1a1b1f),
        onSurface: Color(0xFFe3e2e6),
        tertiary: Color(0xFFdcbce0),
        onTertiary: Color(0xFF3f2845),
        primaryContainer: Color(0xFF004590),
        onPrimaryContainer: Color(0xFFd6e3ff),
        secondaryContainer: Color(0xFF3e4759),
        onSecondaryContainer: Color(0xFFdae3f9),
        tertiaryContainer: Color(0xFF573e5c),
        onTertiaryContainer: Color(0xFFf9d8fd),
      ),
    ),
    "Dark");

final greenTheme = GlobalTheme(
    ThemeData(
      dialogTheme: const DialogTheme(
        backgroundColor: Color(0xFFfdfbff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
      ),
      buttonTheme: const ButtonThemeData(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
      )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        sizeConstraints: BoxConstraints(minWidth: 64, minHeight: 64),
        extendedSizeConstraints: BoxConstraints(minHeight: 64),
      ),
      cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
        ),
        elevation: 0,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
      ),
      primaryColor: const Color(0xFF006d41),
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFfbfdf8),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF006d41),
        onPrimary: Color(0xFFffffff),
        secondary: Color(0xFF4e6355),
        onSecondary: Color(0xFFffffff),
        error: Color(0xFFba1b1b),
        onError: Color(0xFFffffff),
        background: Color(0xFFfbfdf8),
        onBackground: Color(0xFF191c1a),
        surface: Color(0xFFfbfdf8),
        onSurface: Color(0xFF191c1a),
        tertiary: Color(0xFF3b6471),
        onTertiary: Color(0xFFffffff),
        primaryContainer: Color(0xFFfbfdf8),
        onPrimaryContainer: Color(0xFF191c1a),
        secondaryContainer: Color(0xFFd1e8d6),
        onSecondaryContainer: Color(0xFF0c1f14),
        tertiaryContainer: Color(0xFFbfe9f8),
        onTertiaryContainer: Color(0xFF001f28),
      ),
    ),
    "Green");

final orangeTheme = GlobalTheme(
    ThemeData(
      dialogTheme: const DialogTheme(
        backgroundColor: Color(0xFFfdfbff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
      ),
      buttonTheme: const ButtonThemeData(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
      )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        sizeConstraints: BoxConstraints(minWidth: 64, minHeight: 64),
        extendedSizeConstraints: BoxConstraints(minHeight: 64),
      ),
      cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
        ),
        elevation: 0,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
      ),
      primaryColor: const Color(0xFFa83800),
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFfcfcfc),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFFa83800),
        onPrimary: Color(0xFFffffff),
        secondary: Color(0xFF77574b),
        onSecondary: Color(0xFFffffff),
        error: Color(0xFFba1b1b),
        onError: Color(0xFFffffff),
        background: Color(0xFFfcfcfc),
        onBackground: Color(0xFF201a18),
        surface: Color(0xFFfcfcfc),
        onSurface: Color(0xFF201a18),
        tertiary: Color(0xFF685e2f),
        onTertiary: Color(0xFFffffff),
        primaryContainer: Color(0xFFffdbcd),
        onPrimaryContainer: Color(0xFF380d00),
        secondaryContainer: Color(0xFFffdbcd),
        onSecondaryContainer: Color(0xFF2c160d),
        tertiaryContainer: Color(0xFFf1e2a7),
        onTertiaryContainer: Color(0xFF211b00),
      ),
    ),
    "DeepOrange");

final globalThemes = [
  defaultTheme,
  darkTheme,
  greenTheme,
  orangeTheme,
];

class Language {
  final String lang;
  final String name;

  Language(this.lang, this.name);
}

final globalLanguages = [
  Language("default", "Auto"),
  Language("zh_CN", "简体中文"),
  Language("en", "English")
];

const giteeBaseUrl = "https://gitee.com/";
