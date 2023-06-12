import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/model/post_model.dart';

class PostController extends GetxController implements GetxService {
  List<PostModel> posts = [];
  PostModel? postModel;
  List<CommentModel> comments = [];
  XFile? imageFile;
  CommentModel? commentModel;

  void updateEditingComment(CommentModel? val) {
    commentModel = val;
    update();
  }

  void clear(CommentController) {
    clear(CommentController);
  }

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

  void updateComment() {
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
    update();
  }
}
