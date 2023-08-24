import 'package:flutter/material.dart';
import 'components/menu.dart';

class SkillsKnowledge extends StatelessWidget {
  const SkillsKnowledge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conhecimentos e Habilidades"),
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
        child: Text("Conhecimentos e Habilidades"),
      ),
    );
  }
}