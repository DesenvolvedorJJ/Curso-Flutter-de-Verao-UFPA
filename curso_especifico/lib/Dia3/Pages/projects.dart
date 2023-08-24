import 'package:flutter/material.dart';
import 'components/menu.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projetos"),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: const MenuScreen(),
      body: const Center(
        child: Text("Projetos"),
      ),
    );
  }
}
