import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/main/widget/avatar_view.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/base_state.dart';

import 'bean/user_profile_entity.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends BaseState<ProfileEditPage> {
  late UserProfileEntity _profile;
  late final Future<BaseResult<UserProfileEntity>> _loadFuture =
      getMyUserProfile();

  void _refreshPage() {
    setState(() {});
  }

  void _patchProfile(BuildContext context, String property, String newValue) {
    showLoadingDialog(context, S.of(context).loading);
    patchUserProfile(property, newValue).then((value) {
      Navigator.pop(context);
      if (value.success) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).successfullyChanged)));
        setState(() {});
      } else {
        showMessageDialog(
            context, S.of(context).error, S.of(context).networkError);
      }
    });
  }

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).userProfile),
      ),
      body: FutureBuilder<BaseResult<UserProfileEntity>>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data;
            if (data == null || !data.success) {
              return TapToRetryWidget(
                  onTap: () {
                    setState(() {});
                  },
                  message: S.of(context).networkError);
            }
            _profile = snapshot.data!.data!;
            return _createMainProfile(context);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getMyUserProfile(),
      ),
    );
  }

  Widget _createMainProfile(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                AvatarView(
                  avatarUrl: "${_profile.avatarUrl}",
                  radius: 64,
                  onTap: () {
                    Navigator.pushNamed(context, "view_picture_page",
                        arguments: _profile.avatarUrl);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                _createProfileItem(S.of(context).username, "${_profile.login}"),
                _createProfileItem(S.of(context).nickname, "${_profile.name}",
                    editable: true, onTap: () {
                  _openProfileItemEditDialog(
                      context, S.of(context).nickname, _profile.name, "name");
                }),
                _createProfileItem(S.of(context).bio,
                    _profile.bio == null ? S.of(context).notSet : _profile.bio!,
                    editable: true, onTap: () {
                  _openProfileItemEditDialog(
                      context, S.of(context).bio, _profile.bio, "bio");
                }),
                _createProfileItem(S.of(context).registerDate,
                    formatDateYYYYMMDD(_profile.createdAt!)),
                _createProfileItem(
                    S.of(context).blog,
                    _profile.blog == null
                        ? S.of(context).notSet
                        : _profile.blog!,
                    editable: true, onTap: () {
                  _openProfileItemEditDialog(
                      context, S.of(context).blog, _profile.blog, "blog");
                }),
                _createProfileItem(S.of(context).id, "${_profile.id}"),
                _createProfileItem(
                    S.of(context).weibo,
                    _profile.weibo == null
                        ? S.of(context).notSet
                        : "${_profile.weibo}",
                    editable: true, onTap: () {
                  _openProfileItemEditDialog(
                      context, S.of(context).weibo, _profile.weibo, "weibo");
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openProfileItemEditDialog(BuildContext context, String title,
      String? originValue, String propertyName) {
    final controller = TextEditingController();
    controller.text = originValue ?? "";
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: theme.theme.colorScheme.background,
          title: Text(title),
          content: TextField(
            minLines: 2,
            maxLines: null,
            controller: controller,
            decoration: InputDecoration(
              label: Text(title),
              border: const OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).cancel)),
            TextButton(
                onPressed: () {
                  final value = controller.text;
                  if (value.isEmpty) {
                    return;
                  }
                  FocusScope.of(context).unfocus();
                  _patchProfile(context, propertyName, value);
                },
                child: Text(S.of(context).confirm))
          ],
        );
      },
    );
  }

  Widget _createProfileItem(String title, String content,
      {bool editable = false, VoidCallback? onTap}) {
    final Widget iconButton;
    if (editable) {
      iconButton = GestureDetector(
        onTap: onTap,
        child: Icon(
          Icons.edit,
          color: theme.theme.colorScheme.primary,
          size: 16,
        ),
      );
    } else {
      iconButton = const SizedBox(
        width: 0,
        height: 0,
      );
    }
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.theme.colorScheme.onBackground),
              ),
            ),
            iconButton
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: SelectableText(
            content,
            style: TextStyle(
                fontSize: 14,
                color: theme.theme.colorScheme.onBackground.withAlpha(200)),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
