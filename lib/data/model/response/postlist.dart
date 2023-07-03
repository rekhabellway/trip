// To parse this JSON data, do
//
//     final postList = postListFromJson(jsonString);

import 'dart:convert';

List<PostList> postListFromJson(String str) => List<PostList>.from(json.decode(str).map((x) => PostList.fromJson(x)));

String postListToJson(List<PostList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostList {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostList({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostList.fromJson(Map<String, dynamic> json) => PostList(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
