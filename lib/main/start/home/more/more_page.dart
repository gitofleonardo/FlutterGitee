import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/start/home/home_widget.dart';
import 'package:flutter_gitee/widget/base_state.dart';

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
  @override
  Widget create(BuildContext context) {
    return Container(
      child: Text("hello"),
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
