
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/home/initial_screen.dart';

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
      home: const InitialScreen(),
     // home: TaskInherited(child: const InitialScreen()),
    );
  }
}