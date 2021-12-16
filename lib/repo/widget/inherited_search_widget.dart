import 'package:flutter/material.dart';
import 'package:flutter_gitee/repo/attrs/filter_attrs.dart';

class InheritedSearchWidget extends InheritedWidget {
  final Widget searchChild;
  final String searchText;
  final RepositoryFilter repoFilter;
  final IssueFilter issueFilter;
  final UserFilter userFilter;

  const InheritedSearchWidget(
      {Key? key,
      required this.searchText,
      required this.searchChild,
      required this.repoFilter,
      required this.issueFilter,
      required this.userFilter})
      : super(key: key, child: searchChild);

  @override
  bool updateShouldNotify(covariant InheritedSearchWidget oldWidget) {
    return oldWidget.searchText != searchText ||
        oldWidget.repoFilter != repoFilter ||
        oldWidget.userFilter != userFilter ||
        oldWidget.issueFilter != issueFilter;
  }

  static InheritedSearchWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedSearchWidget>();
  }
}
