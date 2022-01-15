import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/widget/my_radio_list_tile.dart';
import 'package:flutter_gitee/utils/global_constant.dart';
import 'package:flutter_gitee/utils/global_context.dart';
import 'package:flutter_gitee/widget/base_state.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends BaseState<LanguageSelectionPage> {
  var _currentLang = globalLanguage!;

  @override
  Widget create(BuildContext context) {
    final langs = globalLanguages;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).language),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final lang = langs[index];
          return MyRadioListTile<String>(
            myTitle: Text(lang.name),
            onChanged: (value) {
              setState(() {
                _currentLang = value;
              });
              language = value;
            },
            groupValue: _currentLang,
            value: lang.lang,
          );
        },
        itemCount: langs.length,
      ),
    );
  }
}
