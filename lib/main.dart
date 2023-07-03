import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/controller/theme_controller.dart';
import 'package:trip/theme/dark_mode.dart';
import 'package:trip/theme/light_mode.dart';
import 'package:trip/view/message.dart';
import 'package:trip/view/post_home_screen.dart';
import 'controller/localization.dart';
import 'helper/get_di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> _languages = await init();
  runApp(MyApp(languages: _languages));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;

  const MyApp({super.key, required this.languages});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(
        builder: (localizationController) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeController.darkTheme ? darkMode : lightMode,
            locale: localizationController.locale,
            translations: Messages(languages: languages),
            home: PostHomeScreen(),
          );
        },
      );
    });
  }
}
