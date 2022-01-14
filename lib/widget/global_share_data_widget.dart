import 'package:flutter/material.dart';
import 'package:flutter_gitee/utils/global_constant.dart';

class GlobalShareDataWidget extends InheritedWidget {
  final Widget widget;
  final GlobalTheme theme;
  final String language;
  const GlobalShareDataWidget(
      {Key? key, required this.theme, required this.widget, required this.language})
      : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant GlobalShareDataWidget oldWidget) {
    return oldWidget.theme != theme || oldWidget.language != language;
  }

  static GlobalShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GlobalShareDataWidget>();
  }
}
