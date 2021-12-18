import 'package:flutter/material.dart';

class VerticalTextIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Icon icon;
  final Text text;
  const VerticalTextIconButton(
      {Key? key, required this.onTap, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: Axis.vertical,
        children: [IconButton(onPressed: onTap, icon: icon), text]);
  }
}
