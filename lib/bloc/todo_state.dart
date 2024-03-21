// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

enum TodoStatus { initial, loading, success, error }

class TodoState extends Equatable {
  final List<Todo> todos;
  final TodoStatus status;
  const TodoState({
    this.todos = const <Todo>[],
    this.status = TodoStatus.initial,
  });

  @override
  List<Object> get props => [todos, status];

  TodoState copyWith({
    List<Todo>? todos,
    TodoStatus? status,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
    );
  }

  factory TodoState.fromJson(Map<String, dynamic> json) {
    try {
      var listOfTodos = (json['todo'] as List<dynamic>)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList();
      return TodoState(
        todos: listOfTodos,
        status: TodoStatus.values
            .firstWhere((element) => element.name.toString() == json['status']),
      );
    } catch (e) {
      rethrow;
    }
  }
  Map<String, dynamic> toJson() {
    return {
      'todo': todos,
      'status': status.name,
    };
  }
}
