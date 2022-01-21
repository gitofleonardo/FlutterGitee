import 'package:flutter_gitee/utils/global_constant.dart';

import '../user/bean/user_profile_entity.dart';

/// Event that stores current theme when global theme changed.
class ThemeEvent {
  final GlobalTheme theme;
  ThemeEvent(this.theme);
}

/// Event that stores current language when global language changed.
class LanguageEvent {
  final Language lang;
  LanguageEvent(this.lang);
}

/// Event that stores current user's state when state changed.
class UserStateEvent {
  final UserState state;
  UserStateEvent(this.state);
}

/// Profile change event
class ProfileEvent {
  final UserProfileEntity profile;
  ProfileEvent(this.profile);
}

enum UserState {
  /// when token expires
  tokenExpired,
}
