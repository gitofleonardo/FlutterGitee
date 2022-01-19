import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/bean/pull_request_entity.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PullRequestListItem extends StatelessWidget {
  final PullRequestEntity pull;
  final VoidCallback onTap;

  const PullRequestListItem({Key? key, required this.pull, required this.onTap})
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
                _createPullTagsByState("${pull.state}"),
                const SizedBox(
                  width: 10,
                ),
                Expanded(child: Text("${pull.base?.repo?.fullName}")),
                Text(formatDate(pull.updatedAt ?? ''))
              ],
            ),
            const SizedBox(height: 10),
            Text("${pull.title}", style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 5,
              spacing: 10,
              children: _createIssueTags(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _createIssueTags() {
    final labels = pull.labels ?? [];
    return labels.map((e) {
      return RawChip(label: Text("${e.name}"));
    }).toList();
  }

  Widget _createPullTagsByState(String state) {
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
          Icons.close,
          color: Colors.red,
          size: 14,
        );
        break;
      case "merged":
        icon = const Icon(
          FontAwesomeIcons.codeBranch,
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
