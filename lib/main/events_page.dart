import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/widget/event_list_item.dart';
import 'package:flutter_gitee/user/bean/event_result_entity.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EventsPageState();
}

class _EventsPageState extends BaseState<EventsPage>
    with AutomaticKeepAliveClientMixin {
  final _refreshController = RefreshController();
  var _hasMore = false;
  final _events = <EventResultEntity>[];
  final _pageSize = 10;

  void _refreshEvents() {
    getUserEvent(limit: _pageSize).then((value) {
      if (value.state == BaseStatus.success) {
        _refreshController.refreshCompleted();
        final result = value.data ?? [];
        setState(() {
          _events.clear();
          if (result.isEmpty || result.length < _pageSize) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
          _events.addAll(result);
        });
      } else {
        _refreshController.refreshFailed();
      }
    });
  }

  void _fetchMoreEvent() {
    if (_events.isEmpty) {
      setState(() {
        _hasMore = false;
      });
      return;
    }
    final last = _events[_events.length - 1].id?.toInt();
    getUserEvent(limit: _pageSize, prevID: last).then((value) {
      if (value.state == BaseStatus.success) {
        _refreshController.loadComplete();
        final result = value.data ?? [];
        setState(() {
          if (result.isEmpty || result.length < _pageSize) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
          _events.addAll(result);
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
  void didUpdateWidget(covariant EventsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _refreshController.requestRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      constraints: const BoxConstraints.expand(),
      child: SmartRefresher(
        onRefresh: _refreshEvents,
        onLoading: _fetchMoreEvent,
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: _hasMore,
        header: const WaterDropHeader(),
        child: ListView.builder(
          itemCount: _events.length,
          itemBuilder: (context, index) {
            final event = _events[index];
            switch (event.type) {
              case "FollowEvent":
                return FollowEventListItem(event: event);
              case "StarEvent":
                return StarEventListItem(event: event);
              case "PushEvent":
                return PushEventListItem(event: event);
              case "CreateEvent":
                return CreateEventListItem(event: event);
              case "IssueEvent":
                return CreateIssueListItem(event: event);
              case "IssueCommentEvent":
                return IssueCommentListItem(event: event);
              default:
                return UnsupportedEventListItem(event: event);
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
