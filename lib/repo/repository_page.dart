import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/widget/general_bottom_sheet_header.dart';
import 'package:flutter_gitee/main/base/widget/my_radio_list_tile.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/widget/repo_list_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'attrs/filter_attrs.dart';

enum RepositoryType { star, watch }

class SortByItem {
  SortBy value;
  String title;
  SortByItem(this.value, this.title);
}

class SortDirectionItem {
  SortDirection value;
  String title;
  SortDirectionItem(this.value, this.title);
}

class RepositoryPage extends StatefulWidget {
  final RepositoryType type;

  const RepositoryPage({Key? key, required this.type}) : super(key: key);

  @override
  _RepositoryPageState createState() => _RepositoryPageState();
}

class _RepositoryPageState extends State<RepositoryPage> {
  final _refreshController = RefreshController();

  /// Start from 1, instead of 0
  var _currentPage = 1;
  var _hasMore = false;
  final _pageSize = 20;
  final _currentRepos = <RepositoryEntity>[];
  var _sortBy = SortBy.created;
  var _sortDirection = SortDirection.desc;
  final _sortByItems = [
    SortByItem(SortBy.created, "Creation Time"),
    SortByItem(SortBy.lastPush, "Last Push Time")
  ];
  final _sortDirectionItems = [
    SortDirectionItem(SortDirection.desc, "DESC"),
    SortDirectionItem(SortDirection.asc, "ASC")
  ];

  void _refreshPage() {
    _currentPage = 1;
    setState(() {
      _hasMore = false;
    });
    getRepository(
            page: _currentPage,
            perPage: _pageSize,
            type: widget.type,
            sortBy: _sortBy,
            direction: _sortDirection)
        .then((value) {
      if (value.state == BaseStatus.success) {
        _refreshController.refreshCompleted();
        final result = value.data ?? [];
        setState(() {
          if (result.length < _pageSize) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
          _currentRepos.clear();
          _currentRepos.addAll(result);
          ++_currentPage;
        });
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
  void didUpdateWidget(covariant RepositoryPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _currentRepos.clear();
    });
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _refreshController.requestRefresh();
    });
  }

  void _fetchMore() {
    getRepository(
            page: _currentPage++,
            perPage: _pageSize,
            type: widget.type,
            sortBy: _sortBy,
            direction: _sortDirection)
        .then((value) {
      if (value.state == BaseStatus.success) {
        _refreshController.loadComplete();
        final result = value.data ?? [];
        if (result.length < _pageSize) {
          _hasMore = false;
        } else {
          _hasMore = true;
        }
        _currentRepos.addAll(result);
        ++_currentPage;
      } else {
        _refreshController.loadFailed();
      }
    });
  }

  Widget _createSortBottomSheet() {
    final children = _sortByItems.map((e) {
      return MyRadioListTile(
        myTitle: Text(e.title),
        value: e.value,
        groupValue: _sortBy,
        onChanged: (value) {
          setState(() {
            _sortBy = value as SortBy;
          });
          _refreshController.requestRefresh();
          Navigator.pop(context);
        },
      );
    });
    return HeaderContentBottomSheet(
        title: "Sort by",
        contentScrollable: true,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: children.toList(),
        ));
  }

  Widget _createSortDirectionBottomSheet() {
    final items = _sortDirectionItems.map((e) {
      return MyRadioListTile(
        myTitle: Text(e.title),
        value: e.value,
        groupValue: _sortDirection,
        onChanged: (value) {
          setState(() {
            _sortDirection = value as SortDirection;
          });
          _refreshController.requestRefresh();
          Navigator.pop(context);
        },
      );
    }).toList();
    return HeaderContentBottomSheet(
        title: "Sort direction",
        contentScrollable: true,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: items,
        ));
  }

  void _showBottomSheetDialog(Widget content) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return content;
        });
  }

  Widget _createFilterChipSets() {
    return LayoutBuilder(builder: (context, constraints) {
      return Wrap(
        spacing: 5,
        runSpacing: 5,
        children: [
          ActionChip(
              pressElevation: 0,
              label: const Text("Sort by"),
              avatar: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              onPressed: () {
                _showBottomSheetDialog(_createSortBottomSheet());
              }),
          ActionChip(
              pressElevation: 0,
              label: const Text("Direction"),
              avatar: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              onPressed: () {
                _showBottomSheetDialog(_createSortDirectionBottomSheet());
              })
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Container(
          constraints: const BoxConstraints(minWidth: double.infinity),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _createFilterChipSets(),
          ),
        ),
        Expanded(
          child: SmartRefresher(
            onRefresh: _refreshPage,
            onLoading: _fetchMore,
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: _hasMore,
            header: const WaterDropHeader(),
            child: ListView.separated(
              itemCount: _currentRepos.length,
              itemBuilder: (context, index) {
                final item = _currentRepos[index];
                return RepoListItem(repo: item, onTap: () {});
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  constraints: const BoxConstraints(
                      minWidth: double.infinity, minHeight: 5),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
