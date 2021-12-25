import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/user/bean/user_profile_entity.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RepoStargazersPage extends StatefulWidget {
  final String fullName;

  const RepoStargazersPage({Key? key, required this.fullName})
      : super(key: key);

  @override
  _RepoStargazersPageState createState() => _RepoStargazersPageState();
}

class _RepoStargazersPageState extends State<RepoStargazersPage> {
  final _refreshController = RefreshController();
  var _hasMore = false;
  final _pageSize = 20;
  var _currentPage = 1;
  final _users = <UserProfileEntity>[];

  void _refreshPage() {
    setState(() {
      _hasMore = false;
    });
    _currentPage = 1;
    getStargazers(widget.fullName, _currentPage, _pageSize).then((value) {
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
    getStargazers(widget.fullName, _currentPage, _pageSize).then((value) {
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
  Widget build(BuildContext context) {
    return GlobalThemeWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Stargazers"),
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
                return ListTile(
                  leading: ClipOval(
                    child: Image.network(
                      "${item.avatarUrl}",
                      width: 42,
                      height: 42,
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text("${item.login}"),
                  onTap: () {
                    Navigator.pushNamed(context, "user_profile_page",
                        arguments: item.login);
                  },
                );
              },
              itemCount: _users.length),
        ),
      ),
    );
  }
}
