import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import '../../view/custom_snackbar.dart';
import '../model/response/response_model.dart';

Future<ResponseModel> checkResponseModel(Response response) async {
  log(response.statusCode.toString());
  log(json.encode(response.body));
  if (response.statusCode == 401) {
    showCustomSnackBar('Auth Failed', isError: true);
    return ResponseModel(false, 'Unauthorized', null);
  }
  if (response.statusCode == 200 || response.statusCode == 201) {
    if (response.body['status']) {
      return ResponseModel(response.body['status'],
          response.body['message'] ?? '', response.body['data']);
    } else {
      return ResponseModel(
          response.body['status'], response.body['message'] ?? '', null);
    }
  } else {
    if (!response.body.toString().startsWith('{')) {
      showCustomSnackBar('Internal Server Error :${response.statusCode}',
          isError: true);
      return ResponseModel(false, 'Internal Server Error', null);
    } else {
      return ResponseModel(
          response.body['status'], response.body['message'], null);
    }
  }
}
