import 'package:equatable/equatable.dart';

class Task extends Equatable {
  String id;
  String title;
  bool? isDone;
  bool? isDeleted;

  Task({required this.id, required this.title, this.isDone, this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({String? id, String? title, bool? isDone, bool? isDeleted}) {
    return Task(
        id: id ?? this.id,
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'isDone': isDone, 'isDeleted': isDeleted};
  }

  factory Task.fromJSONResponse(Map<String, dynamic> response) {
    return Task(
        id: response['id'],
        title: response['title'],
        isDone: response['isDone'],
        isDeleted: response['isDeleted']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, isDone, isDeleted];
}
