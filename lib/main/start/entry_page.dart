import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/start/splash.dart';
import 'package:flutter_gitee/utils/global_constant.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gitee",
      routes: routes,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale("en", ''),
        ...S.delegate.supportedLocales
      ],
      home: const Splash(),
    );
  }
}
