import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/user/bean/follow_result_entity.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FollowerPage extends StatefulWidget {
  final String user;
  const FollowerPage({Key? key, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FollowerPageState();
}

class _FollowerPageState extends BaseState<FollowerPage> {
  var _hasMore = true;
  var _currentPage = 0;
  final _refreshController = RefreshController();
  final _followers = <FollowResultEntity>[];
  final _pageSize = 10;

  void _fetchFollowers() {
    if (!_hasMore) {
      return;
    }
    getFollowers(page: _currentPage, perPage: _pageSize, user: widget.user)
        .then((value) {
      if (value.state == BaseStatus.success) {
        _refreshController.loadComplete();
        final result = value.data ?? [];
        setState(() {
          if (result.isEmpty) {
            _hasMore = false;
          }
          _followers.addAll(result);
        });
        ++_currentPage;
      } else {
        _refreshController.loadFailed();
      }
    });
  }

  void _refreshFollowers() {
    _hasMore = true;
    _currentPage = 0;
    getFollowers(page: _currentPage, perPage: _pageSize, user: widget.user)
        .then((value) {
      if (value.state == BaseStatus.success) {
        _refreshController.refreshCompleted();
        final result = value.data ?? [];
        setState(() {
          _followers.clear();
          if (result.isEmpty || result.length < _pageSize) {
            _hasMore = false;
          }
          _followers.addAll(result);
        });
        ++_currentPage;
      } else {
        _refreshController.refreshFailed();
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
        title: Text(S.of(context).followers),
      ),
      body: SmartRefresher(
        header: const WaterDropHeader(),
        onRefresh: _refreshFollowers,
        onLoading: _fetchFollowers,
        enablePullUp: _hasMore,
        enablePullDown: true,
        controller: _refreshController,
        child: ListView.builder(
          itemCount: _followers.length,
          itemBuilder: (context, index) {
            final cur = _followers[index];
            return ListTile(
              onTap: () {
                Navigator.pushNamed(context, "user_profile_page",
                    arguments: cur.login);
              },
              leading: SizedBox(
                width: 42,
                height: 42,
                child: ClipOval(
                  child: Image.network(
                    cur.avatarUrl.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              title: Text(cur.login.toString()),
            );
          },
        ),
      ),
    );
  }
}
