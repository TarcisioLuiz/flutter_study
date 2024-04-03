import 'package:bloc/bloc.dart';
import 'package:flutter_study/app/pages/home/cubits/task_states.dart';

import '../../../components/task.dart';
import '../../../data/task_dao.dart';

class TaskCubit extends Cubit<TaskState> {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  TaskCubit() : super(InitalTaskState());
  
  Future<void> addTask({required Task task}) async {
    emit(LoadingTaskState());

    await Future.delayed(const Duration(seconds: 1));


    if (_tasks.contains(task)) {
      emit(ErrorTaskState('Você já adicionou essa tarefa'));
    } else {
      TaskDao().save(task);
      _tasks.add(task);
      emit(LoadedTaskState(_tasks));
    }
  }

  Future<void> removeTask({required String taskName}) async {
    emit(LoadingTaskState());

    await Future.delayed(const Duration(seconds: 1));
    List<Task> task = await TaskDao().find(taskName);
    TaskDao().delete(taskName);
    _tasks.remove(task[0]);

    emit(LoadedTaskState(_tasks));
  }

  Future<void> listTasks() async {
    emit(LoadingTaskState());

    _tasks = await TaskDao().findAll();

    emit(LoadedTaskState(_tasks));
  }
}