import 'package:flutter/material.dart';
import '../TelaProdutos/listaDeProdutos.dart';

/*
class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _EstadoTelaInicial();
}

class _EstadoTelaInicial extends State<TelaInicial> {
  String? nome;
  double? preco;
  String? descricao;
  int? qtd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text("Produtos"),
          backgroundColor: Colors.purple[900],
          actions: [
            IconButton(
              icon: const Icon(Icons.menu), // Ícone de menu padrão
              onPressed: () {
                // Lógica do menu aqui
              },
            ),
          ],
        ),
        body: const Center(
          child: Text(
            'Hello World!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
*/

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
