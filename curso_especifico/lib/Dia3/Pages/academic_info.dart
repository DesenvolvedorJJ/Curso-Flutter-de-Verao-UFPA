import 'package:flutter/material.dart';
import 'components/menu.dart';

class AcademicInformation extends StatelessWidget {
  const AcademicInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informações acadêmicas"),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: const Menu(),
      body: const Center(
        child: Text("Informações acadêmicas"),
      ),
    );
  }
}
