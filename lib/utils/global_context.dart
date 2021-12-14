import 'package:flutter_gitee/user/bean/result/success/user_profile_entity.dart';
import 'package:flutter_gitee/utils/global_constant.dart';

/// Current interface theme
GlobalTheme? globalTheme;

/// User's access_token
String? globalToken;

/// Refresh token, used to refresh current expired token
/// to avoid re-login
String? globalRefreshToken;

/// User's personal profile
UserProfileEntity? globalProfile;
