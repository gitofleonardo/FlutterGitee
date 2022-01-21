import 'package:flutter/material.dart';
import 'package:flutter_gitee/utils/global_utils.dart';

class MessageItem extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final String name;
  final String avatar;
  final String time;
  final String content;
  final bool unread;

  const MessageItem(
      {Key? key,
      required this.onTap,
      required this.onLongPress,
      required this.name,
      required this.avatar,
      required this.time,
      required this.content,
      required this.unread})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.horizontal,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "user_profile_page",
                    arguments: name);
              },
              child: SizedBox(
                width: 32,
                height: 32,
                child: ClipOval(
                  child: Image.network(
                    avatar,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        child: Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Text(formatDate(time),
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withAlpha(100),
                            fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 5),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: Text(
                          content,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AnimatedScale(
                        scale: unread ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 250),
                        child: ClipOval(
                          child: Container(
                            constraints: const BoxConstraints.tightFor(
                                width: 8, height: 8),
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
