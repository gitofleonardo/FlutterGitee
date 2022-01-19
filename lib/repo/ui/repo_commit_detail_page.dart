import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/main/base/widget/general_bottom_sheet_header.dart';
import 'package:flutter_gitee/repo/bean/commit_detail_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/widget/repo_commit_file_page.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/base_state.dart';

class RepoCommitDetailPage extends StatefulWidget {
  final String fullName;
  final String sha;
  const RepoCommitDetailPage(
      {Key? key, required this.fullName, required this.sha})
      : super(key: key);

  @override
  _RepoCommitDetailPageState createState() => _RepoCommitDetailPageState();
}

class _RepoCommitDetailPageState extends BaseState<RepoCommitDetailPage> {
  final _pageController = PageController();
  CommitDetailEntity? _commit;

  Future<BaseResult<CommitDetailEntity>> _getCommitDetail() {
    return getRepoCommitDetail(widget.fullName, widget.sha);
  }

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).commit),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showInfoBottomSheet(context);
        },
        child: const Icon(
          Icons.menu,
        ),
      ),
      body: FutureBuilder<BaseResult<CommitDetailEntity>>(
        future: _getCommitDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data?.success ?? false) {
              _commit = snapshot.data?.data;
              return CustomScrollView(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                slivers: _createFilePages(_commit?.files ?? []),
              );
            } else {
              return TapToRetryWidget(
                  onTap: () {
                    setState(() {});
                  },
                  message: S.of(context).tapToRetry);
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  List<Widget> _createFilePages(List<CommitDetailFiles> files) {
    return files
        .expand((e) => [
              SliverPersistentHeader(
                  delegate:
                      _CommitFilenameSliverHeaderDelegate("${e.filename}")),
              RepoCommitFilePage(file: e)
            ])
        .toList();
  }

  void _showInfoBottomSheet(BuildContext context) {
    if (_commit == null) {
      return;
    }
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return HeaderContentBottomSheet(
              contentScrollable: true,
              title: S.of(context).about,
              body: Column(
                children: [
                  ListTile(
                    title: Text(S.of(context).hash),
                    subtitle: Text("${_commit?.sha}"),
                  ),
                  ListTile(
                    title: Text(S.of(context).author),
                    subtitle: Text("${_commit?.commit?.author?.name}"),
                  ),
                  ListTile(
                    title: Text(S.of(context).commitTime),
                    subtitle: Text(
                        formatDate(_commit?.commit?.committer?.date ?? "")),
                  )
                ],
              ));
        },
        isScrollControlled: true,
        shape: bottomSheetShape);
  }
}

class _CommitFilenameSliverHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final String name;

  _CommitFilenameSliverHeaderDelegate(this.name);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return DecoratedBox(
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer),
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 64;

  @override
  double get minExtent => 64;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return (oldDelegate as _CommitFilenameSliverHeaderDelegate).name != name;
  }
}
