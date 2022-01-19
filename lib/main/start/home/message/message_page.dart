import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/start/home/home_widget.dart';

class MessagePage extends StatefulWidget implements HomeWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  MessagePageState createState() => MessagePageState();

  @override
  Widget getIcon() {
    return const Icon(Icons.home);
  }

  @override
  String getText(BuildContext context) {
    return S.of(context).messages;
  }
}

class MessagePageState extends State<MessagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("hello"),
    );
  }
}
