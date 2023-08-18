import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Tela(),
  ));
}

class Tela extends StatelessWidget {
  const Tela({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        //Cabecalho(),
        //Corpo(valor: 42),
        Contador(valorInicial: 3),
      ],
    ));
  }
}

/*
class Cabecalho extends StatefulWidget {
  const Cabecalho({super.key});

  @override
  State<Cabecalho> createState() => _EstadoCabecalho();

  @override
  Widget build(BuildContext context) {
    return const Text('Cabeçalho');
  }
}

class _EstadoCabecalho extends State<Cabecalho> {
  Widget build(BuildContext context) {
    return const Text('Cabeçalho');
  }
}

class Corpo extends StatefulWidget {
  final int valor;
  const Corpo({super.key, required this.valor});

  State<Corpo> createState() => _EstadoCorpo();

  @override
  Widget build(BuildContext context) {
    return Text('Corpo: $valor');
  }
}

class _EstadoCorpo extends State<Corpo> {
  @override
  Widget build(BuildContext context) {
    return Text('Corpo: ${widget.valor}');
  }
}

*/

class Contador extends StatefulWidget {
  final int valorInicial;
  const Contador({super.key, required this.valorInicial});

  @override
  State<Contador> createState() => _EstadoContador();
}

class _EstadoContador extends State<Contador> {
  late int valor;

  @override
  void initState() {
    super.initState();
    valor = widget.valorInicial;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$valor"),
        TextButton(
            child: const Text("Add"),
            onPressed: () {
              setState(() {
                valor += 1;
              });
            }),
/*
        Text("$valor"),
        TextButton(
            child: const Text("Remove"),
            onPressed: () {
              setState(() {
                valor -= 1;
              });
            }),

*/
      ],
    );
  }
}
