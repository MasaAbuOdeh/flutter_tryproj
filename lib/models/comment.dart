import 'dart:convert';

class Comment {
  final String userId;
  final String comment;
  final String username;
  Comment({
    required this.userId,
    required this.comment,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'comment': comment,
      'username':username,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      userId: map['userId'] ?? '',
      comment: map['comment']?? '',
      username: map['username']??'',
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source));
}