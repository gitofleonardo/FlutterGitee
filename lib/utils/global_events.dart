import 'package:flutter_gitee/utils/global_constant.dart';

/// Event that stores current theme when global theme changed.
class ThemeEvent {
  final GlobalTheme theme;
  ThemeEvent(this.theme);
}

/// Event that stores current language when global language changed.
class LanguageEvent {
  final String lang;
  LanguageEvent(this.lang);
}

/// Event that stores current user's state when state changed.
class UserStateEvent {
  final UserState state;
  UserStateEvent(this.state);
}

enum UserState {
  /// when token expires
  tokenExpired
}