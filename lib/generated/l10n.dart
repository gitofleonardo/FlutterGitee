// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Tap To Retry`
  String get tapToRetry {
    return Intl.message(
      'Tap To Retry',
      name: 'tapToRetry',
      desc: '',
      args: [],
    );
  }

  /// `Copied`
  String get copied {
    return Intl.message(
      'Copied',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `Copy All`
  String get copyAll {
    return Intl.message(
      'Copy All',
      name: 'copyAll',
      desc: '',
      args: [],
    );
  }

  /// `View Picture`
  String get viewPicture {
    return Intl.message(
      'View Picture',
      name: 'viewPicture',
      desc: '',
      args: [],
    );
  }

  /// `Password Login`
  String get passwordLogin {
    return Intl.message(
      'Password Login',
      name: 'passwordLogin',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get events {
    return Intl.message(
      'Events',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `Followings`
  String get followings {
    return Intl.message(
      'Followings',
      name: 'followings',
      desc: '',
      args: [],
    );
  }

  /// `Repository`
  String get repository {
    return Intl.message(
      'Repository',
      name: 'repository',
      desc: '',
      args: [],
    );
  }

  /// `My Repository`
  String get myRepository {
    return Intl.message(
      'My Repository',
      name: 'myRepository',
      desc: '',
      args: [],
    );
  }

  /// `Starred Repository`
  String get starredRepository {
    return Intl.message(
      'Starred Repository',
      name: 'starredRepository',
      desc: '',
      args: [],
    );
  }

  /// `Watched Repository`
  String get watchedRepository {
    return Intl.message(
      'Watched Repository',
      name: 'watchedRepository',
      desc: '',
      args: [],
    );
  }

  /// `Issues`
  String get issues {
    return Intl.message(
      'Issues',
      name: 'issues',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Logout`
  String get confirmLogout {
    return Intl.message(
      'Confirm Logout',
      name: 'confirmLogout',
      desc: '',
      args: [],
    );
  }

  /// `YES`
  String get yes {
    return Intl.message(
      'YES',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `NO`
  String get no {
    return Intl.message(
      'NO',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Followed`
  String get followed {
    return Intl.message(
      'Followed',
      name: 'followed',
      desc: '',
      args: [],
    );
  }

  /// `Starred`
  String get starred {
    return Intl.message(
      'Starred',
      name: 'starred',
      desc: '',
      args: [],
    );
  }

  /// `Push To`
  String get pushTo {
    return Intl.message(
      'Push To',
      name: 'pushTo',
      desc: '',
      args: [],
    );
  }

  /// `Created`
  String get created {
    return Intl.message(
      'Created',
      name: 'created',
      desc: '',
      args: [],
    );
  }

  /// `Created Issue`
  String get createdIssue {
    return Intl.message(
      'Created Issue',
      name: 'createdIssue',
      desc: '',
      args: [],
    );
  }

  /// `Comment On Issue`
  String get commentOnIssue {
    return Intl.message(
      'Comment On Issue',
      name: 'commentOnIssue',
      desc: '',
      args: [],
    );
  }

  /// `Themes`
  String get themes {
    return Intl.message(
      'Themes',
      name: 'themes',
      desc: '',
      args: [],
    );
  }

  /// `Terms Of Use`
  String get termsOfUse {
    return Intl.message(
      'Terms Of Use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `About Gitee`
  String get aboutGitee {
    return Intl.message(
      'About Gitee',
      name: 'aboutGitee',
      desc: '',
      args: [],
    );
  }

  /// `About Project`
  String get aboutProject {
    return Intl.message(
      'About Project',
      name: 'aboutProject',
      desc: '',
      args: [],
    );
  }

  /// `Open Project`
  String get openProject {
    return Intl.message(
      'Open Project',
      name: 'openProject',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Text`
  String get text {
    return Intl.message(
      'Text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `Markdown`
  String get markdown {
    return Intl.message(
      'Markdown',
      name: 'markdown',
      desc: '',
      args: [],
    );
  }

  /// `Image`
  String get image {
    return Intl.message(
      'Image',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `Token Expired`
  String get tokenExpired {
    return Intl.message(
      'Token Expired',
      name: 'tokenExpired',
      desc: '',
      args: [],
    );
  }

  /// `Open In Browser`
  String get openInBrowser {
    return Intl.message(
      'Open In Browser',
      name: 'openInBrowser',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get sort {
    return Intl.message(
      'Sort',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Fork`
  String get fork {
    return Intl.message(
      'Fork',
      name: 'fork',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Search repository, user or issue`
  String get searchPageTips {
    return Intl.message(
      'Search repository, user or issue',
      name: 'searchPageTips',
      desc: '',
      args: [],
    );
  }

  /// `Search text is empty`
  String get searchTextEmpty {
    return Intl.message(
      'Search text is empty',
      name: 'searchTextEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Issue Filter`
  String get issueFilter {
    return Intl.message(
      'Issue Filter',
      name: 'issueFilter',
      desc: '',
      args: [],
    );
  }

  /// `Creation Time`
  String get creationTime {
    return Intl.message(
      'Creation Time',
      name: 'creationTime',
      desc: '',
      args: [],
    );
  }

  /// `Update Time`
  String get updateTime {
    return Intl.message(
      'Update Time',
      name: 'updateTime',
      desc: '',
      args: [],
    );
  }

  /// `Notes Count`
  String get notesCount {
    return Intl.message(
      'Notes Count',
      name: 'notesCount',
      desc: '',
      args: [],
    );
  }

  /// `Progressing`
  String get progressing {
    return Intl.message(
      'Progressing',
      name: 'progressing',
      desc: '',
      args: [],
    );
  }

  /// `Closed`
  String get closed {
    return Intl.message(
      'Closed',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get rejected {
    return Intl.message(
      'Rejected',
      name: 'rejected',
      desc: '',
      args: [],
    );
  }

  /// `Ascending`
  String get ascending {
    return Intl.message(
      'Ascending',
      name: 'ascending',
      desc: '',
      args: [],
    );
  }

  /// `Descending`
  String get descending {
    return Intl.message(
      'Descending',
      name: 'descending',
      desc: '',
      args: [],
    );
  }

  /// `User Filter`
  String get userFilter {
    return Intl.message(
      'User Filter',
      name: 'userFilter',
      desc: '',
      args: [],
    );
  }

  /// `Join Gitee Time`
  String get joinGiteeTime {
    return Intl.message(
      'Join Gitee Time',
      name: 'joinGiteeTime',
      desc: '',
      args: [],
    );
  }

  /// `Last Push Time`
  String get lastPushTime {
    return Intl.message(
      'Last Push Time',
      name: 'lastPushTime',
      desc: '',
      args: [],
    );
  }

  /// `Stars Count`
  String get starsCount {
    return Intl.message(
      'Stars Count',
      name: 'starsCount',
      desc: '',
      args: [],
    );
  }

  /// `Forks Count`
  String get forksCount {
    return Intl.message(
      'Forks Count',
      name: 'forksCount',
      desc: '',
      args: [],
    );
  }

  /// `WatchesCount`
  String get watchesCount {
    return Intl.message(
      'WatchesCount',
      name: 'watchesCount',
      desc: '',
      args: [],
    );
  }

  /// `Repository Filter`
  String get repositoryFilter {
    return Intl.message(
      'Repository Filter',
      name: 'repositoryFilter',
      desc: '',
      args: [],
    );
  }

  /// `Text cannot be empty`
  String get textCannotBeEmpty {
    return Intl.message(
      'Text cannot be empty',
      name: 'textCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Comment sent`
  String get commentSent {
    return Intl.message(
      'Comment sent',
      name: 'commentSent',
      desc: '',
      args: [],
    );
  }

  /// `Fail sending comment`
  String get failSendingComment {
    return Intl.message(
      'Fail sending comment',
      name: 'failSendingComment',
      desc: '',
      args: [],
    );
  }

  /// `Comment Order`
  String get commentOrder {
    return Intl.message(
      'Comment Order',
      name: 'commentOrder',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Say something`
  String get saySomething {
    return Intl.message(
      'Say something',
      name: 'saySomething',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Issue Details`
  String get issueDetails {
    return Intl.message(
      'Issue Details',
      name: 'issueDetails',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `My Issues`
  String get myIssues {
    return Intl.message(
      'My Issues',
      name: 'myIssues',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Assigned`
  String get assigned {
    return Intl.message(
      'Assigned',
      name: 'assigned',
      desc: '',
      args: [],
    );
  }

  /// `Created`
  String get myCreated {
    return Intl.message(
      'Created',
      name: 'myCreated',
      desc: '',
      args: [],
    );
  }

  /// `Repository Type`
  String get repositoryType {
    return Intl.message(
      'Repository Type',
      name: 'repositoryType',
      desc: '',
      args: [],
    );
  }

  /// `Member`
  String get member {
    return Intl.message(
      'Member',
      name: 'member',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get owner {
    return Intl.message(
      'Owner',
      name: 'owner',
      desc: '',
      args: [],
    );
  }

  /// `Personal`
  String get personal {
    return Intl.message(
      'Personal',
      name: 'personal',
      desc: '',
      args: [],
    );
  }

  /// `Private`
  String get private {
    return Intl.message(
      'Private',
      name: 'private',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get public {
    return Intl.message(
      'Public',
      name: 'public',
      desc: '',
      args: [],
    );
  }

  /// `All repositories`
  String get repoAllDesc {
    return Intl.message(
      'All repositories',
      name: 'repoAllDesc',
      desc: '',
      args: [],
    );
  }

  /// `You are the member of the repositories`
  String get repoMemberDesc {
    return Intl.message(
      'You are the member of the repositories',
      name: 'repoMemberDesc',
      desc: '',
      args: [],
    );
  }

  /// `You are the owner of the repositories`
  String get repoOwnerDesc {
    return Intl.message(
      'You are the owner of the repositories',
      name: 'repoOwnerDesc',
      desc: '',
      args: [],
    );
  }

  /// `Your personal repositories`
  String get repoPersonalDesc {
    return Intl.message(
      'Your personal repositories',
      name: 'repoPersonalDesc',
      desc: '',
      args: [],
    );
  }

  /// `Private repositories`
  String get repoPrivateDesc {
    return Intl.message(
      'Private repositories',
      name: 'repoPrivateDesc',
      desc: '',
      args: [],
    );
  }

  /// `Public repositories`
  String get repoPublicDesc {
    return Intl.message(
      'Public repositories',
      name: 'repoPublicDesc',
      desc: '',
      args: [],
    );
  }

  /// `Collaborators`
  String get collaborators {
    return Intl.message(
      'Collaborators',
      name: 'collaborators',
      desc: '',
      args: [],
    );
  }

  /// `Commit`
  String get commit {
    return Intl.message(
      'Commit',
      name: 'commit',
      desc: '',
      args: [],
    );
  }

  /// `Hash`
  String get hash {
    return Intl.message(
      'Hash',
      name: 'hash',
      desc: '',
      args: [],
    );
  }

  /// `Author`
  String get author {
    return Intl.message(
      'Author',
      name: 'author',
      desc: '',
      args: [],
    );
  }

  /// `Commit Time`
  String get commitTime {
    return Intl.message(
      'Commit Time',
      name: 'commitTime',
      desc: '',
      args: [],
    );
  }

  /// `Merged`
  String get merged {
    return Intl.message(
      'Merged',
      name: 'merged',
      desc: '',
      args: [],
    );
  }

  /// `Popularity`
  String get popularity {
    return Intl.message(
      'Popularity',
      name: 'popularity',
      desc: '',
      args: [],
    );
  }

  /// `Long Running`
  String get longRunning {
    return Intl.message(
      'Long Running',
      name: 'longRunning',
      desc: '',
      args: [],
    );
  }

  /// `Pull Request`
  String get pullRequest {
    return Intl.message(
      'Pull Request',
      name: 'pullRequest',
      desc: '',
      args: [],
    );
  }

  /// `Releases`
  String get releases {
    return Intl.message(
      'Releases',
      name: 'releases',
      desc: '',
      args: [],
    );
  }

  /// `Download Source Code`
  String get downloadSourceCode {
    return Intl.message(
      'Download Source Code',
      name: 'downloadSourceCode',
      desc: '',
      args: [],
    );
  }

  /// `Stargazers`
  String get stargazers {
    return Intl.message(
      'Stargazers',
      name: 'stargazers',
      desc: '',
      args: [],
    );
  }

  /// `Watchers`
  String get watchers {
    return Intl.message(
      'Watchers',
      name: 'watchers',
      desc: '',
      args: [],
    );
  }

  /// `Star`
  String get star {
    return Intl.message(
      'Star',
      name: 'star',
      desc: '',
      args: [],
    );
  }

  /// `Source Code`
  String get sourceCode {
    return Intl.message(
      'Source Code',
      name: 'sourceCode',
      desc: '',
      args: [],
    );
  }

  /// `Commits`
  String get commits {
    return Intl.message(
      'Commits',
      name: 'commits',
      desc: '',
      args: [],
    );
  }

  /// `Select Branch`
  String get selectBranch {
    return Intl.message(
      'Select Branch',
      name: 'selectBranch',
      desc: '',
      args: [],
    );
  }

  /// `License`
  String get license {
    return Intl.message(
      'License',
      name: 'license',
      desc: '',
      args: [],
    );
  }

  /// `Unfollow`
  String get unfollow {
    return Intl.message(
      'Unfollow',
      name: 'unfollow',
      desc: '',
      args: [],
    );
  }

  /// `Confirm to unfollow`
  String get confirmUnfollow {
    return Intl.message(
      'Confirm to unfollow',
      name: 'confirmUnfollow',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Network Error`
  String get networkError {
    return Intl.message(
      'Network Error',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Login To Gitee`
  String get loginToGitee {
    return Intl.message(
      'Login To Gitee',
      name: 'loginToGitee',
      desc: '',
      args: [],
    );
  }

  /// `Wrong account or passowrd`
  String get wrongAccountOrPwd {
    return Intl.message(
      'Wrong account or passowrd',
      name: 'wrongAccountOrPwd',
      desc: '',
      args: [],
    );
  }

  /// `Login Error`
  String get loginError {
    return Intl.message(
      'Login Error',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Username/Email/Phone`
  String get usernameEmailPhone {
    return Intl.message(
      'Username/Email/Phone',
      name: 'usernameEmailPhone',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot be empty`
  String get usernameCannotBeEmpty {
    return Intl.message(
      'Username cannot be empty',
      name: 'usernameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterPwdHint {
    return Intl.message(
      'Enter your password',
      name: 'enterPwdHint',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get pwdCannotBeEmpty {
    return Intl.message(
      'Password cannot be empty',
      name: 'pwdCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `User Profile`
  String get userProfile {
    return Intl.message(
      'User Profile',
      name: 'userProfile',
      desc: '',
      args: [],
    );
  }

  /// `Bio`
  String get bio {
    return Intl.message(
      'Bio',
      name: 'bio',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message(
      'Empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get company {
    return Intl.message(
      'Company',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `Blog`
  String get blog {
    return Intl.message(
      'Blog',
      name: 'blog',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message(
      'Follow',
      name: 'follow',
      desc: '',
      args: [],
    );
  }

  /// `Options`
  String get options {
    return Intl.message(
      'Options',
      name: 'options',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get messages {
    return Intl.message(
      'Messages',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Message Type`
  String get messageType {
    return Intl.message(
      'Message Type',
      name: 'messageType',
      desc: '',
      args: [],
    );
  }

  /// `Private Message`
  String get privateMessage {
    return Intl.message(
      'Private Message',
      name: 'privateMessage',
      desc: '',
      args: [],
    );
  }

  /// `Notification Message`
  String get notificationMessage {
    return Intl.message(
      'Notification Message',
      name: 'notificationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Refer Message`
  String get referMessage {
    return Intl.message(
      'Refer Message',
      name: 'referMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
