import 'package:bloc/bloc.dart';
import 'package:flutter_study/app/pages/home/cubits/task_states.dart';

import '../../../components/task.dart';

class TaskCubit extends Cubit<TaskState> {
  final List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  TaskCubit() : super(InitalTaskState());
  
  Future<void> addTask({required Task task}) async {
    emit(LoadingTaskState());

    await Future.delayed(const Duration(seconds: 1));

    if (_tasks.contains(task)) {
      emit(ErrorTaskState('Você já adicionou essa tarefa'));
    } else {
      _tasks.add(task);
      emit(LoadedTaskState(_tasks));
    }
  }

  Future<void> removeTask({required int index}) async {
    emit(LoadingTaskState());

    await Future.delayed(const Duration(seconds: 1));

    _tasks.removeAt(index);

    emit(LoadedTaskState(_tasks));
  }
}