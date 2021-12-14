import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/user/bean/result/success/user_profile_entity.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';
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
  var _followState = _FollowState.unknown;
  var _state = _PageState.loading;

  Future<void> _getUserProfile() async {
    setState(() {
      _state = _PageState.loading;
    });
    final profile = await getUserProfile(widget.user);
    final follow = await _getFollowState();
    if (profile.success && (follow.success || follow.resultCode == 404)) {
      _profile = profile.data!;
      setState(() {
        _state = _PageState.finished;
        if (follow.success) {
          _followState = _FollowState.follow;
        } else {
          _followState = _FollowState.noFollow;
        }
      });
    } else {
      setState(() {
        _state = _PageState.failed;
      });
    }
  }

  Future<BaseResult<String>> _getFollowState() {
    return getUserFollowState(widget.user);
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
    _getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalThemeWidget(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("User Profile"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Builder(
          builder: (context) {
            switch (_state) {
              case _PageState.loading:
                return _ProfileLoadingWidget();
              case _PageState.finished:
                return _createProfileContent();
              case _PageState.failed:
                return TapToRetryWidget(
                    onTap: _getUserProfile, message: "Tap to retry");
            }
          },
        ),
      ),
    ));
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
          elevation: 5,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.message_outlined,
                    color: Theme.of(context).colorScheme.primary),
                title: const Text("Bio"),
                subtitle: Text(_profile.bio ?? 'Empty'),
              ),
              ListTile(
                leading: Icon(Icons.email,
                    color: Theme.of(context).colorScheme.primary),
                title: const Text("Email"),
                subtitle: Text(_profile.email ?? 'Empty'),
              ),
              ListTile(
                leading: Icon(Icons.house_sharp,
                    color: Theme.of(context).colorScheme.primary),
                title: const Text("Company"),
                subtitle: Text(_profile.company ?? "Empty"),
              ),
              ListTile(
                leading: Icon(Icons.forum,
                    color: Theme.of(context).colorScheme.primary),
                title: const Text("Blog"),
                subtitle: Text(_profile.blog ?? "Empty"),
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
                          color: Theme.of(context).colorScheme.primary,
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
                              label: const Text("Followed"));
                        case _FollowState.noFollow:
                          return TextButton(
                              onPressed: () {
                                _followUser();
                              },
                              child: const Text("Follow"));
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
                          color: Theme.of(context).colorScheme.primary),
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
                          const TextSpan(
                              text: "  Followers",
                              style: TextStyle(fontWeight: FontWeight.normal))
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
                          const TextSpan(
                              text: "  Followings",
                              style: TextStyle(fontWeight: FontWeight.normal))
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
