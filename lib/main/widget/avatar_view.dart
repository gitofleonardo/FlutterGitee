import 'package:flutter/material.dart';

class AvatarView extends StatelessWidget {
  final String avatarUrl;
  final double radius;
  final VoidCallback onTap;

  const AvatarView(
      {Key? key,
      required this.avatarUrl,
      required this.radius,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius,
      height: radius,
      child: ClipOval(
        child: InkWell(
          child: Image.network(
            avatarUrl,
            width: radius,
            height: radius,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
