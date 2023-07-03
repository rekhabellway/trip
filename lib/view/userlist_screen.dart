import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';
import 'package:trip/data/model/response/user_details_model.dart';
import 'package:trip/view/add_user.dart';
import 'package:trip/view/giftcard.dart';
import 'package:trip/view/post_list_screen.dart';
import 'package:trip/view/postuserlist_screen.dart';
import 'package:trip/view/userdetails_screen.dart';
import '../controller/theme_controller.dart';
import '../controller/user_controller.dart';
import '../data/model/response/postlist.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  ThemeController themeController = Get.find<ThemeController>();
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<UserController>().update();
      Get.find<ThemeController>().darkTheme;
    });
    super.initState();
  }

  void _show() async {
    var first_date = DateTime(1900, 1, 1);
    var last_date = DateTime(2100, 12, 31);
    final DateTimeRange? result = await showDateRangePicker(
      initialDateRange: Get.find<UserController>().selectedDateRange,
      context: context,
      firstDate: first_date,
      lastDate: last_date,
      currentDate: DateTime.now(),
      saveText: 'Done',
    );
    if (result != null) {
      Get.find<UserController>().setSelectedDateRange(result);
    }
  }

  bool isAscending = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return Scaffold(
        backgroundColor:
            themeController.darkTheme ? Color(0xff2a2929) : Color(0xfff2f3ff),
        appBar: AppBar(
          backgroundColor:
              themeController.darkTheme ? Colors.pink[800] : Colors.pink,
          title: Text(
            "User List".tr,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => AddUser());
                },
                icon: Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  if (isAscending) {
                    userController.users.sort((a, b) {
                      return a.age!.millisecondsSinceEpoch
                          .compareTo(b.age!.millisecondsSinceEpoch);
                    });
                  } else {
                    userController.users.sort((b, a) {
                      return a.age!.millisecondsSinceEpoch
                          .compareTo(b.age!.millisecondsSinceEpoch);
                    });
                  }
                  isAscending = !isAscending;
                  userController.update();
                },
                icon: isAscending
                    ? Icon(Icons.keyboard_arrow_down_outlined)
                    : Icon(Icons.keyboard_arrow_up_outlined)),
            IconButton(
              onPressed: () {
                _show();
              },
              icon: Icon(Icons.filter_list),
            ),
            IconButton(
                onPressed: () {
                  Get.to(() => PostUserListScreen());
                },
                icon: Icon(Icons.person)),
            IconButton(onPressed: () {
              Get.to( () => ButtonPaginatorPostListScreen());
            }, icon: Icon(Icons.list))
          ],
        ),
        body: GetBuilder<ThemeController>(builder: (themeController) {
          return GetBuilder<UserController>(builder: (userController) {
            List<UserDetailsModel> filtered =
                userController.users.where((element) {
              if (userController.selectedDateRange == null) {
                return true;
              } else {
                if (userController
                            .selectedDateRange!.start.millisecondsSinceEpoch <
                        element.age!.millisecondsSinceEpoch &&
                    userController
                            .selectedDateRange!.end.millisecondsSinceEpoch >
                        element.age!.millisecondsSinceEpoch) {
                  return true;
                } else {
                  return false;
                }
              }
            }).toList();

            return ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (BuildContext context, int index) {
                UserDetailsModel model = filtered[index];
                return InkWell(
                  onTap: () {
                    Get.to(() => UserDetails(
                          model: model,
                        ));
                  },
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
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
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.id.toString(),
                                      style: TextStyle(
                                          color: themeController.darkTheme
                                              ? Color(0xfff2f3ff)
                                              : Color(0xff2a2929),
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ProfilePicture(
                                          name: model.name!.tr,
                                          radius: 31,
                                          fontsize: 21,
                                          count: 3,
                                        ),
                                        SizedBox(
                                          width: 80,
                                        ),
                                        Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.red),
                                          child: Center(
                                            child: Text(
                                              model.name!.tr
                                                  .substring(0, 1)
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  color:
                                                      themeController.darkTheme
                                                          ? Color(0xff2a2929)
                                                          : Color(0xfff2f3ff),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      model.address!.tr,
                                      style: TextStyle(
                                          color: themeController.darkTheme
                                              ? Color(0xfff2f3ff)
                                              : Color(0xff2a2929),
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      model.age!.toString(),
                                      // (DateTime.now().year - model.age!.year)
                                      //     .toString(),
                                      style: TextStyle(
                                          color: themeController.darkTheme
                                              ? Color(0xfff2f3ff)
                                              : Color(0xff2a2929),
                                          fontSize: 20),
                                    ),
                                  ]),
                              IconButton(
                                  onPressed: () {
                                    Get.to(() => AddUser(model: model));
                                  },
                                  icon: Icon(Icons.edit,
                                      color: themeController.darkTheme
                                          ? Color(0xfff2f3ff)
                                          : Color(0xff2a2929)))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          });
        }),
      );
    });
  }
}
