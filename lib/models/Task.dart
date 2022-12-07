import 'package:equatable/equatable.dart';

class Task extends Equatable {
  String title;
  bool? isDone;
  bool? isDeleted;

  Task({required this.title, this.isDone, this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({String? title, bool? isDone, bool? isDeleted}) {
    return Task(
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted);
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'isDone': isDone, 'isDeleted': isDeleted};
  }

  factory Task.fromJSONResponse(Map<String, dynamic> response) {
    return Task(
        title: response['title'],
        isDone: response['isDone'],
        isDeleted: response['isDeleted']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, isDone, isDeleted];
}
