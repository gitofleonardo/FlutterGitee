import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/repo/bean/issue_comment_entity.dart';
import 'package:flutter_gitee/repo/bean/issue_result_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/widget/issue_comment_list_item.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

enum _PageState { loading, done, fail }

class IssueDetailPage extends StatefulWidget {
  final String fullName;
  final String number;

  const IssueDetailPage(
      {Key? key, required this.fullName, required this.number})
      : super(key: key);

  @override
  _IssueDetailPageState createState() => _IssueDetailPageState();
}

class _IssueDetailPageState extends State<IssueDetailPage> {
  late IssueResultEntity _issue;
  final _issueComments = <IssueCommentEntity>[];
  var _hasMore = true;
  var _currentPage = 1;
  final _pageSize = 20;
  final _scrollController = ScrollController();
  var _pageState = _PageState.loading;

  void _getIssueDetails() {
    getRepoIssueDetails(widget.fullName, widget.number).then((value) {
      setState(() {
        if (value.success && value.data != null) {
          _issue = value.data!;
          _pageState = _PageState.done;
        } else {
          _pageState = _PageState.fail;
        }
      });
    });
  }

  void _loadIssueComments() {
    if (!_hasMore) {
      return;
    }
    getIssueComments("${_issue.repository?.fullName}", "${_issue.number}",
            _currentPage, _pageSize)
        .then((value) {
      if (value.success) {
        ++_currentPage;
        final dat = value.data ?? [];
        setState(() {
          _issueComments.addAll(dat);
          _hasMore = dat.length < _pageSize ? false : true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getIssueDetails();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalThemeWidget(child: Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Issue Details"),
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Builder(
                builder: (context) {
                  switch (_pageState) {
                    case _PageState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case _PageState.done:
                      return CustomScrollView(
                        controller: _scrollController,
                        slivers: [
                          _createIssueHeader(),
                          _createIssueContent(),
                          _createCommentHeader(),
                          _createCommentBody(),
                        ],
                      );
                    case _PageState.fail:
                      return TapToRetryWidget(
                          onTap: () {
                            setState(() {
                              _pageState = _PageState.loading;
                              _getIssueDetails();
                            });
                          },
                          message: "Tap To Retry");
                  }
                },
              )),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () {
              _scrollController.animateTo(0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.decelerate);
            },
            child: const Icon(Icons.arrow_drop_up, color: Colors.white),
            tooltip: "Top",
          ),
        );
      },
    ));
  }

  Widget _createCommentHeader() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        child: const Text(
          "Comments",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _createIssueHeader() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: GestureDetector(
                  child: ClipOval(
                    child: Image.network(
                      "${_issue.user?.avatarUrl}",
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "user_profile_page",
                        arguments: "${_issue.user?.login}");
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text("${_issue.user?.login}",
                  style: const TextStyle(color: Colors.grey)),
              const SizedBox(
                width: 10,
              ),
              Text(formatDate(_issue.createdAt ?? ''))
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "repository_detail_page",
                  arguments: widget.fullName);
            },
            child: Text(
              widget.fullName,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(height: 10),
          Text("${_issue.title}",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10)
        ],
      ),
    );
  }

  Widget _createIssueContent() {
    return SliverToBoxAdapter(
      child: MarkdownBody(
        shrinkWrap: true,
        selectable: true,
        data: "${_issue.body}",
      ),
    );
  }

  Widget _createCommentBody() {
    if (_hasMore && _issueComments.isEmpty) {
      _loadIssueComments();
    }
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      if (_hasMore && index == _issueComments.length - 1) {
        _loadIssueComments();
      }
      final item = _issueComments[index];
      return IssueCommentListItem(issue: item);
    }, childCount: _issueComments.length));
  }
}
