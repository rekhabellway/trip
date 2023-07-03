import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/controller/theme_controller.dart';
import 'package:trip/controller/user_controller.dart';
import 'package:trip/data/api/api_client.dart';
import 'package:trip/data/model/repository/product_repo.dart';
import '../data/util/app_constants.dart';
import '../controller/localization.dart';
import '../controller/post_controller.dart';
import '../data/model/response/lang_model.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => PostController(productRepo: Get.find()));
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => LocalizationController(
        sharedPreferences: Get.find(),
      ));
  Get.lazyPut(() => UserController());

  Map<String, Map<String, String>> _languages = Map();
  for (LanguageTransModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        _json;
  }
  return _languages;
}
