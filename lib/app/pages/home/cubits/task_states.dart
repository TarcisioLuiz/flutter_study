import 'package:flutter_study/app/components/task.dart';

abstract class TaskState {}

class InitalTaskState extends TaskState {}

class LoadingTaskState extends TaskState {}

class LoadedTaskState extends TaskState {
  final List<Task> tasks;

  LoadedTaskState(this.tasks);
}

class ErrorTaskState extends TaskState {
  final String message;

  ErrorTaskState(this.message);
}