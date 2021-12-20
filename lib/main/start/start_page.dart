import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/ui/view_picture_page.dart';
import 'package:flutter_gitee/main/events_page.dart';
import 'package:flutter_gitee/main/widget/theme_select_dialog.dart';
import 'package:flutter_gitee/repo/ui/my_repository_page.dart';
import 'package:flutter_gitee/repo/ui/repository_page.dart';
import 'package:flutter_gitee/user/bean/result/success/user_profile_entity.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends BaseState<StartPage> {
  final _baseKey = GlobalKey<GlobalThemeWidgetState>();
  var _userProfile = UserProfileEntity();
  Widget _currentPage = const EventsPage();
  String _currentTitle = "Events";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _repoMenuExpanded = true;

  void _refreshProfile() {
    getMyUserProfile().then((value) {
      checkRequestBaseResult(value);
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
  Widget build(BuildContext context) {
    return GlobalThemeWidget(
      key: _baseKey,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(_currentTitle),
          centerTitle: true,
          elevation: 0,
        ),
        body: _currentPage,
        drawer: _createDrawer(),
        floatingActionButton: _createFab(),
      ),
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
                      const TextSpan(
                          text: "  Followers",
                          style: TextStyle(fontWeight: FontWeight.normal))
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
                      const TextSpan(
                          text: "  Followings",
                          style: TextStyle(fontWeight: FontWeight.normal))
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
              title: const Text("Events"),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentTitle = "Events";
                  _currentPage = const EventsPage();
                });
              },
            ),
            ExpansionTile(
              initiallyExpanded: _repoMenuExpanded,
              leading: const Icon(Icons.book),
              title: const Text("Repository"),
              onExpansionChanged: (expanded) {
                _repoMenuExpanded = expanded;
              },
              children: [
                ListTile(
                  leading: Icon(Icons.book, color: themePrimary),
                  title: const Text("My Repository"),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentTitle = "My Repository";
                      _currentPage = const MyRepositoryPage();
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.star, color: themePrimary),
                  title: const Text("Starred Repository"),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentTitle = "Starred Repository";
                      _currentPage =
                          const RepositoryPage(type: RepositoryType.star);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.remove_red_eye, color: themePrimary),
                  title: const Text("Watched Repository"),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentTitle = "Watched Repository";
                      _currentPage =
                          const RepositoryPage(type: RepositoryType.watch);
                    });
                  },
                )
              ],
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.infoCircle, color: themePrimary),
              title: const Text("About"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "about_page");
              },
            ),
            TextButton(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                child: const Text("Logout")),
          ],
        ),
      );
    });
  }

  Widget _createDrawer() {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child: Column(
            children: [_createDrawerHeader(), _createDrawerMenus()],
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
                onSelect: (theme) {
                  _baseKey.currentState?.updateTheme(theme);
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
            title: const Text("Confirm Logout"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No")),
              TextButton(
                onPressed: () {
                  routeToLogin();
                  Navigator.pop(context);
                },
                child: const Text("Yes"),
              )
            ],
          );
        });
  }
}
