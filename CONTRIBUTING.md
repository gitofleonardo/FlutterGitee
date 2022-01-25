# Getting Started

First of all, if you want to compile this project, you need to install flutter and dart plugins in your Android Studio. Then just import this project. 

For now, flutter supports Android, IOS, WEB and Linux client.

## Plugin Recommendation

+ [Flutter](https://plugins.jetbrains.com/plugin/9212-flutter). Necessary plugin for developing flutter applications.
+ [Dart](https://plugins.jetbrains.com/plugin/6351-dart). Necessary plugin for dart langauge.
+ [FlutterJsonBeanFactory(Only Null Safety)](https://plugins.jetbrains.com/plugin/11415-flutterjsonbeanfactory-only-null-safety-). Generate bean class conveniently.
+ [Flutter Enhancement Suite](https://plugins.jetbrains.com/plugin/12693-flutter-enhancement-suite). Create flutter widget conveniently.

# Contribution

Before making contribution, make sure you have obtained client ID and client secret in Gitee. You should follow [this instruction](https://gitee.com/api/v5/oauth_doc#/list-item-3) to create your personal third-party application.

> Notice: Don't push your codes with your personal id and secret, they belong to you only!

Fork this project to your own repositories, and most importantly, don't forget to replace two constants: `clientID` and `clientSecret` defined in `flutter_gitee/lib/utils/app_secret.dart` with your client ID and client secret.  
