import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bean/repo_file_entity.dart';

enum _LoadState { done, loading, fail }

class NoRippleScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class RepositoryDetailPage extends StatefulWidget {
  final String fullname;

  const RepositoryDetailPage({Key? key, required this.fullname})
      : super(key: key);

  @override
  _RepositoryDetailPageState createState() => _RepositoryDetailPageState();
}

class _RepositoryDetailPageState extends State<RepositoryDetailPage> {
  RepositoryEntity repo = RepositoryEntity();
  var _state = _LoadState.loading;

  void _refreshRepoInfo() {
    getRepositoryInfo(widget.fullname).then((value) {
      setState(() {
        if (value.success) {
          repo = value.data!;
          _state = _LoadState.done;
        } else {
          _state = _LoadState.fail;
        }
      });
    });
  }

  void _toggleRepoStarState() {
    final starred = repo.stared ?? false;
    toggleRepositoryStar("${repo.fullName}", !starred).then((value) {
      if (value.success) {
        setState(() {
          repo.stared = !starred;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshRepoInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalThemeWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.fullname, maxLines: 1),
        ),
        body: Builder(builder: (context) {
          switch (_state) {
            case _LoadState.done:
              return _createRepoInfoBody();
            case _LoadState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case _LoadState.fail:
              return TapToRetryWidget(
                  onTap: () {
                    _refreshRepoInfo();
                  },
                  message: "tap to retry");
          }
        }),
      ),
    );
  }

  Widget _createRepoInfoBody() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerIsScrolled) {
        return [
          _createRepoHeader(),
        ];
      },
      body: _createRepoReadmeBody(),
    );
  }

  Widget _createRepoReadmeBody() {
    return Builder(builder: (context) {
      return DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (over) {
            over.disallowGlow();
            return true;
          },
          child: Builder(builder: (context) {
            final content = base64ToString(repo.readme?.content);
            if (content.isEmpty) {
              return const SizedBox(
                width: 0,
                height: 0,
              );
            }
            return Markdown(
              padding: const EdgeInsets.all(10),
              onTapLink: (text, href, title) {},
              selectable: true,
              data: content,
              imageBuilder: (uri, title, alt) {
                var url = uri.toString().trim();
                if (!url.startsWith("http")) {
                  return FutureBuilder<BaseResult<RepoFileEntity>>(
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          final data = snapshot.data;
                          if (data != null && data.success) {
                            return Image.memory(const Base64Decoder()
                                .convert(data.data?.content ?? ""));
                          }
                        }
                        return const SizedBox(width: 0, height: 0);
                      },
                      future: getRepoFile("${repo.fullName}", url));
                } else {
                  return Image.network(url);
                }
              },
            );
          }),
        ),
      );
    });
  }

  Widget _createRepoHeader() {
    return SliverToBoxAdapter(
      child: Builder(
        builder: (context) {
          return DecoratedBox(
              decoration:
                  BoxDecoration(color: Theme.of(context).backgroundColor),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                        child: Flex(direction: Axis.horizontal, children: [
                          ClipOval(
                              child: Image.network(
                            "${repo.owner?.avatarUrl}",
                            width: 24,
                            height: 24,
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            "${repo.owner?.login}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Builder(
                            builder: (context) {
                              if (repo.stared ?? false) {
                                return TextButton.icon(
                                    onPressed: _toggleRepoStarState,
                                    icon: const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 16,
                                    ),
                                    label: const Text(
                                      "Starred",
                                      style: TextStyle(fontSize: 12),
                                    ));
                              }
                              return TextButton.icon(
                                  onPressed: _toggleRepoStarState,
                                  icon: const Icon(Icons.star_border, size: 12),
                                  label: const Text(
                                    "Star",
                                    style: TextStyle(fontSize: 12),
                                  ));
                            },
                          )
                        ]),
                        onTap: () {
                          Navigator.pushNamed(context, "user_profile_page",
                              arguments: "${repo.owner?.login}");
                        }),
                    const SizedBox(height: 10),
                    Text("${repo.name}",
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Builder(builder: (context) {
                      final desc = repo.description ?? "";
                      if (desc.isEmpty) {
                        return const SizedBox(width: 0, height: 0);
                      }
                      return Text(desc);
                    }),
                    Row(
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.star_border, size: 20),
                            label: Text(
                                "${formatGitCount(repo.stargazersCount?.toInt() ?? 0)} Stars")),
                        const SizedBox(width: 10),
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.codeBranch,
                              size: 16,
                            ),
                            label: Text(
                                "${formatGitCount(repo.forksCount?.toInt() ?? 0)} forks"))
                      ],
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
