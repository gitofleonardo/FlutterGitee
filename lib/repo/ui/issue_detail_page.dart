import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/repo/bean/issue_comment_entity.dart';
import 'package:flutter_gitee/repo/bean/issue_result_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
  late Future<BaseResult<IssueResultEntity>> _issueFuture;
  var _hasMore = false;
  var _currentPage = 1;
  final _pageSize = 20;
  final _scrollController = ScrollController();

  Future<BaseResult<IssueResultEntity>> _getIssueDetails() {
    return getRepoIssueDetails(widget.fullName, widget.number);
  }

  void _loadIssueComments() {
    getIssueComments("${_issue.repository?.fullName}", "${_issue.number}",
            _currentPage, _pageSize)
        .then((value) {
      if (value.success) {
        ++_currentPage;
        final dat = value.data ?? [];
        _issueComments.addAll(dat);
        setState(() {
          _hasMore = dat.length < _pageSize ? false : true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _issueFuture = _getIssueDetails();
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
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: FutureBuilder<BaseResult<IssueResultEntity>>(
              future: _issueFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final data = snapshot.data;
                  if (data == null || !data.success || data.data == null) {
                    return TapToRetryWidget(
                        onTap: () {}, message: "Tap To Retry");
                  }
                  _issue = data.data!;
                  _loadIssueComments();
                  return CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      _createIssueHeader(),
                      _createIssueContent(),
                      _createCommentHeader(),
                      _createCommentBody(),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
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
          Text(widget.fullName, style: const TextStyle(color: Colors.grey)),
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
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      final item = _issueComments[index];
      return ListTile(
        leading: SizedBox(
          width: 24,
          height: 24,
          child: ClipOval(
            child: Image.network("${item.user?.avatarUrl}"),
          ),
        ),
        title: Text("${item.user?.login}"),
        subtitle: MarkdownBody(data: "${item.body}"),
        trailing: Text(formatDate("${item.createdAt}"),
            style: const TextStyle(color: Colors.grey, fontSize: 12)),
      );
    }, childCount: _issueComments.length));
  }
}
