import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/bean/commit_detail_entity.dart';

class RepoCommitFilePage extends StatelessWidget {
  final CommitDetailFiles file;

  const RepoCommitFilePage({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dat = file.xPatch?.split("\n") ?? [];
    final children = dat.map((e) {
      final Color color;
      if (e.startsWith("+")) {
        color = Colors.green;
      } else if (e.startsWith("-")) {
        color = Colors.red;
      } else {
        color = Colors.transparent;
      }
      return Container(
        decoration: BoxDecoration(color: color),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Text(e),
      );
    }).toList();
    final _delegate = SliverChildListDelegate(children);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      sliver: SliverList(
        delegate: _delegate,
      ),
    );
  }
}
