import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/post_controller.dart';
import '../controller/theme_controller.dart';
import '../controller/user_controller.dart';
import '../data/model/response/post_model.dart';

class CreatePost extends StatefulWidget {
  final PostModel? model;
  CreatePost({Key? key, this.model}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _formkey = GlobalKey();

  ThemeController themeController = Get.find<ThemeController>();
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
      backgroundColor:
          themeController.darkTheme ? Color(0xff2a2929) : Color(0xfff2f3ff),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor:
            themeController.darkTheme ? Colors.pink[800] : Colors.pink,
        title: Text(
          "CretePost".tr,
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
                  if (Get.find<UserController>().selectedUser == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Please select an user"),
                    ));
                    return;
                  }
                  if (Get.find<PostController>().imageFile == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Please select image')));
                    return;
                  }
                  if (titleController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Please enter title')));
                    return;
                  }
                  if (descriptionController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Please enter description')));
                    return;
                  }
                  if (widget.model == null) {
                    PostModel newModel = PostModel(
                      userId: Get.find<UserController>().selectedUser!.id!,
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
                    widget.model!.userId =
                        Get.find<UserController>().selectedUser!.id;
                    widget.model!.image =
                        Get.find<PostController>().imageFile!.path;
                    widget.model!.title = titleController.text;
                    widget.model!.description = descriptionController.text;
                    Get.find<PostController>().updatePost(widget.model!);
                    Get.back();
                  }
                },
                child: Text(
                  "Submit".tr,
                  style: TextStyle(
                      color: themeController.darkTheme
                          ? Colors.pink[800]
                          : Colors.pink,
                      fontWeight: FontWeight.bold),
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
                        child: Text(
                          "PICK FROM GALLERY".tr,
                          style: TextStyle(
                            color: themeController.darkTheme
                                ? Colors.pink[800]
                                : Colors.pink,
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          _getFromGallery();
                        },
                        child: Container(
                            child: Image.file(File(
                                Get.find<PostController>().imageFile!.path))),
                      ));
          }),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GetBuilder<UserController>(builder: (userController) {
                    return DropdownButton(
                      hint: Text(
                        'Please choose a user'.tr,
                        style: TextStyle(
                          color: themeController.darkTheme
                              ? Color(0xfff2f3ff)
                              : Color(0xff2a2929),
                        ),
                      ),
                      value: userController.selectedUser,
                      onChanged: (newValue) {
                        userController.setSelectedUser(newValue!);
                      },
                      items: userController.users.map((location) {
                        return DropdownMenuItem(
                          child: Text(
                            location.name!,
                            style: TextStyle(
                              color: themeController.darkTheme
                                  ? Color(0xfff2f3ff)
                                  : Color(0xff2a2929),
                            ),
                          ),
                          value: location,
                        );
                      }).toList(),
                    );
                  }),
                  TextField(
                      controller: titleController,
                      focusNode: focusTitle,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "title".tr)),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      controller: descriptionController,
                      focusNode: focusDescription,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "description".tr,
                      )),
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
