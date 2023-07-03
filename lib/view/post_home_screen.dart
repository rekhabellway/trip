import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trip/controller/post_controller.dart';
import 'package:trip/controller/theme_controller.dart';
import 'package:trip/view/post_details_screen.dart';
import 'package:trip/view/userlist_screen.dart';
import '../controller/user_controller.dart';
import '../data/model/response/post_model.dart';
import 'created_post_screen.dart';
import 'language_page.dart';

class PostHomeScreen extends StatelessWidget {
  PostHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return Scaffold(
        backgroundColor:
            themeController.darkTheme ? Color(0xff2a2929) : Color(0xfff2f3ff),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor:
              themeController.darkTheme ? Colors.pink[800] : Colors.pink,
          elevation: 0,
          title: Text(
            "Post".tr,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.find<PostController>().imageFile = null;
                  Get.to(() => CreatePost());
                },
                icon: Icon(
                  Icons.add,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  Get.find<PostController>().posts.sort((a, b) {
                    return a.likes!.compareTo(b.likes!);
                  });
                  Get.find<PostController>().update();
                },
                icon: Icon(
                  Icons.sort,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  Get.find<PostController>().posts.sort((b, a) {
                    return a.likes!.compareTo(b.likes!);
                  });
                  Get.find<PostController>().update();
                },
                icon: Icon(
                  Icons.filter_list_sharp,
                  size: 30,
                )),
            IconButton(
                icon: Icon(themeController.darkTheme
                    ? Icons.dark_mode
                    : Icons.light_mode),
                onPressed: () {
                  themeController.toggleTheme();
                }),
            IconButton(
                icon: Icon(Icons.language_outlined),
                onPressed: () {
                  Get.to(() => LanguagePage());
                }),
            IconButton(
                onPressed: () {
                  Get.find<UserController>().update();
                  Get.to(() => UserScreen());
                },
                icon: Icon(Icons.person))
          ],
        ),
        body: GetBuilder<PostController>(builder: (postController) {
          return ListView.builder(
            itemCount: postController.posts.length,
            itemBuilder: (BuildContext context, int index) {
              PostModel postModel = postController.posts[index];
              return InkWell(
                onTap: () {
                  Get.to(() => PostDetailsScreen(model: postModel));
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: themeController.darkTheme
                        ? Color(0xff313134)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
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
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postModel.title!,
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
                                    postModel.userId ==
                                    element.id)
                                .name!),
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
                              DateFormat('dd-MMM-yyyy')
                                  .add_jm()
                                  .format(postModel.createdAt!),
                              style: TextStyle(
                                  color: themeController.darkTheme
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.find<PostController>()
                                    .deletePost(postModel);
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                                color: themeController.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                              )),
                          IconButton(
                              onPressed: () {
                                Get.to(() => CreatePost(model: postModel));
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 30,
                                color: themeController.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                              )),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      postModel.likes = (postModel.likes! - 1);
                                      postController.update();
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
                                      postModel.likes = postModel.likes! + 1;
                                      postController.update();
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
                            postModel.likes!.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      );
    });
  }
}
