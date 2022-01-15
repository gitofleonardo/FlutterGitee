import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/user/bean/login_success_result_entity.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/base_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {
  var cur = 0;
  var _isLoggingIn = false;
  var _inputEnable = true;
  final GlobalKey<FormState> _formStateKey = GlobalKey();
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  Future<BaseResult<LoginSuccessResultEntity>> _login(
      String username, String password) async {
    setState(() {
      _inputEnable = false;
    });
    final value = await login(username, password);
    setState(() {
      _inputEnable = true;
    });
    if (value.state == BaseStatus.success) {
      final token = value.data?.accessToken;
      final refreshToken = value.data?.refreshToken;
      setLocalToken(token);
      setLocalRefreshToken(refreshToken);
      setLastLoginAccount(_unameController.text, _pwdController.text);
    }
    return value;
  }

  @override
  void initState() {
    super.initState();
    getLastLoginAccount().then((value) {
      if (value != null) {
        setState(() {
          _unameController.text = value.username;
          _pwdController.text = value.password;
        });
      }
    });
  }

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).loginToGitee),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          if (!_isLoggingIn &&
              (_formStateKey.currentState as FormState).validate()) {
            setState(() {
              _isLoggingIn = true;
            });
            _login(_unameController.text, _pwdController.text).then((value) {
              //login success
              if (value.state == BaseStatus.success) {
                Navigator.pop(context, true);
              } else {
                setState(() {
                  _isLoggingIn = false;
                });
                final reason = value.state == BaseStatus.unauthorized
                    ? S.of(context).wrongAccountOrPwd
                    : "${S.of(context).loginError}:${value.resultCode}";
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(reason),
                  action: value.errorMessage == null
                      ? null
                      : SnackBarAction(
                          label: S.of(context).details,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(S.of(context).details),
                                    content: SingleChildScrollView(
                                        child: Text(value.errorMessage!)),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(S.of(context).ok),
                                      )
                                    ],
                                  );
                                });
                          },
                        ),
                ));
              }
            });
          }
        },
        child: LayoutBuilder(
          builder: (ctx, constraint) {
            if (!_isLoggingIn) {
              return const Icon(Icons.login, color: Colors.white);
            }
            return const CircularProgressIndicator(
              color: Colors.white,
            );
          },
        ),
        isExtended: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formStateKey,
          child: Column(
            children: [
              TextFormField(
                enableSuggestions: true,
                enabled: _inputEnable,
                controller: _unameController,
                maxLines: 1,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: S.of(context).account,
                    hintText: S.of(context).usernameEmailPhone),
                validator: (username) {
                  return username!.trim().isNotEmpty
                      ? null
                      : S.of(context).usernameCannotBeEmpty;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                enabled: _inputEnable,
                obscureText: true,
                controller: _pwdController,
                maxLines: 1,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: S.of(context).password,
                    hintText: S.of(context).enterPwdHint),
                validator: (password) {
                  return password!.trim().isNotEmpty
                      ? null
                      : S.of(context).pwdCannotBeEmpty;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
