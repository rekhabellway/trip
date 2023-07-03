import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:trip/controller/post_controller.dart';
import '../controller/theme_controller.dart';
import '../controller/user_controller.dart';
import '../data/model/response/post_model.dart';
import '../theme/dark_mode.dart';
import '../theme/light_mode.dart';

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
      Get.find<ThemeController>().darkTheme;
      Get.find<PostController>().addImage(XFile(widget.model.image!));
      commentController.text = widget.model.title!;
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return Scaffold(
        backgroundColor:
            themeController.darkTheme ? Colors.grey[300] : Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor:
              themeController.darkTheme ? Colors.pink[800] : Colors.pink,
          elevation: 0,
          title: Text(
            "Post_Details".tr,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar:
            GetBuilder<PostController>(builder: (postController) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: BoxDecoration(
                color: themeController.darkTheme ? Colors.white : Colors.black,
                boxShadow: [BoxShadow(blurRadius: 1, color: Colors.grey)]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextField(
                      style: TextStyle(
                        color: themeController.darkTheme
                            ? Colors.black
                            : Colors.white,
                      ),
                      controller: commentController,
                      focusNode: focusComment,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "comments".tr)),
                ),
                IconButton(
                    onPressed: () {
                      if (commentController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar( backgroundColor: Colors.red,
                            content: Text(
                          'Please enter comment',
                          style: TextStyle(
                              color: themeController.darkTheme
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold),
                        )));
                        return;
                      }
                      if (postController.commentModel == null) {
                        CommentModel newModel = CommentModel(
                          id: Random().nextInt(10000),
                          comment: commentController.text,
                          postId: widget.model.id,
                          createdAt: DateTime.now(),
                          likes: 0,
                        );
                        Get.find<PostController>().addComments(newModel);
                      } else {
                        Get.find<PostController>().commentModel!.comment =
                            commentController.text;
                        Get.find<PostController>().updateComment(PostModel());
                        Get.find<PostController>().updateEditingComment(null);
                      }
                      commentController.text = '';
                    },
                    icon: Icon(
                      Icons.send,
                      color: themeController.darkTheme
                          ? Colors.black
                          : Colors.white,
                      size: 25,
                    ))
              ],
            ),
          );
        }),
        body: GetBuilder<PostController>(builder: (postController) {
          return InkWell(
            onTap: () {
              Get.find<ThemeController>().darkTheme ? darkMode : lightMode;
            },
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Get.find<ThemeController>().darkTheme
                      ? Colors.grey[900]
                      : Colors.white,
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
                    SizedBox(width: 5,),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.model.title.toString(),
                              style: TextStyle(
                                  color: themeController.darkTheme
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.model.description!,
                              style: TextStyle(
                                  color: themeController.darkTheme
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(Get.find<UserController>()
                                .users
                                .firstWhere((element) =>
                                    widget.model.userId == element.id)
                                .name!),
                            Text(
                              DateFormat('dd-MMM-yyyy').add_jm()
                                  .format(widget.model.createdAt!),
                              style: TextStyle(
                                  color: themeController.darkTheme
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 20),
                            ),
                          ]),
                    ),
                    Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    widget.model.likes =
                                        widget.model.likes! - 1;
                                    Get.find<PostController>()
                                        .updatePost(widget.model);
                                  },
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        color: themeController.darkTheme
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  )),
                              Icon(
                                Icons.favorite_border_outlined,
                                size: 30,
                                color: Colors.red,
                              ),
                              TextButton(
                                  onPressed: () {
                                    widget.model.likes =
                                        widget.model.likes! + 1;
                                    Get.find<PostController>()
                                        .updatePost(widget.model);
                                  },
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        color: themeController.darkTheme
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  )),
                            ]),
                        Text(
                          widget.model.likes.toString(),
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
// Send Comment
              Text(
                "Comments".tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      themeController.darkTheme ? Colors.white : Colors.black,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: postController.comments
                      .where((element) => element.postId == widget.model.id!)
                      .toList()
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    CommentModel model = postController.comments
                        .where((element) => element.postId == widget.model.id!)
                        .toList()[index];
                    return Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: themeController.darkTheme
                            ? Colors.black
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 1)
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.comment!.tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: themeController.darkTheme
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Get.find<PostController>()
                                        .updateEditingComment(model);
                                    commentController.text = model.comment!;
                                    focusComment.requestFocus();
                                    Get.find<PostController>()
                                        .updateComment(model as PostModel);
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: themeController.darkTheme
                                        ? Colors.white
                                        : Colors.black,
                                    size: 25,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat('yyyy-MM-dd')
                                    .format(model.createdAt!),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Get.find<PostController>()
                                        .deleteComments(model);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: themeController.darkTheme
                                        ? Colors.white
                                        : Colors.black,
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
            ]),
          );
        }),
      );
    });
  }
}
