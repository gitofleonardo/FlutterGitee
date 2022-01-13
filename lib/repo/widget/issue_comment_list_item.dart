import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/bean/issue_comment_entity.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class IssueCommentListItem extends StatelessWidget {
  final IssueCommentEntity issue;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const IssueCommentListItem(
      {Key? key,
      required this.issue,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.horizontal,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "user_profile_page",
                    arguments: "${issue.user?.login}");
              },
              child: SizedBox(
                width: 32,
                height: 32,
                child: ClipOval(
                  child: Image.network(
                    "${issue.user?.avatarUrl}",
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
                      "${issue.user?.login}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Text(formatDate("${issue.createdAt}"),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 5),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: MarkdownBody(
                    data: "${issue.body}",
                    selectable: true,
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
