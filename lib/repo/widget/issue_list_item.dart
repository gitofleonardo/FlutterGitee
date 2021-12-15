import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/bean/issue_result_entity.dart';
import 'package:flutter_gitee/utils/global_utils.dart';

class IssueListItem extends StatelessWidget {
  final IssueResultEntity issue;
  final VoidCallback onTap;

  const IssueListItem({Key? key, required this.issue, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _createIssueByIssueState("${issue.state}"),
                const SizedBox(
                  width: 10,
                ),
                Expanded(child: Text("${issue.repository?.fullName}")),
                Text(formatDate(issue.updatedAt ?? ''))
              ],
            ),
            const SizedBox(height: 10),
            Text("${issue.title}", style: const TextStyle(color: Colors.grey))
          ],
        ),
      ),
    );
  }

  Widget _createIssueByIssueState(String state) {
    final Icon icon;
    switch (state) {
      case "open":
        icon = const Icon(
          Icons.lock_open,
          color: Colors.green,
          size: 14,
        );
        break;
      case "closed":
        icon = const Icon(
          Icons.check,
          color: Colors.indigo,
          size: 14,
        );
        break;
      case "rejected":
        icon = const Icon(
          Icons.close,
          color: Colors.red,
          size: 14,
        );
        break;
      case "progressing":
        icon = const Icon(
          Icons.handyman,
          color: Colors.cyan,
          size: 14,
        );
        break;
      default:
        icon = const Icon(
          Icons.close,
          color: Colors.yellow,
          size: 14,
        );
        break;
    }
    return icon;
  }
}
