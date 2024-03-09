import 'package:flutter/cupertino.dart';
import 'package:flutter_study/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter na aluraaaaaa', 'assets/images/bird.png', 3),
    Task('Aprender Flutter', 'assets/images/bird.png', 2),
    Task('Aprender Flutter', 'assets/images/bird.png', 5),
    Task('Aprender Flutter', 'assets/images/bird.png', 1),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
