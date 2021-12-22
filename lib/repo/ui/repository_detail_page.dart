import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/main/base/widget/general_bottom_sheet_header.dart';
import 'package:flutter_gitee/main/base/widget/my_radio_list_tile.dart';
import 'package:flutter_gitee/repo/bean/branch_entity.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/repo/ui/repo_commits_page.dart';
import 'package:flutter_gitee/repo/ui/repository_tree_viewer.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/icon_text_button.dart';

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
    setState(() {
      _state = _LoadState.loading;
    });
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

  Future<BaseResult<List<BranchEntity>>> _getBranches() {
    return getBranches("${repo.fullName}");
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
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              onTapLink: (text, href, title) {},
              selectable: true,
              data: content,
              imageBuilder: (uri, title, alt) {
                return repositoryMarkdownImageBuilder(
                    uri, "${repo.fullName}", "$title", "$alt");
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
                    _createSimpleDescriptionHeader(),
                    _createAttrViewPanel(),
                  ],
                ),
              ));
        },
      ),
    );
  }

  Widget _createSimpleDescriptionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Flex(direction: Axis.horizontal, children: [
          Expanded(
              child: Text("${repo.name}",
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold))),
          Builder(builder: (context) {
            return TextButton.icon(
                onPressed: () {
                  _showBranchSelector(context);
                },
                icon: const Icon(
                  FontAwesomeIcons.codeBranch,
                  size: 16,
                ),
                label: Text("${repo.defaultBranch}"));
          })
        ]),
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
                onPressed: () {
                  Navigator.pushNamed(context, "repository_stargazers_page",
                      arguments: widget.fullname);
                },
                icon: const Icon(Icons.star_border, size: 20),
                label: Text(
                    "${formatGitCount(repo.stargazersCount?.toInt() ?? 0)} Stars")),
            const SizedBox(width: 10),
            TextButton.icon(
              icon: const Icon(
                FontAwesomeIcons.bullseye,
                size: 16,
              ),
              label: Text(
                  "${formatGitCount(repo.watchersCount?.toInt() ?? 0)} Watches"),
              onPressed: () {
                Navigator.pushNamed(context, "repository_watchers_page",
                    arguments: widget.fullname);
              },
            ),
            const SizedBox(width: 10),
            TextButton.icon(
              icon: const Icon(
                FontAwesomeIcons.codeBranch,
                size: 16,
              ),
              label: Text(
                  "${formatGitCount(repo.forksCount?.toInt() ?? 0)} Forks"),
              onPressed: () {
                Navigator.pushNamed(context, "repository_forks_page",
                    arguments: widget.fullname);
              },
            )
          ],
        )
      ],
    );
  }

  Widget _createAttrViewPanel() {
    return Column(
      children: [
        IconTextButton(
          leading: const Icon(
            FontAwesomeIcons.fileCode,
            color: Colors.white,
            size: 18,
          ),
          leadingColor: Colors.black54,
          text: const Text("Codes"),
          onTap: () {
            Navigator.pushNamed(context, "repository_tree_page",
                arguments: TreeInfo(
                    fullname: "${repo.fullName}",
                    branch: "${repo.defaultBranch}"));
          },
        ),
        IconTextButton(
          leading: const Icon(
            FontAwesomeIcons.pushed,
            color: Colors.white,
            size: 18,
          ),
          leadingColor: Colors.black54,
          text: const Text("Commits"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RepoCommitsPage(
                  branch: repo.defaultBranch!, fullName: repo.fullName!);
            }));
          },
        ),
        IconTextButton(
          leading: const Icon(
            FontAwesomeIcons.codeBranch,
            color: Colors.white,
            size: 18,
          ),
          leadingColor: Colors.deepOrange,
          text: const Text("Pull Requests"),
          onTap: () {
            Navigator.pushNamed(context, "repository_pull_request_page",
                arguments: repo.fullName);
          },
        ),
        IconTextButton(
          leading: const Icon(
            Icons.person,
            color: Colors.white,
            size: 18,
          ),
          leadingColor: Colors.deepPurple,
          text: const Text("Collaborators"),
          onTap: () {
            Navigator.pushNamed(context, "repository_collaborator_page",
                arguments: widget.fullname);
          },
        ),
        IconTextButton(
          leadingColor: Colors.green,
          leading: const Icon(FontAwesomeIcons.dotCircle,
              color: Colors.white, size: 18),
          text: const Text("Issues"),
          onTap: () {
            Navigator.pushNamed(context, "repository_issue_page",
                arguments: widget.fullname);
          },
          trailing: Text("${repo.openIssuesCount?.toInt() ?? 0}"),
        ),
        IconTextButton(
          leading: const Icon(
            FontAwesomeIcons.pencilAlt,
            color: Colors.white,
            size: 18,
          ),
          leadingColor: Colors.redAccent,
          text: const Text("License"),
          trailing: Text(repo.license ?? ''),
          onTap: () {},
        ),
      ],
    );
  }

  void _showBranchSelector(BuildContext context) {
    final tapToRetry = TapToRetryWidget(
        onTap: () {
          setState(() {});
        },
        message: "Tap To Retry");
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (context) {
          return HeaderContentBottomSheet(
              contentScrollable: true,
              title: "Select Branch",
              body: FutureBuilder<BaseResult<List<BranchEntity>>>(
                future: _getBranches(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final data = snapshot.data;
                    final branches = data?.data ?? [];
                    if (data == null || !data.success || branches.isEmpty) {
                      return tapToRetry;
                    }
                    return Column(
                      children: branches.map((e) {
                        return MyRadioListTile(
                            myTitle: Text("${e.name}"),
                            value: "${e.name}",
                            groupValue: "${repo.defaultBranch}",
                            onChanged: (value) {
                              Navigator.pop(context);
                              setState(() {
                                repo.defaultBranch = e.name;
                              });
                            });
                      }).toList(),
                    );
                  }
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  ));
                },
              ));
        });
  }
}
