import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/repo/bean/issue_result_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/ui/issue_comments_page.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  final _scrollController = ScrollController();
  var _pageState = _PageState.loading;
  var _currentIndex = 0;
  final _pageController = PageController();

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
  }

  @override
  Widget build(BuildContext context) {
    return GlobalThemeWidget(child: Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Issue Details"),
          ),
          body: PageView(
            children: [
              _createIssuePage(),
              IssueCommentsPage(
                  fullName: widget.fullName, number: widget.number)
            ],
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          bottomNavigationBar: _createBottomNavigation(),
        );
      },
    ));
  }

  Widget _createBottomNavigation() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.dotCircle), label: "Details"),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "Comments")
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(_currentIndex,
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate);
        });
      },
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
            message: "Tap To Retry");
    }
  }
}
