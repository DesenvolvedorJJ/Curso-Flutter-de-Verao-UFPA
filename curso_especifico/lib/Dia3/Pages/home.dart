import 'package:flutter/material.dart';
import 'components/menu.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _openRightMenu(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Tela Inicial"),
      ),
    );
  }

  void _openRightMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return MenuScreen();
      },
    );
  }
}
