import 'package:flutter/material.dart';
import 'package:flutter_gitee/widget/web_view_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatelessWidget {
  final _termsUrl = "https://gitee.com/terms";
  final _projectUrl = "https://github.com/gitofleonardo/FlutterGitee";
  final _aboutGiteeUrl = "https://gitee.com/about_us";
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(FontAwesomeIcons.infoCircle),
              title: const Text("Terms of Use"),
              onTap: () {
                //launch();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WebViewPage(url: _termsUrl);
                }));
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.git),
              title: const Text("About Gitee"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WebViewPage(url: _aboutGiteeUrl);
                }));
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.github),
              title: const Text("About This Project"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WebViewPage(url: _projectUrl);
                }));
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.searchLocation),
              title: const Text("Open This Project"),
              onTap: () {
                Navigator.pushNamed(context, "repository_detail_page",
                    arguments: "giteeofleo/FlutterGitee");
              },
            ),
          ],
        ),
      ),
    );
  }
}
