import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/repo/widget/repo_list_item.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserRepositoryPage extends StatefulWidget {
  final String username;
  const UserRepositoryPage({Key? key, required this.username})
      : super(key: key);

  @override
  _UserRepositoryPageState createState() => _UserRepositoryPageState();
}

class _UserRepositoryPageState extends BaseState<UserRepositoryPage> {
  final _refreshController = RefreshController();
  final _repos = <RepositoryEntity>[];
  var _hasMore = false;
  var _currentPage = 1;
  final _pageSize = 20;

  void _refresh() {
    setState(() {
      _hasMore = false;
    });
    _currentPage = 1;
    getUserRepos(widget.username, _currentPage, _pageSize).then((value) {
      if (value.success && value.data != null) {
        _refreshController.refreshCompleted();
        ++_currentPage;
        final data = value.data!;
        setState(() {
          if (data.length < _pageSize) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
          _repos.clear();
          _repos.addAll(data);
        });
      } else {
        _refreshController.refreshFailed();
      }
    });
  }

  void _loadMore() {
    getUserRepos(widget.username, _currentPage, _pageSize).then((value) {
      if (value.success && value.data != null) {
        _refreshController.loadComplete();
        ++_currentPage;
        final data = value.data!;
        setState(() {
          if (data.length < _pageSize) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
          _repos.addAll(data);
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
    return SmartRefresher(
      enablePullUp: _hasMore,
      enablePullDown: true,
      onLoading: _loadMore,
      onRefresh: _refresh,
      controller: _refreshController,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final item = _repos[index];
          return RepoListItem(
            repo: item,
            onTap: () {
              Navigator.pushNamed(
                context,
                "repository_detail_page",
                arguments: "${item.fullName}",
              );
            },
          );
        },
        itemCount: _repos.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
