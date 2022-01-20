import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/start/home/home_widget.dart';
import 'package:flutter_gitee/main/start/home/message/bean/user_message_entity.dart';
import 'package:flutter_gitee/main/start/home/message/model.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum MessageType { notification, message, refer }

class MessagePage extends StatefulWidget implements HomeWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  MessagePageState createState() => MessagePageState();

  @override
  Widget getIcon() {
    return const Icon(FontAwesomeIcons.solidEnvelope);
  }

  @override
  String getText(BuildContext context) {
    return S.of(context).messages;
  }
}

class MessagePageState extends BaseState<MessagePage> {
  final _refreshController = RefreshController();
  var _hasMore = false;
  var _messageType = MessageType.message;
  final _pageSize = 20;
  var _currentPage = 1;
  final _userMessages = <UserMessageList>[];
  bool? _unread = null;

  String get _messageTypeName {
    switch (_messageType) {
      case MessageType.notification:
        return S.of(context).notificationMessage;
      case MessageType.message:
        return S.of(context).privateMessage;
      case MessageType.refer:
        return S.of(context).referMessage;
    }
  }

  void _refresh() {
    setState(() {
      _hasMore = false;
    });
    _currentPage = 1;
    getUserMessages(_unread, _currentPage, _pageSize).then((value) {
      if (value.success) {
        _refreshController.refreshCompleted();
        final data = value.data?.list ?? [];
        setState(() {
          if (data.length >= _pageSize) {
            _hasMore = true;
          } else {
            _hasMore = false;
          }
          _userMessages.clear();
          _userMessages.addAll(data);
          ++_currentPage;
        });
      } else {
        _refreshController.refreshFailed();
      }
    });
  }

  void _loadMore() {
    getUserMessages(_unread, _currentPage, _pageSize).then((value) {
      if (value.success) {
        _refreshController.loadComplete();
        final data = value.data?.list ?? [];
        setState(() {
          if (data.length >= _pageSize) {
            _hasMore = true;
          } else {
            _hasMore = false;
          }
          _userMessages.addAll(data);
          ++_currentPage;
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
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                _showMessageTypeDialog(context);
              },
              child: Text(
                _messageTypeName,
                key: ValueKey<MessageType>(_messageType),
                style: TextStyle(
                    color: theme.theme.colorScheme.onPrimaryContainer),
              ),
            ),
            IconButton(
                onPressed: () {
                  _showMessageTypeDialog(context);
                },
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: theme.theme.colorScheme.onPrimaryContainer,
                ))
          ],
        ),
        backgroundColor: theme.theme.colorScheme.primaryContainer,
        actions: [
          IconButton(
            onPressed: () {
              _showFilterDialog(context);
            },
            icon: Icon(
              Icons.filter_list,
              color: theme.theme.colorScheme.onPrimaryContainer,
            ),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: _hasMore,
        onLoading: _loadMore,
        onRefresh: _refresh,
        child: ListView.builder(
            itemBuilder: (context, index) {
              final item = _userMessages[index];
              return ListTile(
                dense: true,
                leading: ClipOval(
                  child: Image.network(
                    "${item.sender?.avatarUrl}",
                    width: 32,
                    height: 32,
                  ),
                ),
                title: Text("${item.sender?.login}"),
                subtitle: Text("${item.content}"),
              );
            },
            itemCount: _userMessages.length),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {}

  void _showMessageTypeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(S.of(context).messageType),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(S.of(context).privateMessage),
                onTap: () {
                  _messageType = MessageType.message;
                  _refreshController.requestRefresh();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(S.of(context).notificationMessage),
                onTap: () {
                  _messageType = MessageType.notification;
                  _refreshController.requestRefresh();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(S.of(context).referMessage),
                onTap: () {
                  _messageType = MessageType.refer;
                  _refreshController.requestRefresh();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
