import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/ui/view_picture_page.dart';
import 'package:flutter_gitee/main/events_page.dart';
import 'package:flutter_gitee/main/widget/theme_select_dialog.dart';
import 'package:flutter_gitee/repo/ui/my_repository_page.dart';
import 'package:flutter_gitee/repo/ui/repository_page.dart';
import 'package:flutter_gitee/user/bean/user_profile_entity.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends BaseState<StartPage> {
  var _userProfile = UserProfileEntity();
  Widget _currentPage = const EventsPage();
  late String _currentTitle;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _repoMenuExpanded = true;

  void _refreshProfile() {
    getMyUserProfile().then((value) {
      if (value.state == BaseStatus.success && value.data != null) {
        setState(() {
          _userProfile = value.data!;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshProfile();
  }

  @override
  Widget create(BuildContext context) {
    _currentTitle = S.of(context).events;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_currentTitle),
        centerTitle: true,
        elevation: 0,
      ),
      body: _currentPage,
      drawer: _createDrawer(),
      floatingActionButton: _createFab(),
    );
  }

  Widget _createFab() {
    return Builder(builder: (context) {
      return FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          Navigator.pushNamed(context, "search_page");
        },
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      );
    });
  }

  Widget _createDrawerHeader() {
    return LayoutBuilder(builder: (context, constraints) {
      return DrawerHeader(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        margin: EdgeInsets.zero,
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, "view_picture_page",
                          //     arguments: _userProfile.avatarUrl ?? "");
                          Navigator.push(context, PageRouteBuilder(
                              pageBuilder: (context, anim, secondaryAnim) {
                            return FadeTransition(
                                opacity: anim,
                                child: ViewPicturePage(
                                    url: "${_userProfile.avatarUrl}"));
                          }));
                        },
                        child: Builder(
                          builder: (context) {
                            if (_userProfile.avatarUrl == null) {
                              return Image.asset(
                                "assets/images/person.png",
                                fit: BoxFit.fill,
                              );
                            } else {
                              return Hero(
                                  tag: "${_userProfile.avatarUrl}",
                                  child: Image.network(
                                    _userProfile.avatarUrl ?? "",
                                    fit: BoxFit.fill,
                                  ));
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 64,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              _userProfile.name ?? "null",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(_userProfile.login ?? "",
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 18),
                                overflow: TextOverflow.ellipsis)
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {
                            _selectTheme(context);
                          },
                          icon: const Icon(
                            Icons.palette,
                            color: Colors.white,
                          )))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  const Icon(Icons.person, color: Colors.white),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "follower_page",
                          arguments: _userProfile.login);
                    },
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "${_userProfile.followers ?? 0}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: " ${S.of(context).followers}",
                          style: const TextStyle(fontWeight: FontWeight.normal))
                    ], style: const TextStyle(color: Colors.white))),
                  ),
                  const Text(" · ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "following_page",
                          arguments: _userProfile.login);
                    },
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "${_userProfile.following ?? 0}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "  ${S.of(context).followings}",
                          style: const TextStyle(fontWeight: FontWeight.normal))
                    ], style: const TextStyle(color: Colors.white))),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _createDrawerMenus() {
    return LayoutBuilder(builder: (context, constraints) {
      final themePrimary = Theme.of(context).primaryColor;
      return SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.event, color: themePrimary),
              title: Text(S.of(context).events),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentTitle = S.of(context).events;
                  _currentPage = const EventsPage();
                });
              },
            ),
            ExpansionTile(
              initiallyExpanded: _repoMenuExpanded,
              leading: const Icon(Icons.book),
              title: Text(S.of(context).repository),
              onExpansionChanged: (expanded) {
                _repoMenuExpanded = expanded;
              },
              children: [
                ListTile(
                  leading: Icon(Icons.book, color: themePrimary),
                  title: Text(S.of(context).myRepository),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentTitle = S.of(context).myRepository;
                      _currentPage = const MyRepositoryPage();
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.star, color: themePrimary),
                  title: Text(S.of(context).starredRepository),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentTitle = S.of(context).starredRepository;
                      _currentPage =
                          const RepositoryPage(type: RepositoryType.star);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.remove_red_eye, color: themePrimary),
                  title: Text(S.of(context).watchedRepository),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentTitle = S.of(context).watchedRepository;
                      _currentPage =
                          const RepositoryPage(type: RepositoryType.watch);
                    });
                  },
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
            TextButton(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                child: Text(S.of(context).logout)),
          ],
        ),
      );
    });
  }

  Widget _createDrawer() {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child: Flex(
            direction: Axis.vertical,
            children: [
              _createDrawerHeader(),
              Expanded(child: _createDrawerMenus())
            ],
          )),
    );
  }

  void _selectTheme(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Builder(builder: (context) {
            return ThemeSelectDialog(
                context: context,
                onSelect: (t) {
                  setState(() {
                    theme = t;
                  });
                  Navigator.pop(context);
                });
          });
        });
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(S.of(context).confirmLogout),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(S.of(context).no)),
              TextButton(
                onPressed: () {
                  logout();
                  Navigator.pop(context);
                },
                child: Text(S.of(context).yes),
              )
            ],
          );
        });
  }
}
