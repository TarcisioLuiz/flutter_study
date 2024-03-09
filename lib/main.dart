import 'package:flutter/material.dart';
import 'package:flutter_study/data/task_inherited.dart';
import 'package:flutter_study/screens/form_screen.dart';
import 'package:flutter_study/screens/test_form_screen.dart';

import 'screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}







