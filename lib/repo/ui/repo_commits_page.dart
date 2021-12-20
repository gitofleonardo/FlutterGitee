import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/bean/repo_commit_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/ui/repo_commit_detail_page.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RepoCommitsPage extends StatefulWidget {
  final String branch;
  final String fullName;

  const RepoCommitsPage(
      {Key? key, required this.branch, required this.fullName})
      : super(key: key);

  @override
  _RepoCommitsPageState createState() => _RepoCommitsPageState();
}

class _RepoCommitsPageState extends State<RepoCommitsPage> {
  final _refreshController = RefreshController();
  final _pageSize = 20;
  final _commits = <RepoCommitEntity>[];
  var _hasMore = false;
  var _currentPage = 1;

  void _refresh() {
    setState(() {
      _hasMore = false;
    });
    _currentPage = 1;
    getRepoCommits(widget.fullName, widget.branch, _currentPage, _pageSize)
        .then((value) {
      if (value.success) {
        ++_currentPage;
        _refreshController.refreshCompleted();
        final res = value.data ?? [];
        setState(() {
          if (res.length < _pageSize) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
          _commits.clear();
          _commits.addAll(res);
        });
      } else {
        _refreshController.refreshFailed();
      }
    });
  }

  void _loadMore() {
    getRepoCommits(widget.fullName, widget.branch, _currentPage, _pageSize)
        .then((value) {
      if (value.success) {
        ++_currentPage;
        _refreshController.loadComplete();
        final res = value.data ?? [];
        setState(() {
          if (res.length < _pageSize) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
          _commits.addAll(res);
        });
      } else {
        _refreshController.loadFailed();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _refreshController.requestRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GlobalThemeWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Commits-${widget.branch}"),
        ),
        body: SmartRefresher(
          header: const WaterDropHeader(),
          onLoading: _loadMore,
          onRefresh: _refresh,
          enablePullDown: true,
          enablePullUp: _hasMore,
          controller: _refreshController,
          child: ListView.builder(
              itemBuilder: (context, index) {
                final item = _commits[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RepoCommitDetailPage(
                          fullName: widget.fullName, sha: item.sha!);
                    }));
                  },
                  title: Text("${item.commit?.committer?.name}"),
                  subtitle: Text("${item.commit?.message}".trim()),
                  trailing:
                      Text(formatDate(item.commit?.committer?.date ?? '')),
                );
              },
              itemCount: _commits.length),
        ),
      ),
    );
  }
}
