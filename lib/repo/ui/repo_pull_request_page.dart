import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/widget/general_bottom_sheet_header.dart';
import 'package:flutter_gitee/main/base/widget/my_radio_list_tile.dart';
import 'package:flutter_gitee/repo/bean/pull_request_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/widget/pull_request_list_item.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RepoPullRequestPage extends StatefulWidget {
  final String fullName;
  const RepoPullRequestPage({Key? key, required this.fullName})
      : super(key: key);

  @override
  _RepoPullRequestPageState createState() => _RepoPullRequestPageState();
}

class _RepoPullRequestPageState extends BaseState<RepoPullRequestPage> {
  final _refreshController = RefreshController();
  var _hasMore = false;
  final _pageSize = 20;
  var _currentPage = 1;
  final _pulls = <PullRequestEntity>[];
  var _state = "all";
  var _sort = "created";
  var _direction = "desc";

  void _refreshPage() {
    setState(() {
      _hasMore = false;
    });
    _currentPage = 1;
    getRepoPullRequest(
            widget.fullName, _currentPage, _pageSize, _sort, _direction, _state)
        .then((value) {
      if (value.success) {
        _refreshController.refreshCompleted();
        final res = value.data ?? [];
        ++_currentPage;
        setState(() {
          _pulls.clear();
          _pulls.addAll(res);
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
    getRepoPullRequest(
            widget.fullName, _currentPage, _pageSize, _sort, _direction, _state)
        .then((value) {
      if (value.success) {
        _refreshController.loadComplete();
        final res = value.data ?? [];
        ++_currentPage;
        setState(() {
          _pulls.addAll(res);
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
        title: Text(S.of(context).pullRequest),
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
            controller: _refreshController,
            child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = _pulls[index];
                  return PullRequestListItem(pull: item, onTap: () {});
                },
                itemCount: _pulls.length),
          )),
        ],
      ),
    );
  }

  List<Widget> _createFilterChips(BuildContext context) {
    return [
      ActionChip(
          pressElevation: 0,
          avatar: const Icon(Icons.arrow_drop_down),
          label: Text(S.of(context).state),
          onPressed: () {
            _createStateBottomSheet(context);
          }),
      ActionChip(
          pressElevation: 0,
          avatar: const Icon(Icons.arrow_drop_down),
          label: Text(S.of(context).sort),
          onPressed: () {
            _createSortBottomSheet(context);
          }),
      ActionChip(
          pressElevation: 0,
          avatar: const Icon(Icons.arrow_drop_down),
          label: Text(S.of(context).order),
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
      S.of(context).updateTime: "updated",
      S.of(context).popularity: "popularity",
      S.of(context).longRunning: "long-running"
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
      S.of(context).closed: "closed",
      S.of(context).merged: "merged",
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
