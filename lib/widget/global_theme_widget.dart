import 'package:flutter/material.dart';
import 'package:flutter_gitee/utils/global_constant.dart';
import 'package:flutter_gitee/utils/global_context.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/global_share_data_widget.dart';

class GlobalThemeWidget extends StatefulWidget {
  final Widget child;
  const GlobalThemeWidget({Key? key, required this.child}) : super(key: key);

  @override
  GlobalThemeWidgetState createState() => GlobalThemeWidgetState();
}

class GlobalThemeWidgetState extends State<GlobalThemeWidget> {
  var _currentTheme = globalThemes[0];

  @override
  void initState() {
    super.initState();
    if (globalTheme == null) {
      getCurrentTheme().then((value) {
        globalTheme = value;
        setState(() {
          _currentTheme = value;
        });
      });
    } else {
      setState(() {
        _currentTheme = globalTheme!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlobalShareDataWidget(
      theme: _currentTheme,
      chd: Theme(
        data: _currentTheme.theme,
        child: widget.child,
      ),
    );
  }

  void updateTheme(GlobalTheme theme) {
    setCurrentTheme(theme);
    setState(() {
      _currentTheme = theme;
    });
  }

  void navigateToLogin() {
    Navigator.popUntil(context, (route) => true);
    Navigator.pushNamed(context, "login_page");
  }

  static GlobalThemeWidgetState? of(BuildContext context) {
    return context.findRootAncestorStateOfType<GlobalThemeWidgetState>();
  }
}
