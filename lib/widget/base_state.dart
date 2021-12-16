import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/start/entry_page.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  void routeToLogin({bool showToast = true}) {
    if (showToast) {
      Fluttertoast.showToast(msg: "Token expired");
    }
    clearLocalAuth().then((value) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const EntryPage();
      }), (route) => false);
    });
  }

  void checkRequestBaseResult(BaseResult result) {
    if (result.state == BaseStatus.unauthorized) {
      routeToLogin();
    }
  }
}
