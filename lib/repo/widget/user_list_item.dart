import 'package:flutter/material.dart';
import 'package:flutter_gitee/user/bean/result/success/user_profile_entity.dart';

class UserListItem extends StatelessWidget {
  final UserProfileEntity user;
  final VoidCallback onTap;

  const UserListItem({Key? key, required this.user, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ClipOval(
              child: Image.network(
                "${user.avatarUrl}",
                width: 32,
                height: 32,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
              child: SizedBox(
            height: 52,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("${user.login}",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text(
                      "${user.followers} Followers  ${user.following} Following",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}