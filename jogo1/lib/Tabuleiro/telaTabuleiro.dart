import 'package:flutter/material.dart';
import 'divisores.dart';
import 'pecas.dart';

class TelaTabuleiro extends StatefulWidget {
  final String namePlayer1;
  final String namePlayer2;
  const TelaTabuleiro({
    super.key,
    required this.namePlayer1,
    required this.namePlayer2,
  });

  @override
  State<TelaTabuleiro> createState() => _EstadoTelaTabuleiro();
}

class _EstadoTelaTabuleiro extends State<TelaTabuleiro> {
  List<List<String>> dados = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
  ];
  bool player1Turn = true;
  String gameOver() {
    // Verificar linhas
    for (int i = 0; i < 3; i++) {
      if (dados[i][0] != "" &&
          dados[i][0] == dados[i][1] &&
          dados[i][0] == dados[i][2]) {
        return dados[i][0];
      }
    }

    // Verificar colunas
    for (int i = 0; i < 3; i++) {
      if (dados[0][i] != "" &&
          dados[0][i] == dados[1][i] &&
          dados[0][i] == dados[2][i]) {
        return dados[0][i];
      }
    }

    // Verificar diagonais
    if (dados[0][0] != "" &&
        dados[0][0] == dados[1][1] &&
        dados[0][0] == dados[2][2]) {
      return dados[0][0];
    }

    if (dados[0][2] != "" &&
        dados[0][2] == dados[1][1] &&
        dados[0][2] == dados[2][0]) {
      return dados[0][2];
    }

    // Verificar empate
    bool isTie = true;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (dados[i][j] == "") {
          isTie = false;
          break;
        }
      }
    }

    if (isTie) {
      return "Empate";
    }

    return ""; // Nenhum jogador venceu ainda
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
/*            const Text(
              "Jogo Da Velha",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.lightBlueAccent,
              ),
            ),
*/
            Column(
              children: [
                if (gameOver()
                    .isNotEmpty) // Verificar se há um vencedor ou empate
                  Text(
                    gameOver() == "Empate"
                        ? "Deu velha"
                        : "${gameOver() == 'X' ? widget.namePlayer1 : widget.namePlayer2} venceu!",
                    style: const TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                if (gameOver().isEmpty)
                  Text(
                    player1Turn
                        ? "É a sua vez ${widget.namePlayer1}"
                        : "É a sua vez ${widget.namePlayer2}",
                    style: const TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            for (int i = 0; i < dados.length; i++)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int j = 0; j < dados[i].length; j++)
                        Row(
                          children: [
                            Peca(
                              valor: dados[i][j],
                              whenSelect: () {
                                setState(() {
                                  if (dados[i][j] == "") {
                                    dados[i][j] = player1Turn ? "X" : "O";
                                    player1Turn = !player1Turn;
                                  }
                                });
                              },
                            ),
                            if (j < 2) const DivisorY(),
                          ],
                        ),
                    ],
                  ),
                  if (i < 2) const DivisorX(),
                ],
              ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                if (gameOver().isNotEmpty ||
                    gameOver() == "Empate" ||
                    gameOver() == "X" ||
                    gameOver() == "O")
                  MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Turn Back",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ))
              ],
            ),
          ],
        )));
  }
}
