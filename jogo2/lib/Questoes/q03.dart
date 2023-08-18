import 'package:flutter/material.dart';
import 'q04.dart';
import 'dart:async';

class Question3Page extends StatefulWidget {
  final List<bool> userAnswers;
  final int score3; // Pontuação da pergunta anterior

  const Question3Page(
      {Key? key, required this.userAnswers, required this.score3})
      : super(key: key);

  @override
  _Question3PageState createState() => _Question3PageState();
}

class _Question3PageState extends State<Question3Page> {
  int _secondsLeft = 10;
  int _score = 0;
  late Timer _timer;

  bool _isAnswered = false;
  int _selectedOption = -1;

  @override
  void initState() {
    super.initState();
    _score = widget.score3;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (!_isAnswered && _secondsLeft > 0) {
          _secondsLeft--;
        } else if (!_isAnswered && _secondsLeft == 0) {
          _timer.cancel();
          _navigateToNextQuestion();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _navigateToNextQuestion() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Question4Page(
          userAnswers: widget.userAnswers,
          score4: _score,
        ),
      ),
    );
  }

  void _selectOption(int index) {
    if (!_isAnswered) {
      setState(() {
        _isAnswered = true;
        _selectedOption = index;
        if (index == 1) {
          widget.userAnswers[2] =
              true; // Modifique o índice para o da pergunta atual
          _score += 10; // Adicione 10 pontos à pontuação
        }
      });

      _timer.cancel(); // Cancelar o temporizador
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quem pintou a Mona Lisa?',
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
                  _buildAnswerButton(0, 'A) Vincent van Gogh'),
                  _buildAnswerButton(1, 'B) Leonardo da Vinci'),
                  _buildAnswerButton(2, 'C) Pablo Picasso'),
                  _buildAnswerButton(3, 'D) Michelangelo'),
                  _buildAnswerButton(4, 'E) Rembrandt'),
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
                _navigateToNextQuestion(); // Continuar para a próxima pergunta
              },
              child: const Text('Continuar'),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAnswerButton(int index, String text) {
    bool isSelected = _isAnswered && _selectedOption == index;
    bool isCorrect = index == 1;

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
