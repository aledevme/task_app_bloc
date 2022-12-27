import 'package:equatable/equatable.dart';

class Task extends Equatable {
  int? userId;
  int? id;
  String title;
  bool? isDone;

  Task({required this.userId, this.id, required this.title, this.isDone}) {
    isDone = isDone ?? false;
  }

  Task copyWith(
      {int? userId, int? id, String? title, bool? isDone, bool? isDeleted}) {
    return Task(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        isDone: isDone ?? this.isDone);
  }

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'id': id, 'title': title, 'isDone': isDone};
  }

  factory Task.fromJSONResponse(Map<String, dynamic> response) {
    return Task(
        userId: response['userId'],
        id: response['id'],
        title: response['title'],
        isDone: response['isDone']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [userId, id, title, isDone];
}
