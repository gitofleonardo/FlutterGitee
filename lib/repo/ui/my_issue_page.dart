import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/widget/general_bottom_sheet_header.dart';
import 'package:flutter_gitee/main/base/widget/my_radio_list_tile.dart';
import 'package:flutter_gitee/repo/bean/issue_result_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/widget/issue_list_item.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'issue_detail_page.dart';

const stateMap = {
  "All": "all",
  "Open": "open",
  "Progressing": "progressing",
  "Closed": "closed",
  "Rejected": "rejected",
};

const sortMap = {"Created": "created", "Updated": "updated"};

const directionMap = {"ASC": "asc", "DESC": "desc"};

const filterMap = {"All": "all", "Created": "created", "Assigned": "assigned"};

class MyIssuePage extends StatefulWidget {
  const MyIssuePage({Key? key}) : super(key: key);

  @override
  _MyIssuePageState createState() => _MyIssuePageState();
}

class _MyIssuePageState extends State<MyIssuePage> {
  final _refreshController = RefreshController();
  var _hasMore = false;
  final _pageSize = 20;
  var _currentPage = 1;
  final _issues = <IssueResultEntity>[];
  var _filter = "all";
  var _state = "all";
  var _sort = "created";
  var _direction = "desc";

  void _refreshPage() {
    setState(() {
      _hasMore = false;
    });
    _currentPage = 1;
    getMyIssues(_currentPage, _pageSize, _sort, _direction, _state, _filter)
        .then((value) {
      if (value.success) {
        _refreshController.refreshCompleted();
        final res = value.data ?? [];
        ++_currentPage;
        setState(() {
          _issues.clear();
          _issues.addAll(res);
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
    getMyIssues(_currentPage, _pageSize, _sort, _direction, _state, _filter)
        .then((value) {
      if (value.success) {
        _refreshController.loadComplete();
        final res = value.data ?? [];
        ++_currentPage;
        setState(() {
          _issues.addAll(res);
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
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("My Issue"),
            ),
            body: Flex(
              direction: Axis.vertical,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      child: Wrap(
                        spacing: 10,
                        children: _createFilterChips(context),
                      ),
                      padding: const EdgeInsets.only(left: 10),
                    ),
                  ),
                ),
                Expanded(
                    child: SmartRefresher(
                  onRefresh: _refreshPage,
                  onLoading: _loadMore,
                  enablePullUp: _hasMore,
                  enablePullDown: true,
                  header: const WaterDropHeader(),
                  controller: _refreshController,
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        final item = _issues[index];
                        return IssueListItem(
                            issue: item,
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return IssueDetailPage(
                                    fullName: "${item.repository?.fullName}",
                                    number: "${item.number}");
                              }));
                            });
                      },
                      itemCount: _issues.length),
                )),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> _createFilterChips(BuildContext context) {
    return [
      ActionChip(
          pressElevation: 0,
          avatar: const Icon(Icons.arrow_drop_down),
          label: const Text("State"),
          onPressed: () {
            _createStateBottomSheet(context);
          }),
      ActionChip(
          pressElevation: 0,
          avatar: const Icon(Icons.arrow_drop_down),
          label: const Text("Sort"),
          onPressed: () {
            _createSortBottomSheet(context);
          }),
      ActionChip(
          pressElevation: 0,
          avatar: const Icon(Icons.arrow_drop_down),
          label: const Text("SortDirection"),
          onPressed: () {
            _createSortDirectionBottomSheet(context);
          }),
      ActionChip(
          pressElevation: 0,
          avatar: const Icon(Icons.arrow_drop_down),
          label: const Text("Filter"),
          onPressed: () {
            _createFilter(context);
          }),
    ];
  }

  void _createFilter(BuildContext context) {
    showModalBottomSheet(
        shape: bottomSheetShape,
        context: context,
        builder: (context) {
          return HeaderContentBottomSheet(
              title: 'Filter',
              body: ListView(
                children: filterMap.entries.map((e) {
                  return MyRadioListTile<String>(
                      myTitle: Text(e.key),
                      value: e.value,
                      groupValue: _filter,
                      onChanged: (v) {
                        Navigator.pop(context);
                        if (_filter == v) {
                          _filter = "";
                        } else {
                          _filter = v;
                        }
                        _refreshController.requestRefresh();
                      });
                }).toList(),
              ));
        });
  }

  void _createSortDirectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: bottomSheetShape,
        context: context,
        builder: (context) {
          return HeaderContentBottomSheet(
              title: 'SortDirection',
              body: ListView(
                children: directionMap.entries.map((e) {
                  return MyRadioListTile<String>(
                      myTitle: Text(e.key),
                      value: e.value,
                      groupValue: _direction,
                      onChanged: (v) {
                        Navigator.pop(context);
                        if (_direction == v) {
                          _direction = "";
                        } else {
                          _direction = v;
                        }
                        _refreshController.requestRefresh();
                      });
                }).toList(),
              ));
        });
  }

  void _createSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: bottomSheetShape,
        context: context,
        builder: (context) {
          return HeaderContentBottomSheet(
              title: 'Sort',
              body: ListView(
                children: sortMap.entries.map((e) {
                  return MyRadioListTile<String>(
                      myTitle: Text(e.key),
                      value: e.value,
                      groupValue: _sort,
                      onChanged: (v) {
                        Navigator.pop(context);
                        if (_sort == v) {
                          _sort = "";
                        } else {
                          _sort = v;
                        }
                        _refreshController.requestRefresh();
                      });
                }).toList(),
              ));
        });
  }

  void _createStateBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: bottomSheetShape,
        context: context,
        builder: (context) {
          return HeaderContentBottomSheet(
              title: 'State',
              body: ListView(
                children: stateMap.entries.map((e) {
                  return MyRadioListTile<String>(
                      myTitle: Text(e.key),
                      value: e.value,
                      groupValue: _state,
                      onChanged: (v) {
                        Navigator.pop(context);
                        if (_state == v) {
                          _state = "";
                        } else {
                          _state = v;
                        }
                        _refreshController.requestRefresh();
                      });
                }).toList(),
              ));
        });
  }
}
