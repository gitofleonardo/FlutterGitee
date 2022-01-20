import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/start/home/home_widget.dart';
import 'package:flutter_gitee/main/start/home/start_page.dart';
import 'package:flutter_gitee/utils/global_context.dart';
import 'package:flutter_gitee/utils/global_events.dart';
import 'package:flutter_gitee/widget/base_state.dart';
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
  var _avatarUrl = globalProfile?.avatarUrl ?? "";
  var _username = globalProfile?.login ?? "";
  late final StreamSubscription _profileSubscription;

  @override
  void initState() {
    super.initState();
    _profileSubscription = startPageBus.on<ProfileEvent>().listen((event) {
      setState(() {
        _avatarUrl = "${event.profile.avatarUrl}";
        _username = event.profile.login!;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _username,
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
              ))
        ],
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          _createUserProfileSpace(),
        ],
      ),
    );
  }

  Widget _createUserProfileSpace() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration:
          BoxDecoration(color: theme.theme.colorScheme.primaryContainer),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _createUserAvatar(),
          ],
        ),
      ),
    );
  }

  Widget _createUserAvatar() {
    final Widget avatar;
    if (_avatarUrl.isEmpty) {
      avatar = const Icon(
        Icons.person,
        size: 64,
      );
    } else {
      avatar = Image.network(
        _avatarUrl,
        width: 64,
        height: 64,
      );
    }
    return ClipOval(
      child: Container(
        decoration:
            BoxDecoration(color: theme.theme.colorScheme.secondaryContainer),
        child: avatar,
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
