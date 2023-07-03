import 'package:get/get.dart';
import '../../api/api_client.dart';
import '../../util/app_constants.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});

  Future<Response> getPopularProductList(String type) async {
    return await apiClient
        .getData('${AppConstants.popularProductUri}?type=$type');
  }

  Future<Response> getPaymentList({int page = 1, int limit = 10}) async {
    return await apiClient
        .getData("${AppConstants.paymentUri}?page=$page&limit=$limit");
  }

  Future<Response> getPostList({
   post
  }) async {
    return await apiClient.getData("${AppConstants.postListUri}/$post");
  }
}
