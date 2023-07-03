import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  ThemeController({required this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  bool darkTheme = false;

  void toggleTheme() {
    darkTheme = !darkTheme;
    sharedPreferences.setBool("Theme", darkTheme);
    update();
  }

  void _loadCurrentTheme() async {
    darkTheme = sharedPreferences.getBool("Theme") ?? false;
    update();
  }
}