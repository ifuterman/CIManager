import 'package:flutter/material.dart';
import 'view/views.dart';

import 'package:easy_localization/easy_localization.dart';

void main() {
  //runApp(MyApp());
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('ru', 'RU')/*, Locale('de', 'DE')*/],
        path: 'assets/Localizations', // <-- change patch to your
        fallbackLocale: Locale('ru', 'RU'),
        child: MyApp()
    ),
  );
}
