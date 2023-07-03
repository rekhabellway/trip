import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trip/data/model/response/payment_page.dart';
import 'package:trip/view/scroll_paginator.dart';
import '../controller/post_controller.dart';

class ButtonPaginatorPostListScreen extends StatefulWidget {
  final Paginator? paginator;
  const ButtonPaginatorPostListScreen({
    Key? key,
    this.paginator,
  }) : super(key: key);

  @override
  State<ButtonPaginatorPostListScreen> createState() =>
      _ButtonPaginatorPostListScreenState();
}

class _ButtonPaginatorPostListScreenState
    extends State<ButtonPaginatorPostListScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Get.find<PostController>().getPaymentList(
        page: Get.find<PostController>().data == null
            ? 1
            : Get.find<PostController>().data!.paginator!.page!);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Get.find<PostController>().getPaymentList();
    _refreshController.loadComplete();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Post List"),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(ScrollPaginatorPostList());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: GetBuilder<PostController>(builder: (postController) {
        return SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          enablePullDown: true,
          enablePullUp: false,
          child: postController.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : postController.paymentFetched
                  ? ListView.builder(
                      itemCount: postController.data!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.green[200],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'This item represents $index.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  postController.data!.data![index].amount
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  postController.data!.data![index].quantity
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  postController.data!.data![index].updatedAt
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  postController.data!.data![index].product
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text("Not Fetched"),
                    ),
        );
      }),
      bottomNavigationBar:
          GetBuilder<PostController>(builder: (postController) {
        if (postController.isLoading || !postController.paymentFetched) {
          return SizedBox();
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            postController.data!.paginator!.prevPage != null
                ? Container(
                    margin: EdgeInsets.all(8),
                    color: Colors.blueAccent,
                    child: TextButton(
                        onPressed: () {
                          if (postController.data!.paginator!.hasPrevPage!) {
                            postController.getPaymentList(
                                page: postController.data!.paginator!.prevPage);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    'prev page not available',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            );
                          }
                        },
                        child: Text(
                          "prev",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  )
                : SizedBox(),
            Text(postController.data!.paginator!.page.toString() +
                "/" +
                postController.data!.paginator!.totalPages.toString()),
            postController.data!.paginator!.nextPage != null
                ? Container(
                    margin: EdgeInsets.all(8),
                    color: Colors.blueAccent,
                    child: TextButton(
                        onPressed: () {
                          if (postController.data!.paginator!.hasNextPage!) {
                            postController.getPaymentList(
                                page: postController.data!.paginator!.nextPage);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    'next page not available',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            );
                          }
                        },
                        child: Text(
                          "next",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )))
                : SizedBox(),
          ],
        );
      }),
    );
  }
}
