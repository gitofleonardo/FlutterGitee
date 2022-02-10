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
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, b) {
          return [
            SliverAppBar(
              backgroundColor: theme.theme.colorScheme.primaryContainer,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  S.of(context).repository,
                  style: TextStyle(
                      color: theme.theme.colorScheme.onPrimaryContainer),
                ),
              ),
              expandedHeight: 100,
              pinned: true,
            )
          ];
        },
        body: ListView(
          children: [
            _createItem(
              S.of(context).myRepository,
              () {
                Navigator.pushNamed(context, "my_repository_page");
              },
            ),
            _createItem(
              S.of(context).starredRepository,
              () {
                Navigator.pushNamed(context, "starred_repository_page");
              },
            ),
            _createItem(
              S.of(context).watchedRepository,
              () {
                Navigator.pushNamed(context, "watched_repository_page");
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _createItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Card(
        color: theme.theme.colorScheme.primaryContainer,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: theme.theme.colorScheme.onPrimaryContainer),
                  ),
                ),
                Icon(
                  Icons.arrow_right,
                  color: theme.theme.colorScheme.onPrimaryContainer,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
