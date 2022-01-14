import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/bean/repository_tree_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/utils/repository_file_open_handler.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TreeInfo {
  final String fullName;
  final String branch;
  TreeInfo({required this.fullName, required this.branch});
}

class _Pair<T, E> {
  final T first;
  final E second;
  _Pair(this.first, this.second);
}

class RepositoryTreeViewer extends StatefulWidget {
  final TreeInfo treeInfo;

  const RepositoryTreeViewer({Key? key, required this.treeInfo})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RepositoryTreeViewerState();
}

class _RepositoryTreeViewerState extends BaseState<RepositoryTreeViewer> {
  late String _title = widget.treeInfo.branch;
  late String _currentSha = widget.treeInfo.branch;
  final _refreshController = RefreshController();
  RepositoryTreeEntity? _currentTree;
  final _currentTreeNodes = <RepositoryTreeTree>[];
  final _historyStack = <_Pair<String, RepositoryTreeEntity>>[];

  int _fileTypeComparator(RepositoryTreeTree first, RepositoryTreeTree second) {
    if (first.type == second.type) {
      return first.path!.compareTo(second.type!);
    }
    if (first.type == "tree") {
      return -1;
    }
    return 1;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _refreshController.requestRefresh();
    });
  }

  /// Returns true if pops anything
  bool _popTree() {
    if (_historyStack.isNotEmpty) {
      final tree = _historyStack.removeLast();
      final item = tree.second;
      final title = tree.first;
      _currentTree = item;
      _currentSha = item.sha!;
      setState(() {
        _title = title;
        _currentTreeNodes.clear();
        _currentTreeNodes.addAll(item.tree ?? []);
      });
      return true;
    }
    return false;
  }

  void _nextTree(String sha, String path) {
    _historyStack.add(_Pair(_title, _currentTree!));
    setState(() {
      _currentTreeNodes.clear();
      _title = path;
    });
    _currentTree = null;
    _currentSha = sha;
    getRepositoryTree(widget.treeInfo.fullName, _currentSha).then((value) {
      if (value.success && value.data != null) {
        _refreshController.refreshCompleted();
        _currentTree = value.data;
        final items = value.data?.tree ?? [];
        items.sort(_fileTypeComparator);
        setState(() {
          _currentTreeNodes.addAll(items);
        });
      } else {
        _refreshController.refreshFailed();
      }
    });
  }

  void _refreshCurrentTree() {
    getRepositoryTree(widget.treeInfo.fullName, _currentSha).then((value) {
      if (value.success) {
        _refreshController.refreshCompleted();
        _currentTree = value.data;
        final items = value.data?.tree ?? [];
        items.sort(_fileTypeComparator);
        setState(() {
          _currentTreeNodes.clear();
          _currentTreeNodes.addAll(items);
        });
      } else {
        _refreshController.refreshFailed();
      }
    });
  }

  @override
  Widget create(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(_title),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
          body: SmartRefresher(
            onRefresh: _refreshCurrentTree,
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: false,
            header: const WaterDropHeader(),
            child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = _currentTreeNodes[index];
                  final isDir = item.type == "tree";
                  return DecoratedBox(
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor),
                    child: ListTile(
                      leading: _createFileIcon(isDir),
                      title: Text("${item.path}"),
                      onTap: () {
                        if (isDir) {
                          _nextTree("${item.sha}", "${item.path}");
                        } else {
                          RepositoryFileOpenHandler.getInstance().open(
                              context,
                              widget.treeInfo.fullName,
                              RepositoryBlob.fromTree(item));
                        }
                      },
                    ),
                  );
                },
                itemCount: _currentTreeNodes.length),
          ),
        ),
        onWillPop: () async {
          final pop = _popTree();
          return !pop;
        });
  }

  Widget _createFileIcon(bool isDir) {
    return isDir
        ? Container(
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            padding: const EdgeInsets.all(10),
            child: const Icon(
              FontAwesomeIcons.folder,
              color: Colors.white,
              size: 18,
            ))
        : Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.green),
            padding: const EdgeInsets.all(10),
            child: const Icon(
              FontAwesomeIcons.file,
              color: Colors.white,
              size: 18,
            ));
  }
}
