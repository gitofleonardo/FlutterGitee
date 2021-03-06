import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/widget/general_bottom_sheet_header.dart';
import 'package:flutter_gitee/main/base/widget/my_radio_list_tile.dart';
import 'package:flutter_gitee/repo/bean/issue_result_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/widget/issue_list_item.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'issue_detail_page.dart';

class RepoIssuePage extends StatefulWidget {
  final String fullName;

  const RepoIssuePage({Key? key, required this.fullName}) : super(key: key);

  @override
  _RepoIssuePageState createState() => _RepoIssuePageState();
}

class _RepoIssuePageState extends BaseState<RepoIssuePage> {
  final _refreshController = RefreshController();
  var _hasMore = false;
  final _pageSize = 20;
  var _currentPage = 1;
  final _issues = <IssueResultEntity>[];
  var _state = "all";
  var _sort = "created";
  var _direction = "desc";

  void _refreshPage() {
    setState(() {
      _hasMore = false;
    });
    _currentPage = 1;
    getRepositoryIssue(
            widget.fullName, _currentPage, _pageSize, _sort, _direction, _state)
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
    getRepositoryIssue(
            widget.fullName, _currentPage, _pageSize, _sort, _direction, _state)
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
  Widget create(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(S.of(context).issues),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.background),
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
              controller: _refreshController,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    final item = _issues[index];
                    return IssueListItem(
                      issue: item,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return IssueDetailPage(
                                  fullName: "${item.repository?.fullName}",
                                  number: "${item.number}");
                            },
                          ),
                        );
                      },
                    );
                  },
                  itemCount: _issues.length),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _createFilterChips(BuildContext context) {
    return [
      ActionChip(
          backgroundColor: Theme.of(context).colorScheme.primary,
          pressElevation: 0,
          avatar: Icon(Icons.arrow_drop_down,
              color: theme.theme.colorScheme.onPrimary),
          label: Text(
            S.of(context).state,
            style: TextStyle(color: theme.theme.colorScheme.onPrimary),
          ),
          onPressed: () {
            _createStateBottomSheet(context);
          }),
      ActionChip(
          backgroundColor: Theme.of(context).colorScheme.primary,
          pressElevation: 0,
          avatar: Icon(Icons.arrow_drop_down,
              color: theme.theme.colorScheme.onPrimary),
          label: Text(
            S.of(context).sort,
            style: TextStyle(color: theme.theme.colorScheme.onPrimary),
          ),
          onPressed: () {
            _createSortBottomSheet(context);
          }),
      ActionChip(
          backgroundColor: Theme.of(context).colorScheme.primary,
          pressElevation: 0,
          avatar: Icon(Icons.arrow_drop_down,
              color: theme.theme.colorScheme.onPrimary),
          label: Text(
            S.of(context).order,
            style: TextStyle(color: theme.theme.colorScheme.onPrimary),
          ),
          onPressed: () {
            _createSortDirectionBottomSheet(context);
          }),
    ];
  }

  void _createSortDirectionBottomSheet(BuildContext context) {
    final directionMap = {
      S.of(context).ascending: "asc",
      S.of(context).descending: "desc"
    };
    showModalBottomSheet(
        shape: bottomSheetShape,
        context: context,
        builder: (context) {
          return HeaderContentBottomSheet(
              title: S.of(context).order,
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
    final sortMap = {
      S.of(context).creationTime: "created",
      S.of(context).updateTime: "updated"
    };
    showModalBottomSheet(
        shape: bottomSheetShape,
        context: context,
        builder: (context) {
          return HeaderContentBottomSheet(
              title: S.of(context).sort,
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
    final stateMap = {
      S.of(context).open: "open",
      S.of(context).progressing: "progressing",
      S.of(context).closed: "closed",
      S.of(context).rejected: "rejected",
      S.of(context).all: "all"
    };
    showModalBottomSheet(
        shape: bottomSheetShape,
        context: context,
        builder: (context) {
          return HeaderContentBottomSheet(
              title: S.of(context).state,
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
