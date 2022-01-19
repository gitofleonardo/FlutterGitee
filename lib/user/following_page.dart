import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'bean/follow_result_entity.dart';
import 'model/user_model.dart';

class FollowingPage extends StatefulWidget {
  final String user;
  const FollowingPage({Key? key, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FollowingPageState();
}

class FollowingStateEntity {
  final FollowResultEntity user;
  var deleting = false;
  FollowingStateEntity({required this.user});
}

class _FollowingPageState extends BaseState<FollowingPage> {
  var _hasMore = true;
  var _currentPage = 0;
  final _refreshController = RefreshController();
  final _followers = <FollowingStateEntity>[];
  final _pageSize = 10;

  void _fetchFollowings() {
    if (!_hasMore) {
      return;
    }
    getFollowings(page: _currentPage, perPage: _pageSize, user: widget.user)
        .then((value) {
      if (value.state == BaseStatus.success) {
        _refreshController.loadComplete();
        final result = value.data ?? [];
        setState(() {
          if (result.isEmpty) {
            _hasMore = false;
          }
          _followers.addAll(result.map((e) => FollowingStateEntity(user: e)));
        });
        ++_currentPage;
      } else {
        _refreshController.loadFailed();
      }
    });
  }

  void _refreshFollowings() {
    _hasMore = true;
    _currentPage = 0;
    getFollowings(page: _currentPage, perPage: _pageSize, user: widget.user)
        .then((value) {
      if (value.state == BaseStatus.success) {
        _refreshController.refreshCompleted();
        final result = value.data ?? [];
        setState(() {
          _followers.clear();
          if (result.isEmpty || result.length < _pageSize) {
            _hasMore = false;
          }
          _followers.addAll(result.map((e) => FollowingStateEntity(user: e)));
        });
        ++_currentPage;
      } else {
        _refreshController.refreshFailed();
      }
    });
  }

  Future<BaseResult> _unfollowUser(String user) async {
    return unfollow(user: user);
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
        title: Text(S.of(context).followings),
      ),
      body: SmartRefresher(
        onRefresh: _refreshFollowings,
        onLoading: _fetchFollowings,
        enablePullUp: _hasMore,
        enablePullDown: true,
        controller: _refreshController,
        child: ListView.builder(
          itemCount: _followers.length,
          itemBuilder: (context, index) {
            final item = _followers[index];
            final cur = _followers[index].user;
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
              trailing: LayoutBuilder(builder: (context, constraint) {
                if (item.deleting) {
                  return const SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                }
                return TextButton(
                  child: Text(S.of(context).unfollow),
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(S.of(context).confirmUnfollow),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(S.of(context).cancel)),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      _followers[index].deleting = true;
                                    });
                                    _unfollowUser(cur.login.toString())
                                        .then((value) {
                                      if (value.state == BaseStatus.success) {
                                        _refreshController.requestRefresh();
                                      } else {
                                        String err = value.state ==
                                                BaseStatus.networkFailure
                                            ? S.of(context).networkError
                                            : S.of(context).error;
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                                SnackBar(content: Text(err)));
                                      }
                                    });
                                  },
                                  child: Text(S.of(context).confirm)),
                            ],
                          );
                        });
                  },
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
