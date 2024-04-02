import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_study/app/pages/home/cubits/task_cubit.dart';
import 'package:flutter_study/app/pages/home/initial_screen_test.dart';

import 'pages/home/initial_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TaskCubit(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
          ),
          home: const InitialScreenTest(),
          // home: TaskInherited(child: const InitialScreen()),
        ));
  }
}
