import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/post_controller.dart';
import '../data/model/post_model.dart';

class CreatePost extends StatefulWidget {
  final PostModel? model;

  CreatePost({Key? key, this.model}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _formkey = GlobalKey();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final focusTitle = FocusNode();
  final focusDescription = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.model != null) {
        Get.find<PostController>().addImage(XFile(widget.model!.image!));
        titleController.text = widget.model!.title!;
        descriptionController.text = widget.model!.description!;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "CretePost",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TextButton(
                onPressed: () {
                  if (Get.find<PostController>().imageFile == null) {
                    SnackBar(content: Text('Please select image'));
                    return;
                  }
                  if (titleController.text.isEmpty) {
                    SnackBar(content: Text('Please enter title'));
                    return;
                  }
                  if (descriptionController.text.isEmpty) {
                    SnackBar(content: Text('Please enter description'));
                    return;
                  }
                  if (widget.model == null) {
                    PostModel newModel = PostModel(
                      id: Random().nextInt(10000),
                      image: Get.find<PostController>().imageFile!.path,
                      title: titleController.text,
                      description: descriptionController.text,
                      createdAt: DateTime.now(),
                      likes: 0,
                    );
                    Get.find<PostController>().addPost(newModel);
                    Get.back();
                  } else {
                    widget.model!.image =
                        Get.find<PostController>().imageFile!.path;
                    widget.model!.title = titleController.text;
                    widget.model!.description = descriptionController.text;
                    Get.find<PostController>().updatePost(widget.model!);
                    Get.back();
                  }
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          )),
      body: ListView(
        children: [
          GetBuilder<PostController>(builder: (postController) {
            return Container(
                child: postController.imageFile == null
                    ? TextButton(
                        onPressed: () {
                          _getFromGallery();
                        },
                        child: Text("PICK FROM GALLERY"),
                      )
                    : Container(
                        child: Image.file(
                            File(Get.find<PostController>().imageFile!.path))));
          }),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                      controller: titleController,
                      focusNode: focusTitle,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "title")),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      controller: descriptionController,
                      focusNode: focusDescription,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Description")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getFromGallery() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      Get.find<PostController>().addImage(image);
    }
  }
}
