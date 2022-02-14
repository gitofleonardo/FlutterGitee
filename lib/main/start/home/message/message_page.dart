import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/start/home/home_widget.dart';
import 'package:flutter_gitee/main/start/home/message/bean/notification_message_entity.dart';
import 'package:flutter_gitee/main/start/home/message/bean/user_message_entity.dart';
import 'package:flutter_gitee/main/start/home/message/message_item.dart';
import 'package:flutter_gitee/main/start/home/message/model.dart';
import 'package:flutter_gitee/main/start/home/start_page.dart';
import 'package:flutter_gitee/main/start/home/start_page_events.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum MessageType {
  /// type of notification threads
  event,

  /// type of notification threads
  refer,

  /// type of messages
  message,
}

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
  final _scrollController = ScrollController();
  var _hasMore = false;
  var _messageType = MessageType.message;
  final _pageSize = 20;
  var _currentPage = 1;
  final _userMessages = <UserMessageList>[];
  final _notificationMessages = <NotificationMessageList>[];
  final _userMessageSelectionCachePool = <UserMessageList>[];
  final _notificationSelectionCachePool = <NotificationMessageList>[];
  bool _unread = false;
  late final StreamSubscription _tabSubscription;
  bool _selectionMode = false;

  String get _messageTypeName {
    switch (_messageType) {
      case MessageType.event:
        return S.of(context).eventMessage;
      case MessageType.message:
        return S.of(context).privateMessage;
      case MessageType.refer:
        return S.of(context).referMessage;
    }
  }

  void _refresh() {
    if (_messageType == MessageType.message) {
      _refreshMessage();
    } else {
      _refreshNotification();
    }
  }

  void _loadMore() {
    if (_messageType == MessageType.message) {
      _loadMoreMessage();
    } else {
      _loadMoreNotification();
    }
  }

  void _markMessageAsRead(String messageId) {
    markMessageAsRead(messageId);
  }

  void _markNotificationAsRead(String messageId) {
    markNotificationAsRead(messageId);
  }

  void _markAllMessageAsRead(BuildContext context,
      {List<UserMessageList> ids = const []}) {
    _showLoadingDialog(context);
    markAllMessagesAsRead(ids: ids.map((e) => "${e.id}").toList())
        .then((value) {
      Navigator.pop(context);
      if (value.success) {
        setState(() {
          for (var element in ids) {
            element.unread = false;
          }
        });
        _exitSelectionMode();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(S.of(context).finished)));
      }
    });
  }

  void _markAllNotificationAsRead(BuildContext context,
      {List<NotificationMessageList> ids = const []}) {
    _showLoadingDialog(context);
    markAllNotificationsAsRead(ids: ids.map((e) => "${e.id}").toList())
        .then((value) {
      Navigator.pop(context);
      if (value.success) {
        setState(() {
          for (var element in ids) {
            element.unread = false;
          }
        });
        _exitSelectionMode();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(S.of(context).finished)));
      }
    });
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: theme.theme.colorScheme.background,
          content: Flex(
            direction: Axis.horizontal,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                  child: Text(
                S.of(context).loading,
              ))
            ],
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  void _refreshMessage() {
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

  void _loadMoreMessage() {
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

  void _refreshNotification() {
    setState(() {
      _hasMore = false;
    });
    _currentPage = 1;
    getNotificationMessages(_unread, _currentPage, _pageSize, _messageType)
        .then((value) {
      if (value.success) {
        _refreshController.refreshCompleted();
        final data = value.data?.list ?? [];
        setState(() {
          if (data.length >= _pageSize) {
            _hasMore = true;
          } else {
            _hasMore = false;
          }
          _notificationMessages.clear();
          _notificationMessages.addAll(data);
          ++_currentPage;
        });
      } else {
        _refreshController.refreshFailed();
      }
    });
  }

  void _loadMoreNotification() {
    getNotificationMessages(_unread, _currentPage, _pageSize, _messageType)
        .then((value) {
      if (value.success) {
        _refreshController.loadComplete();
        final data = value.data?.list ?? [];
        setState(() {
          if (data.length >= _pageSize) {
            _hasMore = true;
          } else {
            _hasMore = false;
          }
          _notificationMessages.addAll(data);
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
    _tabSubscription = startPageBus.on<TabReselectEvent>().listen((event) {
      if (event.pageIndex == 1) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.decelerate,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabSubscription.cancel();
  }

  @override
  Widget create(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: _selectionMode ? _createSelectionModeAppBar() : _createAppBar(),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: !_selectionMode,
          enablePullUp: _hasMore,
          onLoading: _loadMore,
          onRefresh: _refresh,
          child: _createListView(),
        ),
      ),
      onWillPop: () async {
        if (_selectionMode) {
          _exitSelectionMode();
          return false;
        }
        return true;
      },
    );
  }

  Widget _createListView() {
    if (_messageType == MessageType.message) {
      return ListView.builder(
        controller: _scrollController,
        itemBuilder: (context, index) {
          final item = _userMessages[index];
          return MessageItem(
            onTap: () {
              if (_selectionMode) {
                _toggleInSelectionPool(index, _messageType);
              } else {
                _showUserMessageDetailDialog(
                  context,
                  item,
                );
                if (item.unread ?? false) {
                  _markNotificationAsRead("${item.id}");
                  setState(() {
                    item.unread = false;
                  });
                }
              }
            },
            onLongPress: () {
              if (!_selectionMode) {
                _enterSelectionMode(index, _messageType);
              } else {
                _toggleInSelectionPool(index, _messageType);
              }
            },
            name: "${item.sender?.login}",
            avatar: "${item.sender?.avatarUrl}",
            time: item.updatedAt!,
            content: "${item.content}",
            unread: item.unread ?? false,
            selected: item.selected,
          );
        },
        itemCount: _userMessages.length,
      );
    }
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, index) {
        final item = _notificationMessages[index];
        return MessageItem(
          onTap: () {
            if (_selectionMode) {
              _toggleInSelectionPool(index, _messageType);
            } else {
              _showMessageDetailDialog(
                  context, "${item.content}", _messageType);
              if (item.unread ?? false) {
                _markNotificationAsRead("${item.id}");
                setState(() {
                  item.unread = false;
                });
              }
            }
          },
          onLongPress: () {
            if (!_selectionMode) {
              _enterSelectionMode(index, _messageType);
            } else {
              _toggleInSelectionPool(index, _messageType);
            }
          },
          name: "${item.actor?.login}",
          avatar: "${item.actor?.avatarUrl}",
          time: item.updatedAt!,
          content: "${item.content}",
          unread: item.unread ?? false,
          selected: item.selected,
        );
      },
      itemCount: _notificationMessages.length,
    );
  }

  void _enterSelectionMode(int startIndex, MessageType type) {
    if (_selectionMode) {
      return;
    }
    setState(() {
      _selectionMode = true;
      if (type == MessageType.message) {
        final item = _userMessages[startIndex];
        item.selected = true;
        _userMessageSelectionCachePool.add(item);
      } else {
        final item = _notificationMessages[startIndex];
        item.selected = true;
        _notificationSelectionCachePool.add(item);
      }
    });
  }

  void _toggleInSelectionPool(int index, MessageType type) {
    if (!_selectionMode) {
      return;
    }
    setState(() {
      if (type == MessageType.message) {
        final item = _userMessages[index];
        if (_userMessageSelectionCachePool.contains(item)) {
          item.selected = false;
          _userMessageSelectionCachePool.remove(item);
        } else {
          item.selected = true;
          _userMessageSelectionCachePool.add(item);
        }
      } else {
        final item = _notificationMessages[index];
        if (_notificationSelectionCachePool.contains(item)) {
          item.selected = false;
          _notificationSelectionCachePool.remove(item);
        } else {
          item.selected = true;
          _notificationSelectionCachePool.add(item);
        }
      }
    });
  }

  void _exitSelectionMode() {
    if (!_selectionMode) {
      return;
    }
    setState(() {
      _selectionMode = false;
      for (var element in _userMessageSelectionCachePool) {
        element.selected = false;
      }
      for (var element in _notificationSelectionCachePool) {
        element.selected = false;
      }
      _userMessageSelectionCachePool.clear();
      _notificationSelectionCachePool.clear();
    });
  }

  void _showUserMessageDetailDialog(
      BuildContext context, UserMessageList message) {
    final actions = [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(S.of(context).ok),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, "user_message_detail_page",
              arguments: message);
        },
        child: Text(S.of(context).details),
      ),
    ];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: theme.theme.colorScheme.background,
          title: Text(S.of(context).details),
          content: SingleChildScrollView(
            child: SelectableText("${message.content}"),
          ),
          actions: actions,
        );
      },
    );
  }

  void _showMessageDetailDialog(
      BuildContext context, String content, MessageType type,
      {String? senderUsername}) {
    final actions = [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(S.of(context).ok),
      )
    ];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: theme.theme.colorScheme.background,
          title: Text(S.of(context).details),
          content: SingleChildScrollView(
            child: SelectableText(content),
          ),
          actions: actions,
        );
      },
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              _showMessageTypeDialog(context);
            },
            child: Text(
              _messageTypeName,
              key: ValueKey<MessageType>(_messageType),
              style:
                  TextStyle(color: theme.theme.colorScheme.onPrimaryContainer),
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
    );
  }

  AppBar _createSelectionModeAppBar() {
    final int selectedItemCount;
    if (_messageType == MessageType.message) {
      selectedItemCount = _userMessageSelectionCachePool.length;
    } else {
      selectedItemCount = _notificationSelectionCachePool.length;
    }
    return AppBar(
      title: Text(
        "$selectedItemCount ${S.of(context).selected}",
        style:
            TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
      ),
      backgroundColor: theme.theme.colorScheme.primaryContainer,
      actions: [
        IconButton(
          onPressed: () {
            if (_messageType == MessageType.message) {
              _markAllMessageAsRead(context,
                  ids: _userMessageSelectionCachePool);
            } else {
              _markAllNotificationAsRead(context,
                  ids: _notificationSelectionCachePool);
            }
          },
          icon: Icon(
            Icons.mark_as_unread,
            color: theme.theme.colorScheme.onPrimaryContainer,
          ),
          tooltip: S.of(context).markAllRead,
        )
      ],
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: theme.theme.colorScheme.background,
            title: Text(S.of(context).options),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    value: _unread,
                    onChanged: (value) {
                      setState(() {
                        _unread = value ?? false;
                      });
                      _refreshController.requestRefresh();
                      Navigator.pop(context);
                    },
                    title: Text(S.of(context).onlyGetUnreadMessages),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(S.of(context).cancel))
            ],
          );
        });
  }

  void _showMessageTypeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: theme.theme.colorScheme.background,
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
                title: Text(S.of(context).eventMessage),
                onTap: () {
                  _messageType = MessageType.event;
                  _refreshController.requestRefresh();
                  Navigator.pop(context);
                  setState(() {
                    _notificationMessages.clear();
                  });
                },
              ),
              ListTile(
                title: Text(S.of(context).referMessage),
                onTap: () {
                  _messageType = MessageType.refer;
                  _refreshController.requestRefresh();
                  Navigator.pop(context);
                  setState(() {
                    _notificationMessages.clear();
                  });
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
