// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final String title;
  final String detail;
  bool isDone;

  Todo({
    this.title = '',
    this.detail = '',
    this.isDone = false,
  });

  Todo copyWith({
    String? title,
    String? detail,
    bool? isDone,
  }) {
    return Todo(
      title: title ?? this.title,
      detail: detail ?? this.detail,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'detail': detail,
      'isDone': isDone,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      detail: json['detail'],
      isDone: json['isDone'],
    );
  }

  @override
  String toString() {
    return ''' Todo:{
    title: $title\n
    detail: $detail\n
    isDone: $isDone\n
  }''';
  }
}
