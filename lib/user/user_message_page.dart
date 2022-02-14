import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/widget/general_bottom_sheet_header.dart';
import 'package:flutter_gitee/main/start/home/message/bean/user_message_entity.dart';
import 'package:flutter_gitee/main/widget/avatar_view.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/base_state.dart';

class UserMessagePage extends StatefulWidget {
  final UserMessageList message;

  const UserMessagePage({Key? key, required this.message}) : super(key: key);

  @override
  _UserMessagePageState createState() => _UserMessagePageState();
}

class _UserMessagePageState extends BaseState<UserMessagePage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).messageDetails),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createUserHeader(),
              const SizedBox(
                height: 10,
              ),
              SelectableText("${widget.message.content}")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showReplyDialog(context);
        },
        child: const Icon(Icons.message),
      ),
    );
  }

  void _showReplyDialog(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: bottomSheetShape,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: HeaderContentBottomSheet(
            title: S.of(context).reply,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                          hintText:
                              "${S.of(context).replyTo} ${widget.message.sender?.login}"),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        final message = _textController.text;
                        if (message.isEmpty) {
                          showMessageDialog(context, S.of(context).error,
                              S.of(context).textCannotBeEmpty);
                          return;
                        }
                        _sendUserMessage(context, message);
                      },
                      child: Text(S.of(context).reply))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _sendUserMessage(BuildContext context, String content) {
    showLoadingDialog(context, S.of(context).loading);
    sendUserMessage("${widget.message.sender?.login}", content).then((value) {
      Navigator.pop(context);
      if (value.success) {
        _textController.clear();
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).successfullyReply)));
      } else {
        showMessageDialog(
            context, S.of(context).error, S.of(context).failedReply);
      }
    });
  }

  Widget _createUserHeader() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        AvatarView(
          avatarUrl: "${widget.message.sender?.avatarUrl}",
          radius: 32,
          onTap: () {
            Navigator.pushNamed(context, "user_profile_page",
                arguments: widget.message.sender?.login);
          },
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(child: Text("${widget.message.sender?.login}")),
        Text(formatDate(widget.message.updatedAt ?? ''))
      ],
    );
  }
}
