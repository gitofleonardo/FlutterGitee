import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/start/home/event/events_page.dart';
import 'package:flutter_gitee/main/start/home/home_widget.dart';
import 'package:flutter_gitee/main/start/home/message/message_page.dart';
import 'package:flutter_gitee/main/start/home/repository/repository_related_page.dart';
import 'package:flutter_gitee/main/start/home/start_page_events.dart';
import 'package:flutter_gitee/repo/ui/my_repository_page.dart';
import 'package:flutter_gitee/repo/ui/repository_page.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/utils/global_context.dart';
import 'package:flutter_gitee/utils/global_events.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'more/more_page.dart';

final startPageBus = EventBus(sync: true);

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  StartPageState createState() => StartPageState();

  static StartPageState? of(BuildContext context) {
    return context.findAncestorStateOfType<StartPageState>();
  }
}

class StartPageState extends BaseState<StartPage> {
  Widget _currentPage = const EventsPage();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _repoMenuExpanded = true;
  final _pageController = PageController();
  var _currentPageIndex = 0;
  final List<StatefulWidget> _homePages = const [
    EventsPage(),
    MessagePage(),
    RepositoryRelatedPage(),
    MorePage()
  ];

  void _refreshProfile() {
    getMyUserProfile().then((value) {
      if (value.state == BaseStatus.success && value.data != null) {
        globalEventBus.fire(ProfileEvent(value.data!));
      }
    });
  }

  void jumpTo(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _refreshProfile();
  }

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: _homePages,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
      bottomNavigationBar: _createBottomNav(),
    );
  }

  Widget _createBottomNav() {
    return BottomNavigationBar(
      backgroundColor: theme.theme.colorScheme.background,
      selectedIconTheme: IconThemeData(
        color: theme.theme.colorScheme.primary.withAlpha(200),
      ),
      unselectedIconTheme: IconThemeData(
        color: theme.theme.colorScheme.primary.withAlpha(50),
      ),
      selectedLabelStyle: TextStyle(
        color: theme.theme.colorScheme.primary.withAlpha(200),
      ),
      unselectedLabelStyle: TextStyle(
        color: theme.theme.colorScheme.primary.withAlpha(50),
      ),
      selectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      iconSize: 26,
      items: _homePages.map((e) {
        final page = e as HomeWidget;
        return BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: AnimatedContainer(
                decoration: BoxDecoration(
                    color: (_homePages[_currentPageIndex] == e)
                        ? theme.theme.colorScheme.primary.withAlpha(50)
                        : Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    shape: BoxShape.rectangle),
                duration: const Duration(milliseconds: 250),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                child: page.getIcon(),
              ),
            ),
            label: page.getText(context));
      }).toList(),
      currentIndex: _currentPageIndex,
      onTap: (index) {
        if (index == _currentPageIndex) {
          startPageBus.fire(TabReselectEvent(index));
        }
        setState(() {
          _currentPageIndex = index;
        });
        _pageController.jumpToPage(
          index,
        );
      },
    );
  }

  Widget _createDrawerMenus() {
    return LayoutBuilder(builder: (context, constraints) {
      final themePrimary = Theme.of(context).colorScheme.secondary;
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: ListTile(
                leading: Icon(Icons.event, color: themePrimary),
                title: Text(S.of(context).events),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _currentPage = const EventsPage();
                  });
                },
                style: ListTileStyle.drawer,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(100)),
                ),
                selected: _currentPage is EventsPage,
                selectedTileColor:
                    theme.theme.colorScheme.primary.withAlpha(50),
              ),
            ),
            ExpansionTile(
              initiallyExpanded: _repoMenuExpanded,
              leading: const Icon(Icons.book),
              title: Text(S.of(context).repository),
              onExpansionChanged: (expanded) {
                _repoMenuExpanded = expanded;
              },
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  child: ListTile(
                    leading: Icon(Icons.book, color: themePrimary),
                    title: Text(S.of(context).myRepository),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _currentPage = const MyRepositoryPage();
                      });
                    },
                    style: ListTileStyle.drawer,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(100)),
                    ),
                    selected: _currentPage is MyRepositoryPage,
                    selectedTileColor:
                        theme.theme.colorScheme.primary.withAlpha(50),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  child: ListTile(
                    leading: Icon(Icons.star, color: themePrimary),
                    title: Text(S.of(context).starredRepository),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _currentPage =
                            const RepositoryPage(type: RepositoryType.star);
                      });
                    },
                    style: ListTileStyle.drawer,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(100)),
                    ),
                    selected: _currentPage is RepositoryPage &&
                        ((_currentPage) as RepositoryPage).type ==
                            RepositoryType.star,
                    selectedTileColor:
                        theme.theme.colorScheme.primary.withAlpha(50),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  child: ListTile(
                    leading: Icon(Icons.remove_red_eye, color: themePrimary),
                    title: Text(S.of(context).watchedRepository),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _currentPage =
                            const RepositoryPage(type: RepositoryType.watch);
                      });
                    },
                    style: ListTileStyle.drawer,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(100)),
                    ),
                    selected: _currentPage is RepositoryPage &&
                        ((_currentPage) as RepositoryPage).type ==
                            RepositoryType.watch,
                    selectedTileColor:
                        theme.theme.colorScheme.primary.withAlpha(50),
                  ),
                )
              ],
            ),
            ListTile(
              leading:
                  Icon(FontAwesomeIcons.questionCircle, color: themePrimary),
              title: Text(S.of(context).issues),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "my_issue_page");
              },
            ),
            ListTile(
              leading: Icon(Icons.language, color: themePrimary),
              title: Text(S.of(context).language),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "language_page");
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.infoCircle, color: themePrimary),
              title: Text(S.of(context).about),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "about_page");
              },
            ),
            TextButton(onPressed: () {}, child: Text(S.of(context).logout)),
          ],
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
