import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/user/bean/result/success/login_success_result_entity.dart';
import 'package:flutter_gitee/user/model/user_model.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var cur = 0;
  var _isLoggingIn = false;
  var _inputEnable = true;
  var _originUname = "";
  var _originPwd = "";
  final GlobalKey<GlobalThemeWidgetState> _key = GlobalKey();
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
  Widget build(BuildContext context) {
    return GlobalThemeWidget(
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login to Gitee"),
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
                      ? "Wrong account or password"
                      : "LoginError:${value.resultCode}";
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(reason),
                    action: value.errorMessage == null
                        ? null
                        : SnackBarAction(
                            label: "Details",
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Details"),
                                      content: SingleChildScrollView(
                                          child: Text(value.errorMessage!)),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("OK"),
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
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Account",
                      hintText: "Username/Email/Phone"),
                  validator: (username) {
                    return username!.trim().isNotEmpty
                        ? null
                        : "Username cannot be empty";
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
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      hintText: "Enter your password here"),
                  validator: (password) {
                    return password!.trim().isNotEmpty
                        ? null
                        : "Password cannot be empty";
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
