import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gitee/repo/attrs/filter_attrs.dart';
import 'package:flutter_gitee/repo/bean/issue_result_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/search/search_page.dart';
import 'package:flutter_gitee/repo/ui/issue_detail_page.dart';
import 'package:flutter_gitee/repo/widget/inherited_search_widget.dart';
import 'package:flutter_gitee/repo/widget/issue_list_item.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class IssueSearchPage extends StatefulWidget {
  const IssueSearchPage({Key? key}) : super(key: key);

  @override
  _IssueSearchPageState createState() => _IssueSearchPageState();
}

class _IssueSearchPageState extends BaseState<IssueSearchPage> {
  var _searchText = "";
  final _refreshController = RefreshController();
  final _resultItems = <IssueResultEntity>[];
  var _hasMore = false;
  final _pageSize = 20;
  var _currentPage = 1;
  var _filter = IssueFilter();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final showFab = _scrollController.position.userScrollDirection != ScrollDirection.reverse;
      SearchPage.of(context)?.toggleFloatingActionButton(!showFab);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final st = InheritedSearchWidget.of(context)?.searchText ?? "";
    if (st.isNotEmpty && st != _searchText) {
      setState(() {
        _searchText = st;
      });
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        _refreshController.requestRefresh();
      });
    }
    final filter =
        InheritedSearchWidget.of(context)?.issueFilter ?? IssueFilter();
    if (filter != _filter) {
      setState(() {
        _filter = filter;
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
    searchIssue(_searchText, _currentPage, _pageSize, filter: _filter)
        .then((value) {
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
    searchIssue(_searchText, _currentPage, _pageSize, filter: _filter)
        .then((value) {
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
  Widget create(BuildContext context) {
    super.build(context);
    return SmartRefresher(
      enablePullUp: _hasMore,
      enablePullDown: _searchText.isNotEmpty,
      controller: _refreshController,
      onRefresh: _refresh,
      onLoading: _loadMore,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _resultItems.length,
        itemBuilder: (context, index) {
          final item = _resultItems[index];
          return IssueListItem(
              issue: item,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return IssueDetailPage(
                      fullName: "${item.repository?.fullName}",
                      number: "${item.number}");
                }));
              });
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
