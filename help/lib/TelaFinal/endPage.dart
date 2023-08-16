import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  final List<bool> userAnswers;
  final int totalScore; // Total de pontos

  const ResultadoPage(
      {Key? key, required this.userAnswers, required this.totalScore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int correctAnswers = userAnswers.where((answer) => answer).length;
    int totalQuestions = userAnswers.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você respondeu $correctAnswers de $totalQuestions perguntas corretamente!',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Pontuação total: $totalScore', // Exibir a pontuação total
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context,
                    (route) => route.isFirst); // Volta para a primeira tela
              },
              child: const Text('Jogar Novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
