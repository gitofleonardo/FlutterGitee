import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/user/bean/public_key_entity.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserPublicKeysPage extends StatefulWidget {
  final String username;
  const UserPublicKeysPage({Key? key, required this.username})
      : super(key: key);

  @override
  _UserPublicKeysPageState createState() => _UserPublicKeysPageState();
}

class _UserPublicKeysPageState extends BaseState<UserPublicKeysPage> {
  final _refreshController = RefreshController();
  bool _hasMore = false;
  final _keys = <PublicKeyEntity>[];
  int _currentPage = 1;
  final int _pageSize = 20;

  void _refresh() {
    _currentPage = 1;
    setState(() {
      _hasMore = false;
    });
    getUserPublicKeys(widget.username, _currentPage, _pageSize).then((value) {
      if (value.success) {
        _refreshController.refreshCompleted();
        ++_currentPage;
        final data = value.data ?? [];
        setState(() {
          if (data.length < _pageSize) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
          _keys.clear();
          _keys.addAll(data);
        });
      } else {
        _refreshController.refreshFailed();
      }
    });
  }

  void _loadMore() {
    getUserPublicKeys(widget.username, _currentPage, _pageSize).then((value) {
      if (value.success) {
        _refreshController.loadComplete();
        ++_currentPage;
        final data = value.data ?? [];
        setState(() {
          if (data.length < _pageSize) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
          _keys.addAll(data);
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
        title: Text(S.of(context).myPublicKeys),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onLoading: _loadMore,
        onRefresh: _refresh,
        enablePullDown: true,
        enablePullUp: _hasMore,
        child: ListView.builder(
          itemBuilder: (context, index) {
            final item = _keys[index];
            return ListTile(
              title: Flex(
                direction: Axis.horizontal,
                children: [
                  Text("ID: ${item.id}"),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: item.key));
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(S.of(context).copied)));
                      },
                      icon: const Icon(Icons.copy)),
                ],
              ),
              subtitle: Text(
                "${item.key}",
                maxLines: item.expanded ? null : 2,
              ),
              onTap: () {
                setState(() {
                  item.expanded = !item.expanded;
                });
              },
            );
          },
          itemCount: _keys.length,
        ),
      ),
    );
  }
}
