import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/start/splash.dart';
import 'package:flutter_gitee/utils/global_constant.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gitee",
      routes: routes,
      home: const Splash(),
    );
  }
}
