import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'bean/repo_file_entity.dart';

enum _LoadState { done, loading, fail }

class RepositoryDetailPage extends StatefulWidget {
  final String fullname;

  const RepositoryDetailPage({Key? key, required this.fullname})
      : super(key: key);

  @override
  _RepositoryDetailPageState createState() => _RepositoryDetailPageState();
}

class _RepositoryDetailPageState extends State<RepositoryDetailPage> {
  final _refreshController = RefreshController();
  RepositoryEntity repo = RepositoryEntity();
  var _state = _LoadState.loading;

  void _refreshRepoInfo() {
    getRepositoryInfo(widget.fullname).then((value) {
      setState(() {
        if (value.success) {
          repo = value.data!;
          _refreshController.refreshCompleted();
          _state = _LoadState.done;
        } else {
          _refreshController.refreshFailed();
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
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _refreshController.requestRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GlobalThemeWidget(
      child: Scaffold(
        body: SmartRefresher(
          onRefresh: _refreshRepoInfo,
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: false,
          header: const WaterDropHeader(),
          child: LayoutBuilder(builder: (context, constraints) {
            switch (_state) {
              case _LoadState.done:
                return _createRepoInfoBody();
              case _LoadState.loading:
                return const SizedBox(width: 0, height: 0);
              case _LoadState.fail:
                return TapToRetryWidget(
                    onTap: () {
                      setState(() {
                        _state = _LoadState.loading;
                        _refreshController.requestRefresh();
                      });
                    },
                    message: "Tap to retry");
            }
          }),
        ),
      ),
    );
  }

  Widget _createRepoInfoBody() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerIsScrolled) {
        return [
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.fullname),
            ),
          ),
          SliverToBoxAdapter(
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
                ],
              ),
            ),
          )
        ];
      },
      body: Markdown(
        onTapLink: (text, href, title) {},
        selectable: true,
        data: base64ToString(repo.readme?.content),
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
          debugPrint(url);
        },
      ),
    );
  }
}
