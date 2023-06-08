import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trip/controller/post_controller.dart';
import 'package:trip/view/post_details_screen.dart';
import 'created_post_screen.dart';
import 'model/post_model.dart';

class PostHomeScreen extends StatelessWidget {
   PostHomeScreen({Key? key}) : super(key: key);

  final List<PostModel> post = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Text("Post",style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){
            Get.find<PostController>().imageFile=null;
            Get.to( ()=> CreatePost());
          },
              icon: Icon(Icons.add, size: 30,)
          )
        ],
      ),
      body: GetBuilder<PostController>(
        global: true,
        builder: (postController) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: postController.posts.length,
            itemBuilder: (BuildContext context, int index) {
              return
                InkWell(
                  onTap: (){
                    Get.to( ()=> PostDetailsScreen(model: postController.posts[index]));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.grey,
                            blurRadius: 1)
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.file(File(postController.posts[index].image!), height: 80, width: 120,),
                        Column(
                          children: [
                            Text(postController.posts[index].title!, style: TextStyle(
                                color: Colors.black, fontSize: 20),),

                            SizedBox(height: 5,),

                            Text(postController.posts[index].description!, style: TextStyle(
                                color: Colors.black, fontSize: 20),),

                            SizedBox(height: 5,),

                            Text(DateFormat('yyyy-MM-dd').format(postController.posts[index].createdAt!),
                              style: TextStyle(
                                color: Colors.black, fontSize: 20),),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(onPressed: () {
                          Get.find<PostController>().deletePost(postController.posts[index]);
                            }, icon: Icon(
                              Icons.delete, size: 30, color: Colors.black,)),
                            IconButton(onPressed: () {
                              Get.to( ()=> CreatePost(model: postController.posts[index]));
                            }, icon: Icon(
                              Icons.edit, size: 30, color: Colors.black,))
                          ],
                        )
                      ],
                    ),
                  ),
                );
            },
          );
        }
      ),
    );
  }
}
