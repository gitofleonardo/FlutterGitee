import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/widget/repo_list_item.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RepoForksPage extends StatefulWidget {
  final String fullName;

  const RepoForksPage({Key? key, required this.fullName}) : super(key: key);

  @override
  _RepoForksPageState createState() => _RepoForksPageState();
}

class _RepoForksPageState extends BaseState<RepoForksPage> {
  final _refreshController = RefreshController();
  var _hasMore = false;
  final _pageSize = 20;
  var _currentPage = 1;
  final _users = <RepositoryEntity>[];

  void _refreshPage() {
    setState(() {
      _hasMore = false;
    });
    _currentPage = 1;
    getRepoForks(widget.fullName, _currentPage, _pageSize).then((value) {
      if (value.success) {
        _refreshController.refreshCompleted();
        final res = value.data ?? [];
        ++_currentPage;
        setState(() {
          _users.clear();
          _users.addAll(res);
          if (res.length < _pageSize) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
        });
      } else {
        _refreshController.refreshFailed();
      }
    });
  }

  void _loadMore() {
    getRepoForks(widget.fullName, _currentPage, _pageSize).then((value) {
      if (value.success) {
        _refreshController.loadComplete();
        final res = value.data ?? [];
        ++_currentPage;
        setState(() {
          _users.addAll(res);
          if (res.length < _pageSize) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
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
  Widget create(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).fork),
      ),
      body: SmartRefresher(
        onRefresh: _refreshPage,
        onLoading: _loadMore,
        enablePullUp: _hasMore,
        enablePullDown: true,
        header: const WaterDropHeader(),
        controller: _refreshController,
        child: ListView.builder(
            itemBuilder: (context, index) {
              final item = _users[index];
              return RepoListItem(
                  repo: item,
                  onTap: () {
                    Navigator.pushNamed(context, "repository_detail_page",
                        arguments: item.fullName);
                  });
            },
            itemCount: _users.length),
      ),
    );
  }
}
