import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gitee/main/base/widget/general_bottom_sheet_header.dart';
import 'package:flutter_gitee/main/base/widget/my_radio_list_tile.dart';
import 'package:flutter_gitee/repo/bean/issue_comment_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/widget/issue_comment_list_item.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const _commentOrders = {
  "Descending by time": "desc",
  "Ascending by time": "asc"
};

class IssueCommentsPage extends StatefulWidget {
  final String fullName;
  final String number;

  const IssueCommentsPage(
      {Key? key, required this.fullName, required this.number})
      : super(key: key);

  @override
  _IssueCommentsPageState createState() => _IssueCommentsPageState();
}

class _IssueCommentsPageState extends BaseState<IssueCommentsPage> {
  final _refreshCommentController = RefreshController();
  final _commentScrollController = ScrollController();
  var _hasMore = false;
  var _currentPage = 1;
  final _pageSize = 20;
  final _issueComments = <IssueCommentEntity>[];
  var _commentOrder = "desc";
  final _replyTextController = TextEditingController();
  var _showFab = true;

  void _loadIssueComments() {
    getIssueComments(widget.fullName, widget.number, _currentPage, _pageSize,
            _commentOrder)
        .then((value) {
      if (value.success) {
        ++_currentPage;
        _refreshCommentController.loadComplete();
        final dat = value.data ?? [];
        setState(() {
          _issueComments.addAll(dat);
          _hasMore = dat.length >= _pageSize;
        });
      } else {
        _refreshCommentController.loadFailed();
      }
    });
  }

  void _refreshIssueComments() {
    setState(() {
      _hasMore = false;
    });
    _currentPage = 1;
    getIssueComments(widget.fullName, widget.number, _currentPage, _pageSize,
            _commentOrder)
        .then((value) {
      if (value.success) {
        ++_currentPage;
        _refreshCommentController.refreshCompleted();
        final dat = value.data ?? [];
        setState(() {
          _issueComments.clear();
          _issueComments.addAll(dat);
          _hasMore = dat.length < _pageSize ? false : true;
        });
      } else {
        _refreshCommentController.refreshFailed();
      }
    });
  }

  void _replyToIssue(BuildContext context) {
    final text = _replyTextController.text;
    if (text.isEmpty) {
      Fluttertoast.showToast(msg: "Message cannot be empty");
      return;
    }
    FocusScope.of(context).unfocus();
    _showLoading(context, "Loading");
    commentOnIssue(widget.fullName, widget.number, text).then((value) {
      Navigator.pop(context, true);
      if (value.success && value.data != null) {
        setState(() {
          _issueComments.insert(0, value.data!);
        });
        Navigator.pop(context);
        _replyTextController.clear();
        Fluttertoast.showToast(msg: "Comment sent");
      } else {
        Fluttertoast.showToast(msg: "Failed sending comment");
      }
    });
  }

  void _showLoading(BuildContext context, String message) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Flex(
            direction: Axis.horizontal,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 10,
              ),
              Text(message)
            ],
          ));
        });
  }

  @override
  void initState() {
    super.initState();
    _commentScrollController.addListener(() {
      final showFab = _commentScrollController.position.userScrollDirection !=
          ScrollDirection.reverse;
      setState(() {
        if (_showFab != showFab) {
          _showFab = showFab;
        }
      });
    });
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _refreshCommentController.requestRefresh();
    });
  }

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        header: const WaterDropHeader(),
        enablePullUp: _hasMore,
        enablePullDown: true,
        controller: _refreshCommentController,
        onRefresh: _refreshIssueComments,
        onLoading: _loadIssueComments,
        child: ListView.builder(
          itemBuilder: (context, index) {
            final item = _issueComments[index];
            return IssueCommentListItem(
                issue: item, onTap: () {}, onLongPress: () {});
          },
          itemCount: _issueComments.length,
          controller: _commentScrollController,
        ),
      ),
      floatingActionButton: AnimatedScale(
        duration: const Duration(milliseconds: 250),
        scale: _showFab ? 1.0 : 0.0,
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            _showCommentBottomSheet(context);
          },
          child: const Icon(Icons.message, color: Colors.white),
        ),
      ),
    );
  }

  void _showCommentOrderSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return HeaderContentBottomSheet(
            title: "Comment Order",
            body: Column(
              children: _commentOrders.entries.map((e) {
                return MyRadioListTile<String>(
                    myTitle: Text(e.key),
                    value: e.value,
                    groupValue: _commentOrder,
                    onChanged: (value) {
                      _commentOrder = value;
                      _refreshIssueComments();
                      Navigator.pop(context);
                    });
              }).toList(),
            ),
          );
        },
        shape: bottomSheetShape);
  }

  void _showCommentBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: bottomSheetShape,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: _createCommentBottomSheet(),
          );
        });
  }

  Widget _createCommentBottomSheet() {
    return Builder(builder: (context) {
      return HeaderContentBottomSheet(
          title: "Comment",
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    child: TextField(
                  controller: _replyTextController,
                  decoration:
                      const InputDecoration(hintText: "Comment on issue"),
                )),
                TextButton(
                    onPressed: () {
                      _replyToIssue(context);
                    },
                    child: const Text("Reply"))
              ],
            ),
          ));
    });
  }
}
