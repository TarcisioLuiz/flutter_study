import 'package:flutter/material.dart';
import 'package:flutter_study/components/task.dart';

class InitialScrenn extends StatefulWidget {
  const InitialScrenn({super.key});

  @override
  State<InitialScrenn> createState() => _InitialScrennState();
}

class _InitialScrennState extends State<InitialScrenn> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            Task('Aprender Flutter na aluraaaaaa', 'assets/images/bird.png', 3),
            Task('Aprender Flutter', 'assets/images/bird.png', 2),
            Task('Aprender Flutter', 'assets/images/bird.png', 5),
            Task('Aprender Flutter', 'assets/images/bird.png', 1),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
