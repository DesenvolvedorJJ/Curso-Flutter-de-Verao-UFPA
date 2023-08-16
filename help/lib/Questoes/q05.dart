import 'package:flutter/material.dart';
import '../TelaFinal/endPage.dart';
import 'dart:async';

class Question5Page extends StatefulWidget {
  final List<bool> userAnswers;
  final int score5; // Pontuação da pergunta anterior

  const Question5Page(
      {Key? key, required this.userAnswers, required this.score5})
      : super(key: key);

  @override
  _Question5PageState createState() => _Question5PageState();
}

class _Question5PageState extends State<Question5Page> {
  int _secondsLeft = 10;
  int _score = 0;
  late Timer _timer;

  bool _isAnswered = false;
  int _selectedOption = -1;

  @override
  void initState() {
    super.initState();
    _score = widget.score5;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (!_isAnswered && _secondsLeft > 0) {
          _secondsLeft--;
        } else if (!_isAnswered && _secondsLeft == 0) {
          _timer.cancel();
          _navigateToResultPage();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _navigateToResultPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoPage(
            userAnswers: widget.userAnswers,
            totalScore: _score), // Passa a pontuação total para a página final
      ),
    );
  }

  void _selectOption(int index) {
    if (!_isAnswered) {
      setState(() {
        _isAnswered = true;
        _selectedOption = index;
        if (index == 3) {
          widget.userAnswers[4] =
              true; // Modifique o índice para o da pergunta atual
          _score += 10; // Adicione 10 pontos à pontuação
        }
      });

      _timer.cancel(); // Cancelar o temporizador

      // Mostra o botão de continuar somente quando a pergunta for respondida
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Qual é o elemento químico mais abundante na crosta terrestre?',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildAnswerButton(0, 'A) Oxigênio'),
                  _buildAnswerButton(1, 'B) Hidrogênio'),
                  _buildAnswerButton(2, 'C) Carbono'),
                  _buildAnswerButton(3, 'D) Silício'),
                  _buildAnswerButton(4, 'E) Ferro'),
                ],
              ),
            ),
          ),
          if (!_isAnswered)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text('Tempo restante: $_secondsLeft segundos',
                  style: const TextStyle(color: Colors.white)),
            ),
          const SizedBox(height: 20),
          if (_isAnswered) // Mostra o botão de continuar somente quando a pergunta for respondida
            ElevatedButton(
              onPressed: () {
                _navigateToResultPage(); // Finaliza o jogo e exibe a tela de resultado
              },
              child: const Text('Finalizar Jogo'),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAnswerButton(int index, String text) {
    bool isSelected = _isAnswered && _selectedOption == index;
    bool isCorrect = index == 3;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected
            ? isCorrect
                ? Colors.green
                : Colors.red
            : Colors.transparent,
        border: Border.all(
          color: isSelected ? Colors.white : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: () => _selectOption(index),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
