import 'package:flutter/material.dart';
import 'package:flutter_gitee/user/bean/event_result_entity.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/user/profile/user_event_list_item.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserEventsPage extends StatefulWidget {
  final String username;

  const UserEventsPage({Key? key, required this.username}) : super(key: key);

  @override
  _UserEventsPageState createState() => _UserEventsPageState();
}

class _UserEventsPageState extends BaseState<UserEventsPage> {
  final _refreshController = RefreshController();
  final _events = <EventResultEntity>[];
  var _hasMore = false;
  var _receivedHasMore = false;
  final _pageSize = 20;
  int? _eventPrevId;
  int? _receivedEventsPrevId;

  void _refresh() async {
    setState(() {
      _hasMore = false;
      _receivedHasMore = false;
    });
    final events =
        await getUserPublicEvent(username: widget.username, limit: _pageSize);
    if (events.success) {
      final data = events.data!;
      _refreshController.refreshCompleted();
      setState(() {
        if (data.length < _pageSize) {
          _hasMore = false;
        } else {
          _hasMore = true;
        }
        if (data.isNotEmpty) {
          _eventPrevId = data[data.length - 1].id?.toInt();
        }
        _events.clear();
        _events.addAll(data);
      });
    } else {
      _refreshController.refreshFailed();
    }
  }

  void _load() async {
    if (_events.isEmpty) {
      return;
    }
    final events = await getUserPublicEvent(
        username: widget.username, limit: _pageSize, prevID: _eventPrevId);
    if (events.success) {
      final data = events.data!;
      _refreshController.loadComplete();
      setState(() {
        if (data.length < _pageSize) {
          _hasMore = false;
        } else {
          _hasMore = true;
        }
        if (data.isNotEmpty) {
          _eventPrevId = data[data.length - 1].id?.toInt();
        }
        _events.addAll(data);
      });
    } else {
      _refreshController.loadFailed();
    }
  }

  int _compareEvents(EventResultEntity a, EventResultEntity b) {
    final aTime = a.id?.toInt() ?? 0;
    final bTime = b.id?.toInt() ?? 0;
    if (aTime > bTime) {
      return 1;
    } else if (aTime < bTime) {
      return -1;
    } else {
      return 0;
    }
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
    return SmartRefresher(
      enablePullUp: _hasMore | _receivedHasMore,
      enablePullDown: true,
      onLoading: _load,
      onRefresh: _refresh,
      controller: _refreshController,
      child: ListView.builder(
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
        itemCount: _events.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
