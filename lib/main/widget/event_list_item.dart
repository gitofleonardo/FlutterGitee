import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/repository_detail_page.dart';
import 'package:flutter_gitee/user/bean/result/success/event_result_entity.dart';
import 'package:flutter_gitee/utils/global_utils.dart';

class UnsupportedEventListItem extends StatefulWidget {
  final EventResultEntity event;

  const UnsupportedEventListItem({Key? key, required this.event})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _UnsupportedEventListItemState();
}

class _UnsupportedEventListItemState extends State<UnsupportedEventListItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "user_profile_page",
                        arguments: "${widget.event.actor?.login}");
                  },
                  child: SizedBox(
                    width: 42,
                    height: 42,
                    child: ClipOval(
                      child: Image.network(
                          widget.event.actor?.avatarUrl.toString() ?? ""),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.event.actor?.login ?? "",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      formatDate(widget.event.createdAt.toString()),
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                  debugPrint("Expanded: $_expanded");
                });
              },
              child: Text(
                widget.event.toJson().toString(),
                maxLines: _expanded ? null : 1,
                //overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FollowEventListItem extends StatelessWidget {
  final EventResultEntity event;
  const FollowEventListItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "user_profile_page",
                        arguments: "${event.actor?.login}");
                  },
                  child: SizedBox(
                    width: 42,
                    height: 42,
                    child: ClipOval(
                      child: Image.network(
                          event.actor?.avatarUrl.toString() ?? ""),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.actor?.login ?? "",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      formatDate(event.createdAt.toString()),
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 10),
                const Text("Follow"),
                const SizedBox(width: 10),
                SizedBox(
                  width: 16,
                  height: 16,
                  child: ClipOval(
                    child: Image.network(
                        event.payload?.target?.avatarUrl?.toString() ?? ""),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "user_profile_page",
                        arguments: "${event.payload?.target?.login}");
                  },
                  child: Text(
                    event.payload?.target?.login.toString() ?? "",
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StarEventListItem extends StatelessWidget {
  final EventResultEntity event;
  const StarEventListItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "user_profile_page",
                          arguments: "${event.actor?.login}");
                    },
                    child: SizedBox(
                      width: 42,
                      height: 42,
                      child: ClipOval(
                        child: Image.network(
                            event.actor?.avatarUrl.toString() ?? ""),
                      ),
                    )),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${event.actor?.login}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      formatDate(event.createdAt.toString()),
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: [
                Icon(
                  Icons.star,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 10),
                const Text("Star"),
                const SizedBox(width: 10),
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "${event.repo?.fullName}",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PushEventListItem extends StatelessWidget {
  final EventResultEntity event;
  const PushEventListItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 42,
                  height: 42,
                  child: ClipOval(
                    child:
                        Image.network(event.actor?.avatarUrl.toString() ?? ""),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.actor?.login ?? "Unknown",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      formatDate(event.createdAt.toString()),
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              crossAxisAlignment: CrossAxisAlignment.center,
              direction: Axis.horizontal,
              children: [
                Icon(
                  Icons.backup_rounded,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 10),
                const Text("Push to"),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      event.repo?.fullName ?? "Unknown",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            LayoutBuilder(builder: (context, constraints) {
              final commits = <Widget>[];
              final originData = event.payload?.commits ?? [];
              for (final commit in originData) {
                int ch = commit.author?.name?.codeUnits[0] ?? 0x0041;
                commits.add(ConstrainedBox(
                  constraints:
                      BoxConstraints(maxWidth: constraints.constrainWidth()),
                  child: Flex(
                    direction: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.primary),
                        child: SizedBox(
                          child: Text(
                            String.fromCharCode(ch),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                          width: 12,
                          height: 12,
                        ),
                        constraints: const BoxConstraints.tightFor(
                            width: 18, height: 18),
                        alignment: Alignment.center,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Padding(
                        child: Text(
                          commit.message?.trim() ?? "Unknown",
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        padding: const EdgeInsets.only(top: 3),
                      )),
                    ],
                  ),
                ));
                commits.add(const SizedBox(height: 5));
              }
              return Column(
                children: commits,
              );
            })
          ],
        ),
      ),
    );
  }
}

class CreateEventListItem extends StatelessWidget {
  final EventResultEntity event;
  const CreateEventListItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 42,
                  height: 42,
                  child: ClipOval(
                    child:
                        Image.network(event.actor?.avatarUrl.toString() ?? ""),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.actor?.login ?? "",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      formatDate(event.createdAt.toString()),
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: [
                Icon(
                  Icons.create,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 10),
                const Text("Create"),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "repository_detail_page",
                          arguments: RepoInfo("${event.actor?.login}",
                              "${event.repo?.humanName}"));
                    },
                    child: Text(
                      event.repo?.fullName ?? "Unknown",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
