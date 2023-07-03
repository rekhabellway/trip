import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../controller/post_controller.dart';

class ScrollPaginatorPostList extends StatefulWidget {
  const ScrollPaginatorPostList({Key? key}) : super(key: key);

  @override
  State<ScrollPaginatorPostList> createState() =>
      _ScrollPaginatorPostListState();
}

class _ScrollPaginatorPostListState extends State<ScrollPaginatorPostList> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  PostController postController = Get.find<PostController>();
  void _onRefresh() async {
    await postController.getPaymentList(scrollPaginator: true);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    if (postController.data!.paginator!.hasNextPage!) {
      await postController.getPaymentList(
          page: postController.data!.paginator!.nextPage, scrollPaginator: true);
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
    _refreshController.loadComplete();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ScrollPagination PostList"),
        backgroundColor: Colors.blueAccent,
      ),
      body: GetBuilder<PostController>(builder: (postController) {
        return SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          enablePullDown: true,
          enablePullUp: true,
          child: postController.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : postController.paymentFetched
                  ? ListView.builder(
                      itemCount: postController.paymentModels.length,
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
                                  postController.paymentModels[index].updatedAt
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  postController.paymentModels[index].id

                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  postController.paymentModels[index].fabric
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  postController.paymentModels[index].customer
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),Text(
                                  postController.paymentModels[index].orderStatus
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  postController.paymentModels[index].deliveryDate
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  postController.paymentModels[index].quantity
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
                      child: Text("No Item Found"),
                    ),
        );
      }),
    );
  }
}
