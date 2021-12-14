import 'package:flutter/material.dart';

class InheritedSearchWidget extends InheritedWidget {
  final Widget searchChild;
  final String searchText;
  const InheritedSearchWidget(
      {Key? key, required this.searchText, required this.searchChild})
      : super(key: key, child: searchChild);

  @override
  bool updateShouldNotify(covariant InheritedSearchWidget oldWidget) {
    return oldWidget.searchText != searchText;
  }

  static InheritedSearchWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedSearchWidget>();
  }
}
