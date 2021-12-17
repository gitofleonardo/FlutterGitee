import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final Widget leading;
  final Color leadingColor;
  final Widget text;
  final Widget? trailing;
  final VoidCallback onTap;

  const IconTextButton(
      {Key? key,
      required this.leading,
      required this.text,
      this.trailing,
      required this.onTap,
      required this.leadingColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
          child: DecoratedBox(
              decoration: BoxDecoration(
                  color: leadingColor, borderRadius: BorderRadius.circular(3)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: leading,
              ))),
      Expanded(child: text),
    ];
    if (trailing != null) {
      children.add(trailing!);
    }
    return InkWell(
      child: Flex(
        direction: Axis.horizontal,
        children: children,
      ),
      onTap: onTap,
    );
  }
}
