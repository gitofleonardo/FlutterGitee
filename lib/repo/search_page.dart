import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/issue_search_page.dart';
import 'package:flutter_gitee/repo/repo_search_page.dart';
import 'package:flutter_gitee/repo/user_search_page.dart';
import 'package:flutter_gitee/repo/widget/inherited_search_widget.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends BaseState<SearchPage>
    with SingleTickerProviderStateMixin {
  final _tabPages = [
    const RepoSearchPage(),
    const UserSearchPage(),
    const IssueSearchPage()
  ];
  final _tabs = const [
    Tab(
      text: "Repository",
      icon: Icon(Icons.book),
    ),
    Tab(
      text: "User",
      icon: Icon(Icons.person),
    ),
    Tab(
      text: "Issue",
      icon: Icon(Icons.question_answer),
    )
  ];
  late final TabController _tabController;
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();
  var _searchText = "";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalThemeWidget(
      child: InheritedSearchWidget(
        searchText: _searchText,
        searchChild: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              tabs: _tabs,
            ),
            title: TextField(
              focusNode: _focusNode,
              controller: _searchController,
              maxLines: 1,
              decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.white),
                  hintText: "Search repository, user or issue",
                  suffixIcon: IconButton(
                      onPressed: _onSearch,
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ))),
            ),
          ),
          body: TabBarView(
            children: _tabPages,
            controller: _tabController,
          ),
        ),
      ),
    );
  }

  void _onSearch() {
    FocusScope.of(context).unfocus();
    final keyword = _searchController.text.trim();
    if (keyword.isEmpty) {
      _showHintSnackBar("Empty search text");
      return;
    }
    setState(() {
      _searchText = _searchController.text;
    });
  }

  void _showHintSnackBar(String hint) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(hint),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
        },
      ),
    ));
  }
}
