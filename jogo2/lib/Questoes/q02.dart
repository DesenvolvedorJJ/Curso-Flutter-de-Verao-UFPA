import 'package:flutter/material.dart';
import 'q03.dart';
import 'dart:async';

class Question2Page extends StatefulWidget {
  final List<bool> userAnswers;
  final int score2; // Pontuação da pergunta anterior

  const Question2Page(
      {Key? key, required this.userAnswers, required this.score2})
      : super(key: key);

  @override
  _Question2PageState createState() => _Question2PageState();
}

class _Question2PageState extends State<Question2Page> {
  int _secondsLeft = 10;
  int _score = 0;
  late Timer _timer;

  bool _isAnswered = false;
  int _selectedOption = -1;

  @override
  void initState() {
    super.initState();
    _score = widget.score2;
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
        builder: (context) => Question3Page(
          userAnswers: widget.userAnswers,
          score3: _score,
        ),
      ),
    );
  }

  void _selectOption(int index) {
    if (!_isAnswered) {
      setState(() {
        _isAnswered = true;
        _selectedOption = index;
        if (index == 3) {
          widget.userAnswers[1] =
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
          'Qual é a capital da França?',
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
                  _buildAnswerButton(0, 'A) Berlim'),
                  _buildAnswerButton(1, 'B) Madri'),
                  _buildAnswerButton(2, 'C) Roma'),
                  _buildAnswerButton(3, 'D) Paris'),
                  _buildAnswerButton(4, 'E) Londres'),
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
