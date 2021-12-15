import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/widget/general_bottom_sheet_header.dart';
import 'package:flutter_gitee/main/base/widget/my_radio_list_tile.dart';
import 'package:flutter_gitee/repo/attrs/filter_attrs.dart';
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
    with TickerProviderStateMixin {
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
  final _repoFilterTabs = [
    const Tab(text: "Language"),
    const Tab(
      text: "Sort",
    ),
    const Tab(
      text: "Order",
    ),
    const Tab(
      text: "Fork",
    )
  ];

  final _userFilterTabs = [const Tab(text: "Order"), const Tab(text: "Sort")];

  final _issueFilterTabs = [
    const Tab(
      text: "Language",
    ),
    const Tab(
      text: "State",
    ),
    const Tab(
      text: "Sort",
    ),
    const Tab(
      text: "Order",
    )
  ];

  late final TabController _tabController;
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();
  var _searchText = "";
  final _repoFilter = RepositoryFilter();
  final _issueFilter = IssueFilter();
  final _userFilter = UserFilter();
  late final TabController _repoFilterTabController;
  late final TabController _userFilterTabController;
  late final TabController _issueFilterTabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _repoFilterTabController =
        TabController(length: _repoFilterTabs.length, vsync: this);
    _userFilterTabController =
        TabController(length: _userFilterTabs.length, vsync: this);
    _issueFilterTabController =
        TabController(length: _issueFilterTabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _repoFilterTabController.dispose();
    _userFilterTabController.dispose();
    _issueFilterTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalThemeWidget(
      child: InheritedSearchWidget(
        repoFilter: RepositoryFilter.from(_repoFilter),
        issueFilter: IssueFilter.from(_issueFilter),
        userFilter: UserFilter.from(_userFilter),
        searchText: _searchText,
        searchChild: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              tabs: _tabs,
            ),
            title: TextField(
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  setState(() {
                    _searchText = value;
                  });
                  FocusScope.of(context).unfocus();
                }
              },
              textInputAction: TextInputAction.search,
              focusNode: _focusNode,
              controller: _searchController,
              maxLines: 1,
              decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintStyle: const TextStyle(color: Colors.white),
                  hintText: "Search repository, user or issue",
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: _onSearch,
                  )),
            ),
          ),
          body: TabBarView(
            children: _tabPages,
            controller: _tabController,
          ),
          floatingActionButton: Builder(
            builder: (context) {
              return FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  _createFilterSelection(context);
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _createFilterSelection(BuildContext context) {
    switch (_tabController.index) {
      case 0:
        _showRepoFilterSelection(context);
        break;
      case 1:
        _showUserFilterSelection(context);
        break;
      case 2:
        _showIssueFilterSelection(context);
        break;
    }
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

  /// Here below is all the about issue filter selection bottom sheet
  void _showIssueFilterSelection(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Builder(
            builder: (context) {
              return HeaderContentBottomSheet(
                title: "Issue Filter",
                body: Flex(
                  direction: Axis.vertical,
                  children: [
                    TabBar(
                      tabs: _issueFilterTabs,
                      controller: _issueFilterTabController,
                    ),
                    Expanded(
                        child: TabBarView(
                            controller: _issueFilterTabController,
                            children: [
                          _createIssueLanguageSelection(),
                          _createIssueStateSelection(),
                          _createIssueSortSelection(),
                          _createIssueSortDirectionSelection()
                        ]))
                  ],
                ),
              );
            },
          );
        });
  }

  Widget _createIssueSortSelection() {
    final sorts = IssueFilterSort.values.map((e) {
      final String title;
      switch (e) {
        case IssueFilterSort.createAt:
          title = "Creation Time";
          break;
        case IssueFilterSort.updatedAt:
          title = "Update Time";
          break;
        case IssueFilterSort.notesCount:
          title = "Notes Count";
          break;
      }
      return MyRadioListTile(
          myTitle: Text(title),
          value: e,
          groupValue: _issueFilter.sort,
          onChanged: (value) {
            setState(() {
              if (value == _issueFilter.sort) {
                _issueFilter.sort = null;
              } else {
                _issueFilter.sort = value as IssueFilterSort;
              }
            });
            Navigator.pop(context);
          });
    }).toList();
    return ListView(children: sorts);
  }

  Widget _createIssueLanguageSelection() {
    final children = languages.map((e) {
      return MyRadioListTile(
          toggleable: true,
          myTitle: Text(e),
          value: e,
          groupValue: _issueFilter.language,
          onChanged: (value) {
            if (value == _issueFilter.language) {
              setState(() {
                _issueFilter.language = null;
              });
            } else {
              setState(() {
                _issueFilter.language = value as String?;
              });
            }
            Navigator.pop(context);
          });
    }).toList();
    return ListView(
      children: children,
    );
  }

  Widget _createIssueStateSelection() {
    final states = IssueState.values.map((e) {
      final String title;
      switch (e) {
        case IssueState.open:
          title = "Open";
          break;
        case IssueState.progressing:
          title = "Progressing";
          break;
        case IssueState.closed:
          title = "Closed";
          break;
        case IssueState.rejected:
          title = "Rejected";
          break;
      }
      return MyRadioListTile(
          myTitle: Text(title),
          value: e,
          groupValue: _issueFilter.state,
          onChanged: (value) {
            setState(() {
              if (value == _issueFilter.state) {
                _issueFilter.state = null;
              } else {
                _issueFilter.state = value as IssueState;
              }
            });
            Navigator.pop(context);
          });
    }).toList();
    return ListView(children: states);
  }

  Widget _createIssueSortDirectionSelection() {
    final orders = SortDirection.values.map((e) {
      final String title;
      switch (e) {
        case SortDirection.asc:
          title = "ASC";
          break;
        case SortDirection.desc:
          title = "DESC";
          break;
      }
      return MyRadioListTile(
          myTitle: Text(title),
          toggleable: true,
          value: e,
          groupValue: _issueFilter.order,
          onChanged: (value) {
            setState(() {
              if (value == _issueFilter.order) {
                _issueFilter.order = null;
              } else {
                _issueFilter.order = value as SortDirection;
              }
            });
            Navigator.pop(context);
          });
    }).toList();
    return ListView(
      children: orders,
    );
  }

  /// Here below is all about the user filter selection bottom sheet
  void _showUserFilterSelection(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Builder(
            builder: (context) {
              return HeaderContentBottomSheet(
                title: "User Filter",
                body: Flex(
                  direction: Axis.vertical,
                  children: [
                    TabBar(
                      tabs: _userFilterTabs,
                      controller: _userFilterTabController,
                    ),
                    Expanded(
                        child: TabBarView(
                            controller: _userFilterTabController,
                            children: [
                          _createUserSortSelection(),
                          _createUserSortOrderSelection()
                        ]))
                  ],
                ),
              );
            },
          );
        });
  }

  Widget _createUserSortSelection() {
    return MyRadioListTile(
        myTitle: const Text("Join Gitee Time"),
        value: UserFilterSort.joinedAt,
        groupValue: _userFilter.sort,
        onChanged: (value) {
          setState(() {
            if (value == _userFilter.sort) {
              _userFilter.sort = null;
            } else {
              _userFilter.sort = value as UserFilterSort;
            }
          });
          Navigator.pop(context);
        });
  }

  Widget _createUserSortOrderSelection() {
    final orders = SortDirection.values.map((e) {
      final String title;
      switch (e) {
        case SortDirection.asc:
          title = "ASC";
          break;
        case SortDirection.desc:
          title = "DESC";
          break;
      }
      return MyRadioListTile(
          myTitle: Text(title),
          toggleable: true,
          value: e,
          groupValue: _userFilter.order,
          onChanged: (value) {
            setState(() {
              if (value == _repoFilter.order) {
                _userFilter.order = null;
              } else {
                _userFilter.order = value as SortDirection;
              }
            });
            Navigator.pop(context);
          });
    }).toList();
    return ListView(
      children: orders,
    );
  }

  /// Here below is all about the repository filter selection bottom sheet
  Widget _createRepoLanguageSelection() {
    final children = languages.map((e) {
      return MyRadioListTile(
          toggleable: true,
          myTitle: Text(e),
          value: e,
          groupValue: _repoFilter.language,
          onChanged: (value) {
            if (value == _repoFilter.language) {
              setState(() {
                _repoFilter.language = null;
              });
            } else {
              setState(() {
                _repoFilter.language = value as String?;
              });
            }
            Navigator.pop(context);
          });
    }).toList();
    return ListView(
      children: children,
    );
  }

  Widget _createRepoSortOrderSelection() {
    final orders = SortDirection.values.map((e) {
      final String title;
      switch (e) {
        case SortDirection.asc:
          title = "ASC";
          break;
        case SortDirection.desc:
          title = "DESC";
          break;
      }
      return MyRadioListTile(
          myTitle: Text(title),
          toggleable: true,
          value: e,
          groupValue: _repoFilter.order,
          onChanged: (value) {
            setState(() {
              if (value == _repoFilter.order) {
                _repoFilter.order = null;
              } else {
                _repoFilter.order = value as SortDirection;
              }
            });
            Navigator.pop(context);
          });
    }).toList();
    return ListView(
      children: orders,
    );
  }

  Widget _createRepoForkSelection() {
    return ListView(
      children: [
        MyRadioListTile(
            toggleable: true,
            myTitle: const Text("True"),
            value: true,
            groupValue: _repoFilter.fork,
            onChanged: (value) {
              setState(() {
                if (value == _repoFilter.fork) {
                  _repoFilter.fork = null;
                } else {
                  _repoFilter.fork = value as bool;
                }
              });
              Navigator.pop(context);
            }),
        MyRadioListTile(
            myTitle: const Text("False"),
            value: false,
            groupValue: _repoFilter.fork,
            onChanged: (value) {
              setState(() {
                if (value == _repoFilter.fork) {
                  _repoFilter.fork = null;
                } else {
                  _repoFilter.fork = value as bool;
                }
              });
              Navigator.pop(context);
            }),
      ],
    );
  }

  Widget _createRepoSortSelection() {
    final choices = RepositoryFilterSort.values.map((e) {
      final String title;
      switch (e) {
        case RepositoryFilterSort.lastPushAt:
          title = "Last Push Time";
          break;
        case RepositoryFilterSort.starsCount:
          title = "Stars Count";
          break;
        case RepositoryFilterSort.forksCount:
          title = "Forks Count";
          break;
        case RepositoryFilterSort.watchesCount:
          title = "Watches Count";
          break;
      }
      return MyRadioListTile(
          toggleable: true,
          myTitle: Text(title),
          value: e,
          groupValue: _repoFilter.sort,
          onChanged: (value) {
            setState(() {
              if (value == _repoFilter.sort) {
                _repoFilter.sort = null;
              } else {
                _repoFilter.sort = value as RepositoryFilterSort;
              }
            });
            Navigator.pop(context);
          });
    }).toList();
    return ListView(
      children: choices,
    );
  }

  void _showRepoFilterSelection(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Builder(
            builder: (context) {
              return HeaderContentBottomSheet(
                title: "Repository Filter",
                body: Flex(
                  direction: Axis.vertical,
                  children: [
                    TabBar(
                      tabs: _repoFilterTabs,
                      controller: _repoFilterTabController,
                    ),
                    Expanded(
                        child: TabBarView(
                            controller: _repoFilterTabController,
                            children: [
                          _createRepoLanguageSelection(),
                          _createRepoSortSelection(),
                          _createRepoSortOrderSelection(),
                          _createRepoForkSelection(),
                        ]))
                  ],
                ),
              );
            },
          );
        });
  }
}
