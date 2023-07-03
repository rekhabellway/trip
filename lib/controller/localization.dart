import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/response/lang_model.dart';
import '../data/util/app_constants.dart';

class LocalizationController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;

  LocalizationController({required this.sharedPreferences, }) {
    loadCurrentLanguage();
  }

  Locale _locale = Locale(AppConstants.languages[0].languageCode!, AppConstants.languages[0].countryCode);
  bool _isLtr = true;
  List<LanguageTransModel> _languages = [];

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  List<LanguageTransModel> get languages => _languages;

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;
    if(_locale.languageCode == 'en') {
      _isLtr = false;
    }else {
      _isLtr = true;
    }
    try {
    }catch(e) {}

    saveLanguage(_locale);
    update();
  }

  void loadCurrentLanguage() async {
    _locale = Locale(sharedPreferences.getString(AppConstants.languageCode) ?? AppConstants.languages[0].languageCode!,
        sharedPreferences.getString(AppConstants.countryCode) ?? AppConstants.languages[0].countryCode);
    _isLtr = locale.languageCode != 'en';
    for(int index = 0; index<AppConstants.languages.length; index++) {
      if(AppConstants.languages[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }
    _languages = [];
    _languages.addAll(AppConstants.languages);
    update();
  }

  void saveLanguage(Locale locale) async {
    sharedPreferences.setString(AppConstants.languageCode, locale.languageCode);
    sharedPreferences.setString(AppConstants.countryCode, locale.countryCode!);
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void searchLanguage(String query) {
    if (query.isEmpty) {
      _languages  = [];
      _languages = AppConstants.languages;
    } else {
      _selectedIndex = -1;
      _languages = [];
      AppConstants.languages.forEach((language) async {
        if (language.languageName!.toLowerCase().contains(query.toLowerCase())) {
          _languages.add(language);
        }
      });
    }
    update();
  }
}