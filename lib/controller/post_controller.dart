import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../view/model/post_model.dart';

class PostController extends GetxController implements GetxService {
  PostController();

  List<PostModel> posts = [];

  PostModel? postModel;
  List<CommentModel> comments = [];
  XFile? imageFile;


  void addPost(PostModel val) {
    posts.add(val);
    update();
  }

  void deletePost(PostModel val){
    posts.remove(val);
    update();
  }

  void updatePost(PostModel val){
    PostModel old = posts.firstWhere((element) => element.id==val.id );
    old=val;
    update();
  }

  void addComments(CommentModel val) {
    comments.add(val);
    update();
  }

  void addImage(XFile image) {
    imageFile = image;
    update();
  }


}