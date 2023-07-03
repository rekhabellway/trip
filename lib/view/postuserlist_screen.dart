import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/controller/post_controller.dart';

class PostUserListScreen extends StatefulWidget {
  const PostUserListScreen({Key? key}) : super(key: key);

  @override
  State<PostUserListScreen> createState() => _PostUserListScreenState();
}

class _PostUserListScreenState extends State<PostUserListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<PostController>().getPaymentList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("PostListUser"),
        ),
        body: GetBuilder<PostController>(builder: (postController) {
          return GetBuilder<PostController>(builder: (postController) {
            if (postController.paymentFetched) {
              return ListView.builder(
                itemCount: postController.data!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          postController.data!.data![index].product.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Text(
                "Payment Details Not Found",
                style: TextStyle(color: Colors.black),
              );
            }
          });
        }));
  }
}
