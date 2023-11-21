import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageOption extends StatelessWidget {
  final String languageCode;
  final String languageText;
  final String languageNation;

  const LanguageOption({
    required this.languageCode,
    required this.languageText,
    required this.languageNation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _changeLocale(context, languageCode, languageNation);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(languageText),
      ),
    );
  }

  void _changeLocale(
      BuildContext context, String languageCode, String languageNation) {
    context.setLocale(Locale(languageCode, languageNation));
  }
}
