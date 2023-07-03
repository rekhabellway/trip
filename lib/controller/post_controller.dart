import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trip/data/api/api_checker.dart';
import 'package:trip/data/model/response/response_model.dart';
import '../data/model/repository/product_repo.dart';
import '../data/model/response/order_list_model.dart';
import '../data/model/response/post_model.dart';

class PostController extends GetxController implements GetxService {
  final ProductRepo productRepo;
  PostController({required this.productRepo});
  List<PostModel> posts = [];
  List<CommentModel> comments = [];

  XFile? imageFile;
  CommentModel? commentModel;
  OrderPage? data;
  List<OrderModel> paymentModels = [];
  bool paymentFetched = false;
  bool isLoading = false;

  //Post

  void addPost(PostModel val) {
    posts.add(val);
    update();
  }

  void deletePost(PostModel val) {
    posts.remove(val);
    update();
  }

  void updatePost(PostModel val) {
    PostModel old = posts.firstWhere((element) => element.id == val.id);
    old = val;
    update();
  }

// Comment
  void clear(CommentController) {
    clear(CommentController);
  }

  void updateEditingComment(CommentModel? val) {
    commentModel = val;
    update();
  }

  void updateComment(PostModel model) {
    CommentModel old =
        comments.firstWhere((element) => element.id == commentModel!.id!);
    old = commentModel!;
    update();
  }

  void addComments(CommentModel val) {
    comments.add(val);
    update();
  }

  void deleteComments(CommentModel val) {
    comments.remove(val);
    update();
  }

  void addImage(XFile image) {
    imageFile = image;
  }
// Api Integration

  Future<ResponseModel> getPaymentList(
      {int page = 1, bool scrollPaginator = false}) async {
    paymentFetched = false;
    isLoading = true;
    if (page == 1) {
      paymentModels.clear();
    }
    update();
    Response response = await productRepo.getPaymentList(page: page, limit: 1);
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusText));
    if (responseModel.status) {
      data = orderPageFromJson(jsonEncode(responseModel.data));
      if (scrollPaginator) {
        paymentModels.addAll(data!.data!);
      }
    }
    isLoading = false;
    paymentFetched = true;
    update();
    return responseModel;
  }

  // Future<ResponseModel> getPostList({post}) async {
  //   postList = false;
  //   isLoading = true;
  //   update();
  //   Response response = await productRepo.getPostList();
  //   ResponseModel responseModel = await checkResponseModel(response);
  //   if (responseModel.status) {
  //     post = postListFromJson(jsonEncode(responseModel.data));
  //   }
  //   isLoading = false;
  //   postList = true;
  //   update();
  //   return responseModel;
  // }
}
