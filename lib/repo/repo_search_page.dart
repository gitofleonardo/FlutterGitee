import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/widget/inherited_search_widget.dart';
import 'package:flutter_gitee/repo/widget/repo_list_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RepoSearchPage extends StatefulWidget {
  const RepoSearchPage({Key? key}) : super(key: key);

  @override
  _RepoSearchPageState createState() => _RepoSearchPageState();
}

class _RepoSearchPageState extends State<RepoSearchPage>
    with AutomaticKeepAliveClientMixin {
  var _searchText = "";
  final _refreshController = RefreshController();
  final _resultItems = <RepositoryEntity>[];
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
    searchRepository(_searchText, _currentPage, _pageSize).then((value) {
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
    searchRepository(_searchText, _currentPage, _pageSize).then((value) {
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
          return RepoListItem(repo: _resultItems[index], onTap: () {});
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
