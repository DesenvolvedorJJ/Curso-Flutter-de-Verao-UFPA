import 'package:flutter/material.dart';
import '../Tabuleiro/telaTabuleiro.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _EstadoTelaInicial();
}

class _EstadoTelaInicial extends State<TelaInicial> {
  String namePlayer1 = "Jogador 1";
  String namePlayer2 = "Jogador 2";
  String? erroPlayer1;
  String? erroPlayer2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
            child: SizedBox(
          width: 350,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "# Jogo Da Velha #",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.lightBlueAccent,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            TextFormField(
              initialValue: namePlayer1,
              onChanged: (texto) {
                setState(() {
                  namePlayer1 = texto;
                });
              },
              decoration: InputDecoration(
                prefixIcon: const IconTheme(
                  data: IconThemeData(color: Colors.blue),
                  child: Icon(Icons.person),
                ),
                errorText: erroPlayer1,
                labelText: 'Player 1',
                labelStyle: const TextStyle(color: Colors.white),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: namePlayer2,
              onChanged: (texto) {
                setState(() {
                  namePlayer2 = texto;
                });
              },
              decoration: InputDecoration(
                prefixIcon: const IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.person),
                ),
                errorText: erroPlayer2,
                labelText: 'Player 2',
                labelStyle: const TextStyle(color: Colors.white),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
                onPressed: () async {
                  setState(() {
                    erroPlayer1 =
                        namePlayer1.isEmpty ? "Esqueceu de preencher?" : null;
                    erroPlayer2 =
                        namePlayer2.isEmpty ? "Esqueceu de preencher?" : null;
                  });

                  if (erroPlayer1 == null && erroPlayer2 == null) {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => TelaTabuleiro(
                                namePlayer1: namePlayer1,
                                namePlayer2: namePlayer2)));
                  }
                },
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Start to play",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ))
          ]),
        )));
  }
}
