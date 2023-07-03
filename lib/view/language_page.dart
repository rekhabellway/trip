import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/controller/theme_controller.dart';
import '../controller/localization.dart';
import '../data/model/response/lang_model.dart';
import '../data/util/app_constants.dart';


class LanguagePage extends StatefulWidget {
  LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return GetBuilder<ThemeController>(builder: (themeController) {
        return Scaffold(
          backgroundColor:
              themeController.darkTheme ? Color(0xff2a2929) : Color(0xfff2f3ff),
          appBar: AppBar(
            elevation: 0,
            backgroundColor:
                themeController.darkTheme ? Colors.pink[800] : Colors.pink,
            foregroundColor: Colors.white,
            title: Text('select_language'.tr),
          ),
          body: ListView.builder(
            itemCount: AppConstants.languages.length,
            itemBuilder: (BuildContext context, int index) {
              LanguageTransModel model = AppConstants.languages[index];
              return InkWell(
                onTap: () {
                  Get.find<LocalizationController>().setLanguage(
                      Locale(model.languageCode!, model.countryCode));
                },
                child: Container(
                  margin:  EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                        color: _isSelected
                            ? Colors.red: Colors.grey),
                  ),
                  child: ListTile(
                    leading: Text(model.id.toString()),
                    title: Text(model.languageName!),
                    subtitle: Text(model.languageCode!),
                    trailing: Image.asset(
                      model.image!,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      });
    });
  }
}
