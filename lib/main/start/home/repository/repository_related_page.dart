import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/start/home/home_widget.dart';

import '../../../../widget/base_state.dart';

class RepositoryRelatedPage extends StatefulWidget implements HomeWidget {
  const RepositoryRelatedPage({Key? key}) : super(key: key);

  @override
  RepositoryRelatedPageState createState() => RepositoryRelatedPageState();

  @override
  Widget getIcon() {
    return const Icon(Icons.book);
  }

  @override
  String getText(BuildContext context) {
    return S.of(context).repository;
  }
}

class RepositoryRelatedPageState extends BaseState<RepositoryRelatedPage> {
  @override
  Widget create(BuildContext context) {
    return Container(
      child: Text("hello"),
    );
  }
}
