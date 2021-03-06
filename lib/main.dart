import 'package:ci_manager/controller.dart';
import 'package:ci_manager/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/views.dart';
import 'view/get_view.dart';


import 'package:easy_localization/easy_localization.dart';

void main() {
  //runApp(MyApp());
  //Model model = new Model();
  //Controller.initialize(model);
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('ru', 'RU')/*, Locale('de', 'DE')*/],
        path: 'assets/Localizations', // <-- change patch to your
        fallbackLocale: Locale('ru', 'RU'),
        //child: MyApp()
        child: GetMaterialApp(home: CIManagerApp()),
    ),
  );
}
