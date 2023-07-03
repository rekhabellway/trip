import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trip/data/model/response/post_model.dart';
import '../controller/post_controller.dart';
import '../controller/theme_controller.dart';
import '../data/model/response/user_details_model.dart';

class UserDetails extends StatefulWidget {
  final UserDetailsModel model;
  UserDetails({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            themeController.darkTheme ? Color(0xff2a2929) : Color(0xfff2f3ff),
        appBar: AppBar(
          title: Text("User Details"),
          backgroundColor:
              themeController.darkTheme ? Colors.pink[800] : Colors.pink,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Get.find<ThemeController>().darkTheme
                    ? Colors.grey[900]
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.id!.toString(),
                      style: TextStyle(
                          color: themeController.darkTheme
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20),
                    ),
                    Text(
                      widget.model.name!,
                      style: TextStyle(
                          color: themeController.darkTheme
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.model.age!.toString(),
                      style: TextStyle(
                          color: themeController.darkTheme
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20),
                    ),
                  ]),
            ),
            Text(
              "Posts",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GetBuilder<PostController>(builder: (postController) {
                return ListView.builder(
                    itemCount: postController.posts
                        .where((element) => element.userId == widget.model.id)
                        .toList()
                        .length,
                    itemBuilder: (BuildContext context, int index) {
                      PostModel postModel = postController.posts
                          .where((element) => element.userId == widget.model.id)
                          .toList()[index];
                      return Container(
                        padding: EdgeInsets.all(3),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Get.find<ThemeController>().darkTheme
                              ? Colors.grey[900]
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 1)
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.file(
                              File(postModel.image!),
                              height: 80,
                              width: 120,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.model.name!,
                                    style: TextStyle(
                                        color: themeController.darkTheme
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    postModel.title!.toString(),
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
                                    postModel.description!,
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
                                    DateFormat('yyyy-MM-dd')
                                        .format(postModel.createdAt!),
                                    style: TextStyle(
                                        color: themeController.darkTheme
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 20),
                                  ),
                                ]),
                            Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            postModel.likes =
                                                postModel.likes! - 1;
                                            Get.find<PostController>()
                                                .updatePost(postModel);
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
                                            postModel.likes =
                                                postModel.likes! + 1;
                                            Get.find<PostController>()
                                                .updatePost(postModel);
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
                                  postModel.likes.toString(),
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              }),
            ),
          ],
        ));
  }
}
