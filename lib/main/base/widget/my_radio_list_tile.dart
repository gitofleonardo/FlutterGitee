import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/widget/my_radio_button.dart';

class MyRadioListTile<T> extends ListTile {
  final T value;
  final T? groupValue;
  final ValueChanged<T> onChanged;
  final bool toggleable;
  final Widget? myTitle;
  final Widget? mySubtitle;

  MyRadioListTile(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      this.myTitle,
      this.mySubtitle,
      this.toggleable = true})
      : super(
            key: key,
            leading: MyRadioButton(value: value, groupValue: groupValue),
            title: myTitle,
            subtitle: mySubtitle,
            onTap: () {
              if (toggleable) {
                onChanged(value);
              } else if (groupValue != value) {
                onChanged(value);
              }
            });
}
