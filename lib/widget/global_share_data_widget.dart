import 'package:flutter/material.dart';
import 'package:flutter_gitee/utils/global_constant.dart';

class GlobalShareDataWidget extends InheritedWidget {
  final Widget chd;
  final GlobalTheme theme;
  const GlobalShareDataWidget(
      {Key? key, required this.theme, required this.chd})
      : super(key: key, child: chd);

  @override
  bool updateShouldNotify(covariant GlobalShareDataWidget oldWidget) {
    return oldWidget.theme != theme;
  }

  static GlobalShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GlobalShareDataWidget>();
  }
}
