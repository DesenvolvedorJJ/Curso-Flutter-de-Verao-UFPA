import 'package:flutter/material.dart';
import '../TelaProdutos/listaDeProdutos.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple, // Cor principal em roxo
      ),
      home: const ProductListScreen(),
    );
  }
}
