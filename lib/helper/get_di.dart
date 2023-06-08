import 'package:get/get.dart';
import '../controller/post_controller.dart';

Future<void> init()async {
  Get.lazyPut(() => PostController());
}