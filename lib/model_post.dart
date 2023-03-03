// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post PostFromJson(String str) => Post.fromJson(json.decode(str));

String PostToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.userId,
    required this.it,
    required this.title,
    required this.body,
  });

  int? userId;
  int? it;
  String? title;
  String? body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: json["userId"],
    it: json["it"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "it": it,
    "title": title,
    "body": body,
  };
}
