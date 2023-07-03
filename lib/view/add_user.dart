import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/theme_controller.dart';
import '../controller/user_controller.dart';
import '../data/model/response/user_details_model.dart';

class AddUser extends StatefulWidget {
  final UserDetailsModel? model;
  AddUser({Key? key, this.model}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _formkey = GlobalKey();
  ThemeController themeController = Get.find<ThemeController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final focusName = FocusNode();
  final focusAddress = FocusNode();
  final focusDate = FocusNode();
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.model != null) {
        nameController.text = widget.model!.name!;
        addressController.text = widget.model!.address!;
        pickedDate = widget.model!.age!;
      }
    });
    super.initState();
  }

  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          themeController.darkTheme ? Color(0xff2a2929) : Color(0xfff2f3ff),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor:
            themeController.darkTheme ? Colors.pink[800] : Colors.pink,
        title: Text(widget.model == null ? "Add User".tr : "Edit User".tr),
      ),
      bottomNavigationBar: ElevatedButton(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TextButton(
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Please enter name')),
                    );
                    return;
                  }
                  if (addressController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Please enter address')),
                    );
                    return;
                  }
                  if (pickedDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Please enter age')),
                    );
                    return;
                  }
                  if (widget.model == null) {
                    UserDetailsModel newModel = UserDetailsModel(
                        id: Random().nextInt(10000),
                        name: nameController.text,
                        address: addressController.text,
                        age: pickedDate);
                    Get.find<UserController>().addUser(newModel);
                    Get.back();
                  } else {
                    widget.model!.name = nameController.text;
                    widget.model!.address = addressController.text;
                    widget.model!.age = pickedDate;
                    Get.find<UserController>().updateUser(widget.model!);
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
          GetBuilder<UserController>(builder: (userController) {
            return Form(
                key: _formkey,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      TextField(
                          controller: nameController,
                          focusNode: focusName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "name".tr,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          controller: addressController,
                          focusNode: focusAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "address".tr,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          controller: dateController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              labelText: "Enter Date"),
                          readOnly: true,
                          onTap: () async {
                            pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2101));
                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate!);
                              print(formattedDate);
                              setState(() {
                                dateController.text = formattedDate;
                              });
                            } else {
                              print("Date is not selected".tr);
                            }
                          })
                    ])));
          }),
        ],
      ),
    );
  }
}
