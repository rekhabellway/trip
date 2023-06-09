import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  int? id;
  int? userId;
  int? likes;
  String? title;
  String? description;
  String? image;
  DateTime? createdAt;
  //List<Comment>? comments;

  PostModel({
    this.id,
    this.userId,
    this.likes,
    this.title,
    this.description,
    this.image,
    this.createdAt,
    // this.comments,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        userId: json["userId"],
        likes: json["likes"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        // comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
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
  int? likes;
  String? comment;
  DateTime? createdAt;

  CommentModel({
    this.id,
    this.postId,
    this.likes,
    this.comment,
    this.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        likes: json["likes"],
        postId: json["post-id"],
        comment: json["comment"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "likes": likes,
        "post-id": postId,
        "comment": comment,
        "created_at": createdAt?.toIso8601String(),
      };
}
