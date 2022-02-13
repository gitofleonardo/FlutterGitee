import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/start/home/home_widget.dart';
import 'package:flutter_gitee/main/start/home/start_page.dart';
import 'package:flutter_gitee/user/bean/user_profile_entity.dart';
import 'package:flutter_gitee/utils/global_context.dart';
import 'package:flutter_gitee/utils/global_events.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../generated/l10n.dart';
import '../../../widget/theme_select_dialog.dart';

class MorePage extends StatefulWidget implements HomeWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  MorePageState createState() => MorePageState();

  @override
  Widget getIcon() {
    return const Icon(Icons.more_horiz_rounded);
  }

  @override
  String getText(BuildContext context) {
    return S.of(context).more;
  }
}

class MorePageState extends BaseState<MorePage> {
  var _profile = globalProfile ?? UserProfileEntity();
  late final StreamSubscription _profileSubscription;

  @override
  void initState() {
    super.initState();
    _profileSubscription = startPageBus.on<ProfileEvent>().listen((event) {
      setState(() {
        _profile = event.profile;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _profileSubscription.cancel();
  }

  @override
  Widget create(BuildContext context) {
    final gridSpace = [_createUserProfileSpace()];
    if (_profile.bio != null) {
      gridSpace.add(_createBioSpace());
    }
    gridSpace.add(_createLanguageSelectionSpace());
    gridSpace.add(_createLogoutSpace());
    return Scaffold(
      appBar: _createAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: StaggeredGrid.count(
            axisDirection: AxisDirection.down,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            children: gridSpace,
          ),
        ),
      ),
    );
  }

  AppBar _createAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "${_profile.login}",
        style: TextStyle(color: theme.theme.colorScheme.onPrimaryContainer),
      ),
      backgroundColor: theme.theme.colorScheme.primaryContainer,
      actions: [
        IconButton(
          onPressed: () {
            _selectTheme(context);
          },
          icon: Icon(
            FontAwesomeIcons.palette,
            color: theme.theme.colorScheme.onPrimaryContainer,
          ),
        )
      ],
    );
  }

  Widget _createLanguageSelectionSpace() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: theme.theme.colorScheme.primaryContainer,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(24))),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "language_page");
        },
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).currentLanguage,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: theme.theme.colorScheme.onPrimaryContainer),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              language.name,
              style: TextStyle(
                  color: theme.theme.colorScheme.onPrimaryContainer
                      .withAlpha(200)),
            )
          ],
        ),
      ),
    );
  }

  Widget _createLogoutSpace() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: theme.theme.colorScheme.primaryContainer,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(24))),
      child: TextButton(
          onPressed: () {
            _showLogoutDialog(context);
          },
          child: Text(S.of(context).logout)),
    );
  }

  Widget _createBioSpace() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: theme.theme.colorScheme.primaryContainer,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(24))),
      child: Text(
        "${_profile.bio}",
        style: TextStyle(color: theme.theme.colorScheme.onPrimaryContainer),
      ),
    );
  }

  Widget _createUserProfileSpace() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: theme.theme.colorScheme.primaryContainer,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(24))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createUserAvatar(),
          Wrap(
            spacing: 5,
            children: [
              ActionChip(
                padding: EdgeInsets.zero,
                backgroundColor: theme.theme.colorScheme.secondaryContainer,
                pressElevation: 0,
                label:
                    Text("${_profile.following} ${S.of(context).followings}"),
                onPressed: () {
                  Navigator.pushNamed(context, "following_page",
                      arguments: _profile.login);
                },
              ),
              ActionChip(
                padding: EdgeInsets.zero,
                backgroundColor: theme.theme.colorScheme.secondaryContainer,
                pressElevation: 0,
                onPressed: () {
                  Navigator.pushNamed(context, "follower_page",
                      arguments: _profile.login);
                },
                label: Text("${_profile.followers} ${S.of(context).followers}"),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _createUserAvatar() {
    final Widget avatar;
    if (_profile.avatarUrl == null) {
      avatar = const Icon(
        Icons.person,
        size: 64,
      );
    } else {
      avatar = Image.network(
        "${_profile.avatarUrl}",
        width: 64,
        height: 64,
      );
    }
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(24)),
      child: Container(
        decoration:
            BoxDecoration(color: theme.theme.colorScheme.secondaryContainer),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "profile_edit_page");
          },
          child: avatar,
        ),
      ),
    );
  }

  void _selectTheme(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Builder(
          builder: (context) {
            return ThemeSelectDialog(
              context: context,
              onSelect: (t) {
                setState(() {
                  theme = t;
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: theme.theme.colorScheme.background,
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
      },
    );
  }
}
