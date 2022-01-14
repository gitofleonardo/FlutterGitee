import 'package:event_bus/event_bus.dart';
import 'package:flutter_gitee/user/bean/user_profile_entity.dart';
import 'package:flutter_gitee/utils/global_constant.dart';

/// Current interface theme
GlobalTheme? globalTheme;

/// Current language
String? globalLanguage;

/// User's access_token
String? globalToken;

/// Refresh token, used to refresh current expired token
/// to avoid re-login
String? globalRefreshToken;

/// User's personal profile
UserProfileEntity? globalProfile;


/// Eventbus for notifying global events, e.g theme change, language change, route to login
final globalEventBus = EventBus();