import 'package:flutter/material.dart';
import 'q05.dart';
import '../TelaFinal/endPage.dart';
import 'dart:async';

class Question4Page extends StatefulWidget {
  final List<bool> userAnswers;
  final int score4; // Pontuação da pergunta anterior

  const Question4Page(
      {Key? key, required this.userAnswers, required this.score4})
      : super(key: key);

  @override
  _Question4PageState createState() => _Question4PageState();
}

class _Question4PageState extends State<Question4Page> {
  int _secondsLeft = 10;
  int _score = 0;
  late Timer _timer;

  bool _isAnswered = false;
  int _selectedOption = -1;

  @override
  void initState() {
    super.initState();
    _score = widget.score4;
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

  void _navigateToNextQuestion() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Question5Page(
          userAnswers: widget.userAnswers,
          score5: _score,
        ),
      ),
    );
  }

  void _selectOption(int index) {
    if (!_isAnswered) {
      setState(() {
        _isAnswered = true;
        _selectedOption = index;
        if (index == 0) {
          widget.userAnswers[3] =
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
          'Qual é o maior osso do corpo humano?',
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
                  _buildAnswerButton(0, 'A) Fêmur'),
                  _buildAnswerButton(1, 'B) Úmero'),
                  _buildAnswerButton(2, 'C) Costela'),
                  _buildAnswerButton(3, 'D) Tíbia'),
                  _buildAnswerButton(4, 'E) Crânio'),
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
    bool isCorrect = index == 0;

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
