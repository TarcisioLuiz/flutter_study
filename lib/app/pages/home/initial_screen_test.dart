import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_study/app/pages/form_screen.dart';
import 'package:flutter_study/app/pages/home/cubits/task_cubit.dart';

import '../../components/task.dart';
import '../form_screen_test.dart';
import 'cubits/task_states.dart';


class InitialScreenTest extends StatefulWidget {
  const InitialScreenTest({super.key});

  @override
  State<InitialScreenTest> createState() => _InitialScreenTestState();
}

class _InitialScreenTestState extends State<InitialScreenTest> {
  late final TaskCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<TaskCubit>(context);
    cubit.listTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  cubit.listTasks();
                  print('Recarregando a tela');
                });
              },
              icon: Icon(Icons.refresh))
        ],
        title: const Text('Tarefas'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: BlocBuilder(
          bloc: cubit,
            builder: (context, state) {

                if (state is InitalTaskState) {
                  return const Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, size: 128),
                        Text(
                          "Não há nenhuma tarefa",
                          style: TextStyle(fontSize: 32),
                        ),
                      ],
                    ),
                  );
                }
                else if (state is LoadingTaskState) {
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando")
                      ],
                    ),
                  );
                } else if (state is LoadedTaskState) {
                  return _buildTaskList(state.tasks);
                } else {
              return _buildTaskList(cubit.tasks); }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreenTest(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {
            cubit.addTask(task: value);
                print('Recarregando a tela inicial');
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskList(List<Task> tasks) {
    return BlocProvider.value(
      value: TaskCubit(), // substitua 'seuCubit' pelo seu cubit
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (_, index) {
              final Task tarefa = tasks[index];
              return tarefa;
            },
          );
        },
      ),
    );
  }

}
