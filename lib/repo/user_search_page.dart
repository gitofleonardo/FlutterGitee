import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/widget/inherited_search_widget.dart';
import 'package:flutter_gitee/repo/widget/user_list_item.dart';
import 'package:flutter_gitee/user/bean/result/success/user_profile_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserSearchPage extends StatefulWidget {
  const UserSearchPage({Key? key}) : super(key: key);

  @override
  _UserSearchPageState createState() => _UserSearchPageState();
}

class _UserSearchPageState extends State<UserSearchPage>
    with AutomaticKeepAliveClientMixin {
  var _searchText = "";
  final _refreshController = RefreshController();
  final _resultItems = <UserProfileEntity>[];
  var _hasMore = false;
  final _pageSize = 20;
  var _currentPage = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final st = InheritedSearchWidget.of(context)?.searchText ?? "";
    if (st.isNotEmpty) {
      setState(() {
        _searchText = st;
      });
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        _refreshController.requestRefresh();
      });
    }
  }

  void _refresh() {
    setState(() {
      _hasMore = false;
    });
    _currentPage = 1;
    searchUser(_searchText, _currentPage, _pageSize).then((value) {
      if (value.success) {
        ++_currentPage;
        _refreshController.refreshCompleted();
        final items = value.data ?? [];
        setState(() {
          if (items.isEmpty || items.length < _pageSize) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
          _resultItems.clear();
          _resultItems.addAll(items);
        });
      } else {
        _refreshController.refreshFailed();
      }
    });
  }

  void _loadMore() {
    searchUser(_searchText, _currentPage, _pageSize).then((value) {
      if (value.success) {
        ++_currentPage;
        _refreshController.loadComplete();
        final items = value.data ?? [];
        setState(() {
          if (items.isEmpty) {
            _hasMore = false;
          }
          _resultItems.addAll(items);
        });
      } else {
        _refreshController.refreshFailed();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SmartRefresher(
      enablePullUp: _hasMore,
      enablePullDown: _searchText.isNotEmpty,
      header: const WaterDropHeader(),
      controller: _refreshController,
      onRefresh: _refresh,
      onLoading: _loadMore,
      child: ListView.builder(
        itemCount: _resultItems.length,
        itemBuilder: (context, index) {
          return UserListItem(
              user: _resultItems[index],
              onTap: () {
                Navigator.pushNamed(context, "user_profile_page",
                    arguments: _resultItems[index].login);
              });
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
