
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/util/dimensions.dart';
import '../data/util/styles.dart';

void showCustomSnackBar(String? message, {bool isError = true}) {
  if(message != null && message.isNotEmpty) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      dismissDirection: DismissDirection.horizontal,
      margin: EdgeInsets.only(
        right: Dimensions.paddingSizeSmall,
        top: Dimensions.paddingSizeSmall, bottom: Dimensions.paddingSizeSmall, left: Dimensions.paddingSizeSmall,
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: isError ? Colors.red : Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
      content: Text(message, style: robotoMedium.copyWith(color: Colors.white)),
    ));
  }
}