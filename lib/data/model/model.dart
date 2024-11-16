class Todo {
  int? id;
  String? title;
  String? body;
  int? userId;

  Todo({
    this.id,
    this.title,
    this.body,
    this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'] as int?,
        title: json['title'] as String?,
        body: json['body'] as String?,
        userId: json['userId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'userId': userId,
      };
}
