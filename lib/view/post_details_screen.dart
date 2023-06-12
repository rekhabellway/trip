import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:trip/controller/post_controller.dart';
import '../data/model/post_model.dart';


class PostDetailsScreen extends StatefulWidget {
  final PostModel model;

  PostDetailsScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  TextEditingController commentController = TextEditingController();
  final focusComment = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<PostController>().updateEditingComment(null);
      Get.find<PostController>().addImage(XFile(widget.model.image!));
      commentController.text = widget.model.title!;
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: Text(
          "Post Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: GetBuilder<PostController>(builder: (postController) {
        return Container(
          margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 1, color: Colors.grey)]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextField(
                    controller: commentController,
                    focusNode: focusComment,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "comments")),
              ),
              IconButton(
                  onPressed: () {
                    if (commentController.text.isEmpty) {
                      SnackBar(content: Text('Please enter comment',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),));
                      return;
                    }
                    if (postController.commentModel == null) {
                      CommentModel newModel = CommentModel(
                        id: Random().nextInt(10000),
                        comment: commentController.text,
                        postId: widget.model.id,
                        createdAt: DateTime.now(),

                      );
                      Get.find<PostController>().addComments(newModel);
                      }else{
                      Get.find<PostController>().commentModel!.comment = commentController.text;
                      Get.find<PostController>().updateComment();
                      Get.find<PostController>().updateEditingComment(null);
                    }commentController.text = '';
                  },
                  icon: Icon(
                    Icons.send,
                    size: 25,
                  ))
            ],
          ),
        );
      } ),
      body: GetBuilder<PostController>(builder: (postController) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.file(
                  File(widget.model.image!),
                  height: 80,
                  width: 120,
                ),
                Column(
                  children: [
                    Text(
                      widget.model.title.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                  widget.model.description!,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd').format(widget.model.createdAt!),
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    IconButton(
                        icon:  Icon(
                          Icons.favorite_border_outlined,
                          size: 30,
                            color: Colors.black,
                        ),
                        onPressed: () {
                          widget.model.likes=widget.model.likes!+1;
                           Get.find<PostController>().updatePost(widget.model);
                        }),
                    Text(  widget.model.likes.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            "Comments",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: postController.comments.where((element) => element.postId==widget.model.id!).toList().length,
              itemBuilder: (BuildContext context, int index) {
                CommentModel model = postController.comments.where((element) => element.postId==widget.model.id!).toList()[index];
                return Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            model.comment!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.find<PostController>().updateEditingComment(
                                    model);
                                  commentController.text = model.comment!;
                                focusComment.requestFocus();
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black,
                                size: 25,
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('yyyy-MM-dd').format(
                                model.createdAt!),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.find<PostController>().deleteComments(model);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.black,
                                size: 25,
                              ))
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ]);
      }),
    );
  }
}
