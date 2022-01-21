import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/start/entry_page.dart';
import 'package:flutter_gitee/utils/global_constant.dart';
import 'package:flutter_gitee/utils/global_context.dart';
import 'package:flutter_gitee/utils/global_events.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/global_share_data_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late final StreamSubscription _themeSubscription;
  late final StreamSubscription _languageSubscription;
  late final StreamSubscription _userStateSubscription;

  late GlobalTheme _currentTheme;
  late Language _currentLanguage;

  GlobalTheme get theme {
    return _currentTheme;
  }

  set theme(GlobalTheme t) {
    globalEventBus.fire(ThemeEvent(t));
    setCurrentTheme(t);
    setState(() {
      _currentTheme = t;
    });
  }

  Language get language {
    return _currentLanguage;
  }

  set language(Language lang) {
    if (lang.lang == "default") {
      Intl.defaultLocale = Localizations.localeOf(context).languageCode;
    } else {
      Intl.defaultLocale = lang.lang;
    }
    setCurrentLanguage(lang);
    globalEventBus.fire(LanguageEvent(lang));
    setState(() {
      _currentLanguage = lang;
    });
  }

  get isDarkTheme {
    return _currentTheme == darkTheme;
  }

  void _routeToLogin({bool showToast = true}) {
    // already clear local auth
    if (globalToken == null) {
      return;
    }
    if (showToast) {
      Fluttertoast.showToast(msg: S.of(context).tokenExpired);
    }
    clearLocalAuth().then((value) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const EntryPage();
      }), (route) => false);
    });
  }

  void logout() {
    _routeToLogin(showToast: false);
  }

  Widget create(BuildContext context);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GlobalShareDataWidget(
      widget: AnimatedTheme(
        data: _currentTheme.theme,
        child: Builder(
          builder: (context) {
            return create(context);
          },
        ),
      ),
      language: _currentLanguage.lang,
      theme: _currentTheme,
    );
  }

  @override
  void initState() {
    super.initState();
    // load global configurations
    _loadTheme();
    _loadLanguage();
    // subscribe to event bus
    _themeSubscription = globalEventBus.on<ThemeEvent>().listen((event) {
      setState(() {
        _currentTheme = event.theme;
      });
    });
    _languageSubscription = globalEventBus.on<LanguageEvent>().listen((event) {
      setState(() {
        _currentLanguage = event.lang;
      });
    });
    _userStateSubscription =
        globalEventBus.on<UserStateEvent>().listen((event) {
      _routeToLogin(showToast: true);
    });
  }

  void _loadTheme() {
    if (globalTheme != null) {
      _currentTheme = globalTheme!;
    } else {
      _currentTheme = defaultTheme;
      getCurrentTheme().then((value) {
        globalTheme = value;
        setState(() {
          _currentTheme = value;
        });
      });
    }
  }

  void _loadLanguage() {
    if (globalLanguage != null) {
      _currentLanguage = globalLanguage!;
    } else {
      _currentLanguage = defaultLanguage;
      getCurrentLanguage().then((value) {
        globalLanguage = value;
        setState(() {
          _currentLanguage = value;
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _themeSubscription.cancel();
    _languageSubscription.cancel();
    _userStateSubscription.cancel();
  }

  @override
  bool get wantKeepAlive => false;
}
