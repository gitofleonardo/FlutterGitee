import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/repo/ui/issue_detail_page.dart';
import 'package:flutter_gitee/user/bean/event_result_entity.dart';
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
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.event.actor?.login ?? "",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        formatDate(widget.event.createdAt.toString()),
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: 12),
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
      ),
    );
  }
}

class FollowEventListItem extends StatelessWidget {
  final EventResultEntity event;
  const FollowEventListItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.actor?.login ?? "",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        formatDate(event.createdAt.toString()),
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: 12),
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
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(S.of(context).followed),
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
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer
                              .withAlpha(100),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
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
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${event.actor?.login}",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        formatDate(event.createdAt.toString()),
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: 12),
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
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(S.of(context).starred),
                  const SizedBox(width: 10),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "repository_detail_page",
                          arguments: "${event.repo?.fullName}");
                    },
                    child: Text(
                      "${event.repo?.fullName}",
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer
                              .withAlpha(100),
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
      ),
    );
  }
}

class PushEventListItem extends StatelessWidget {
  final EventResultEntity event;
  const PushEventListItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.actor?.login ?? "Unknown",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        formatDate(event.createdAt.toString()),
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: 12),
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
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(S.of(context).pushTo),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "repository_detail_page",
                            arguments: "${event.repo?.fullName}");
                      },
                      child: Text(
                        event.repo?.fullName ?? "Unknown",
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer
                              .withAlpha(100),
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer),
                          child: SizedBox(
                            child: Text(
                              String.fromCharCode(ch),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer,
                                  fontSize: 12),
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
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer
                                    .withAlpha(180)),
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
      ),
    );
  }
}

class CreateEventListItem extends StatelessWidget {
  final EventResultEntity event;
  const CreateEventListItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.actor?.login ?? "",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        formatDate(event.createdAt.toString()),
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: 12),
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
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(S.of(context).created),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "repository_detail_page",
                            arguments: "${event.repo?.fullName}");
                      },
                      child: Text(
                        event.repo?.fullName ?? "Unknown",
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer
                              .withAlpha(100),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
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
      ),
    );
  }
}

class CreateIssueListItem extends StatelessWidget {
  final EventResultEntity event;
  const CreateIssueListItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.actor?.login ?? "",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        formatDate(event.createdAt.toString()),
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: 12),
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
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(S.of(context).createdIssue),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return IssueDetailPage(
                              fullName: "${event.repo?.fullName}",
                              number: "${event.payload?.number}");
                        }));
                      },
                      child: Text(
                        "#${event.payload?.number}",
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer
                              .withAlpha(100),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: Text(
                  "${event.payload?.title}",
                  style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withAlpha(200),
                      fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IssueCommentListItem extends StatelessWidget {
  final EventResultEntity event;
  const IssueCommentListItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.actor?.login ?? "",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        formatDate(event.createdAt.toString()),
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: 12),
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
                    Icons.message,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(S.of(context).commentOnIssue),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return IssueDetailPage(
                              fullName: "${event.repo?.fullName}",
                              number: "${event.payload?.issue?.number}");
                        }));
                      },
                      child: Text(
                        "#${event.payload?.issue?.number}",
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer
                              .withAlpha(100),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: Text(
                  "${event.payload?.comment?.body}",
                  style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withAlpha(200),
                      fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
