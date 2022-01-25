import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/user/bean/user_profile_entity.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/user/profile/user_events_page.dart';
import 'package:flutter_gitee/user/profile/user_repository_page.dart';
import 'package:flutter_gitee/utils/global_context.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:shimmer/shimmer.dart';

enum _FollowState { unknown, follow, noFollow }
enum _PageState { loading, finished, failed }

class UserProfilePage extends StatefulWidget {
  final String user;
  const UserProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends BaseState<UserProfilePage> {
  late UserProfileEntity _profile;
  late final Future<UserProfileEntity?> _profileFuture =
      _getUserProfileFuture();
  var _followState = _FollowState.unknown;
  late final List<Widget> _tabPages = [
    UserEventsPage(username: widget.user),
    UserRepositoryPage(username: widget.user)
  ];
  late final tabs = [S.of(context).events, S.of(context).repository];

  Future<UserProfileEntity?> _getUserProfileFuture() async {
    final res = await getUserProfile(widget.user);
    if (!res.success || res.data == null) {
      return null;
    }
    return res.data!;
  }

  void _getFollowState() {
    getUserFollowState(widget.user).then((value) {
      setState(() {
        if (value.success) {
          _followState = _FollowState.follow;
        } else if (value.resultCode == 404) {
          _followState = _FollowState.noFollow;
        } else {
          _followState = _FollowState.unknown;
        }
      });
    });
  }

  void _followUser() {
    followUser("${_profile.login}").then((value) {
      if (value.success) {
        setState(() {
          _followState = _FollowState.follow;
        });
      }
    });
  }

  void _unfollowUser() {
    unfollow(user: "${_profile.login}").then((value) {
      if (value.state == BaseStatus.success) {
        setState(() {
          _followState = _FollowState.noFollow;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserProfileEntity?>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data;
            if (data == null) {
              return TapToRetryWidget(
                onTap: () {
                  setState(() {});
                },
                message: S.of(context).tapToRetry,
              );
            }
            _profile = data;
            _getFollowState();
            return _createProfilePage();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: _profileFuture,
      ),
    );
  }

  Widget _createProfilePage() {
    return DefaultTabController(
      length: tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            _createAppBar(innerBoxIsScrolled),
          ];
        },
        body: TabBarView(
          children: _tabPages,
        ),
      ),
    );
  }

  SliverAppBar _createAppBar(bool innerBoxIsScrolled) {
    final actions = <Widget>[];
    if (_profile.login != globalProfile?.login) {
      final IconData iconData;
      final VoidCallback followFunc;
      final String tooltip;
      switch (_followState) {
        case _FollowState.unknown:
        case _FollowState.noFollow:
          iconData = Icons.star_border;
          followFunc = _followUser;
          tooltip = S.of(context).follow;
          break;
        case _FollowState.follow:
          iconData = Icons.star;
          followFunc = _unfollowUser;
          tooltip = S.of(context).unfollow;
          break;
      }
      final followBtn = IconButton(
        onPressed: followFunc,
        icon: Icon(
          iconData,
          color: theme.theme.colorScheme.onPrimary,
        ),
        tooltip: tooltip,
      );
      actions.add(followBtn);
    }

    return SliverAppBar(
      forceElevated: innerBoxIsScrolled,
      toolbarHeight: 52,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "view_picture_page",
                    arguments: "${_profile.avatarUrl}");
              },
              child: Container(
                constraints:
                    const BoxConstraints.tightFor(width: 32, height: 32),
                child: ClipOval(
                  child: Image.network(
                    "${_profile.avatarUrl}",
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
            ),
          ),
          Text("${_profile.login}")
        ],
      ),
      pinned: true,
      floating: true,
      bottom: TabBar(
        tabs: tabs
            .map(
              (e) => Tab(
                text: e,
              ),
            )
            .toList(),
      ),
      actions: actions,
    );
  }

  Widget _createProfileContent() {
    return Builder(builder: (context) {
      return SingleChildScrollView(
        child: Column(
          children: [_createProfileHeader(), _createProfileDetail()],
        ),
      );
    });
  }

  Widget _createProfileDetail() {
    return Builder(
      builder: (context) {
        return Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          elevation: 5,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.message_outlined,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
                title: Text(S.of(context).bio),
                subtitle: Text(_profile.bio ?? S.of(context).empty),
              ),
              ListTile(
                leading: Icon(Icons.email,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
                title: Text(S.of(context).email),
                subtitle: Text(_profile.email ?? S.of(context).empty),
              ),
              ListTile(
                leading: Icon(Icons.house_sharp,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
                title: Text(S.of(context).company),
                subtitle: Text(_profile.company ?? S.of(context).empty),
              ),
              ListTile(
                leading: Icon(Icons.forum,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
                title: Text(S.of(context).blog),
                subtitle: Text(_profile.blog ?? S.of(context).empty),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _createProfileHeader() {
    return Builder(
      builder: (context) {
        return Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "view_picture_page",
                            arguments: "${_profile.avatarUrl}");
                      },
                      child: Hero(
                        tag: "${_profile.avatarUrl}",
                        child: ClipOval(
                          child: Image.network(
                            "${_profile.avatarUrl}",
                            width: 64,
                            height: 64,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      "${_profile.login}",
                      style: TextStyle(
                          fontSize: 24,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Builder(builder: (context) {
                      switch (_followState) {
                        case _FollowState.unknown:
                          return Container();
                        case _FollowState.follow:
                          return TextButton.icon(
                              onPressed: () {
                                _unfollowUser();
                              },
                              icon: const Icon(Icons.check),
                              label: Text(S.of(context).followed));
                        case _FollowState.noFollow:
                          return TextButton(
                              onPressed: () {
                                _followUser();
                              },
                              child: Text(S.of(context).follow));
                      }
                    })
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.person,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "follower_page",
                              arguments: _profile.login);
                        },
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "${_profile.followers ?? 0}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "  ${S.of(context).followers}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal))
                        ])),
                      ),
                      const Text(" · ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "following_page",
                              arguments: _profile.login);
                        },
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "${_profile.following ?? 0}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "  ${S.of(context).followings}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal))
                        ])),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ProfileLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _createSizedShimmer(63, 64),
                const SizedBox(
                  width: 10,
                ),
                _createSizedShimmer(200, 24)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _createSizedShimmer(300, 30),
            const SizedBox(height: 20),
            _createSizedShimmer(100, 20),
            const SizedBox(
              height: 20,
            ),
            _createSizedShimmer(300, 30),
            const SizedBox(height: 20),
            _createSizedShimmer(200, 20),
            const SizedBox(
              height: 20,
            ),
            _createSizedShimmer(300, 30),
            const SizedBox(height: 20),
            _createSizedShimmer(200, 20),
          ],
        ),
        baseColor: Colors.grey,
        highlightColor: Colors.white);
  }

  Widget _createSizedShimmer(double width, double height) {
    return Container(
      constraints: BoxConstraints(maxWidth: width, maxHeight: height),
      color: Colors.black26,
    );
  }
}
