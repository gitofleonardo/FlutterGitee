import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/repo/bean/issue_result_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/ui/issue_comments_page.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/base_state.dart';
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

class _IssueDetailPageState extends BaseState<IssueDetailPage> {
  late IssueResultEntity _issue;
  final _scrollController = ScrollController();
  var _pageState = _PageState.loading;
  var _currentIndex = 0;
  final _pageController = PageController();
  late final TabController _tabController;

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

  @override
  void initState() {
    super.initState();
    _getIssueDetails();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).issueDetails),
        bottom: TabBar(
          tabs: _createTabs(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: [
          _createIssuePage(),
          IssueCommentsPage(fullName: widget.fullName, number: widget.number),
        ],
        controller: _tabController,
      ),
    );
  }

  List<Widget> _createTabs() {
    return [
      Tab(
          text: S.of(context).details,
          icon: const Icon(
            Icons.details,
          )),
      Tab(
        text: S.of(context).comment,
        icon: const Icon(Icons.message),
      ),
    ];
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

  Widget _createIssuePage() {
    switch (_pageState) {
      case _PageState.loading:
        return const Center(child: CircularProgressIndicator());
      case _PageState.done:
        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverPadding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                sliver: _createIssueHeader()),
            SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: _createIssueContent()),
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
            message: S.of(context).tapToRetry);
    }
  }
}
