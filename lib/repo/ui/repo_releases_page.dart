import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/bean/repository_release_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoReleasesPage extends StatefulWidget {
  final String fullName;

  const RepoReleasesPage({Key? key, required this.fullName}) : super(key: key);

  @override
  _RepoReleasesPageState createState() => _RepoReleasesPageState();
}

class _RepoReleasesPageState extends BaseState<RepoReleasesPage> {
  final _refreshController = RefreshController();
  final _releases = <RepositoryReleaseEntity>[];
  var _hasMore = false;
  var _currentPage = 1;
  final _perPage = 20;

  void _loadMore() {
    getRepoReleases(widget.fullName, _currentPage, _perPage).then((value) {
      if (value.success) {
        _refreshController.loadComplete();
        ++_currentPage;
        final data = value.data ?? [];
        setState(() {
          if (data.length < _perPage) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
          _releases.addAll(data);
        });
      } else {
        _refreshController.loadFailed();
      }
    });
  }

  void _refresh() {
    setState(() {
      _hasMore = false;
    });
    _currentPage = 1;
    getRepoReleases(widget.fullName, _currentPage, _perPage).then((value) {
      if (value.success) {
        _refreshController.refreshCompleted();
        ++_currentPage;
        final data = value.data ?? [];
        setState(() {
          if (data.length < _perPage) {
            _hasMore = false;
          } else {
            _hasMore = true;
          }
          _releases.clear();
          _releases.addAll(data);
        });
      } else {
        _refreshController.refreshFailed();
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
  Widget create(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Releases"),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onLoading: _loadMore,
        onRefresh: _refresh,
        enablePullUp: _hasMore,
        header: const WaterDropHeader(),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final item = _releases[index];
            return _releaseItem(item);
          },
          itemCount: _releases.length,
        ),
      ),
    );
  }

  Widget _releaseItem(RepositoryReleaseEntity release) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Text(
                "${release.name}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              MarkdownBody(data: "${release.body}"),
              const SizedBox(
                height: 5,
              ),
              Column(
                children: (release.assets ?? []).map((asset) {
                  return _createDownloadTile(
                      asset.name ?? "Download Source Code",
                      asset.browserDownloadUrl ?? "");
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createDownloadTile(String name, String url) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.center,
          direction: Axis.horizontal,
          children: [
            const Icon(
              FontAwesomeIcons.download,
              size: 14,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(child: Text(name))
          ],
        ),
      ),
      onTap: () async {
        canLaunch(url).then((value) {
          launch(url);
        });
      },
    );
  }
}
