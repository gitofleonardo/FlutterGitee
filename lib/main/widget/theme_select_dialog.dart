import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/utils/global_constant.dart';

typedef OnThemeSelect = void Function(GlobalTheme);

class ThemeSelectDialog extends StatelessWidget {
  final BuildContext context;
  final OnThemeSelect onSelect;

  const ThemeSelectDialog(
      {Key? key, required this.context, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final options = <ActionChip>[];
    for (var theme in globalThemes) {
      options.add(ActionChip(
        pressElevation: 0,
        label: Text(
          theme.name,
          style: const TextStyle(),
        ),
        avatar: Icon(Icons.palette, color: theme.theme.primaryColor),
        onPressed: () {
          onSelect(theme);
        },
      ));
    }
    return AlertDialog(
      title: Text(S.of(context).themes),
      content: Wrap(
        spacing: 5,
        runSpacing: -5,
        children: options,
      ),
    );
  }
}
