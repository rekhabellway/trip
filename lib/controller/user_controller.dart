import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/model/response/user_details_model.dart';

class UserController extends GetxController implements GetxService {
  UserDetailsModel? selectedUser;
  List<UserDetailsModel> users = [
    UserDetailsModel(
        id: 1, name: "Raj", address: "Indore", age: DateTime(2000)),
    UserDetailsModel(
        id: 2, name: "Abhishek", address: "Rewa", age: DateTime(2001)),
    UserDetailsModel(
        id: 3, name: "Amit", address: "Satna", age: DateTime(2002)),
    UserDetailsModel(
        id: 4, name: "Tanu", address: "Jabalpur", age: DateTime(2005)),
  ];

  DateTimeRange? selectedDateRange;

  void setSelectedDateRange(DateTimeRange val) {
    selectedDateRange = val;
    update();
  }

  void setSelectedUser(UserDetailsModel val) {
    selectedUser = val;
    update();
  }

  void addUser(UserDetailsModel val) {
    users.add(val);
    update();
  }

  void deleteUser(UserDetailsModel val) {
    users.remove(val);
    update();
  }

  void updateUser(UserDetailsModel val) {
    UserDetailsModel old = users.firstWhere((element) => element.id == val.id);
    old = val;
    update();
  }
}
