import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_gitee/main/widget/login_button.dart';
import 'package:flutter_gitee/utils/global_context.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends BaseState<Splash> {
  var _showLoginButton = false;

  Future<void> _setHighRefresh() async {
    try {
      await FlutterDisplayMode.supported;
    } on Exception {}
    await FlutterDisplayMode.setHighRefreshRate();
    setState(() {});
  }

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _setHighRefresh();
    });
    super.initState();
    _setHighRefresh();
    final token = getLocalToken();
    final refreshToken = getLocalRefreshToken();
    refreshToken.then((value) {
      globalRefreshToken = value;
    });
    token.then((value) {
      globalToken = value;
      if (value == null) {
        setState(() {
          _showLoginButton = true;
        });
      } else {
        Future.delayed(const Duration(milliseconds: 500)).then((value) {
          Navigator.popAndPushNamed(context, "home_page");
        });
      }
    });
  }

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: SvgPicture.asset(
                "assets/images/git.svg",
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Positioned(
              bottom: 42,
              child: LayoutBuilder(
                builder: (context, constraint) {
                  if (_showLoginButton) {
                    return Column(
                      children: [
                        SizedBox(
                          width: 200,
                          child: LoginButton(
                              text: "Password Login",
                              onPressed: () {
                                Navigator.pushNamed(context, "login_page")
                                    .then((value) {
                                  final loginSuccess = value as bool;
                                  if (loginSuccess) {
                                    Navigator.popAndPushNamed(
                                        context, "home_page");
                                  }
                                });
                              }),
                        ),
                        const SizedBox(height: 10)
                      ],
                    );
                  } else {
                    return const SizedBox(width: 0, height: 0);
                  }
                },
              ),
            ),
            Positioned(
              bottom: 10,
              child: Text(
                "Opensource Gitee Client",
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).colorScheme.primary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
