import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  int? id;
  int? likes;
  String? title;
  String? description;
  String? image;
  DateTime? createdAt;
  //List<Comment>? comments;

  PostModel({
    this.id,
    this.likes,
    this.title,
    this.description,
    this.image,
    this.createdAt,
   // this.comments,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json["id"],
    likes: json["likes"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
   // comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "likes": likes,
    "title": title,
    "description": description,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    //"comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x.toJson())),
  };
}

class CommentModel {
  int? id;
  int? postId;
  String? comment;
  DateTime? createdAt;

  CommentModel({
    this.id,
    this.postId,
    this.comment,
    this.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    id: json["id"],
    postId: json["post-id"],
    comment: json["comment"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "post-id": postId,
    "comment": comment,
    "created_at": createdAt?.toIso8601String(),
  };
}
