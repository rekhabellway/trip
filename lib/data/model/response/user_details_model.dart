import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) => UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) => json.encode(data.toJson());

class UserDetailsModel {
  int? id;
  String? name;
  String? address;
  DateTime? age;

  UserDetailsModel({
    this.id,
    this.name,
    this.address,
    this.age,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
    id: json["id"],
    name: json["name"],
    address: json["address"],
      age: json["age"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "age": age
  };
}
