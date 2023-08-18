import 'package:flutter/material.dart';
import 'q02.dart';
import 'dart:async';

class Question1Page extends StatefulWidget {
  final List<bool> userAnswers;

  const Question1Page({Key? key, required this.userAnswers}) : super(key: key);

  @override
  _Question1PageState createState() => _Question1PageState();
}

class _Question1PageState extends State<Question1Page> {
  int _secondsLeft = 10;
  int _score = 0; // Pontuação inicial
  late Timer _timer;

  bool _isAnswered = false;
  int _selectedOption = -1;

  @override
  void initState() {
    super.initState();
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
        builder: (context) => Question2Page(
          userAnswers: widget.userAnswers,
          score2: _score,
        ),
      ),
    );
  }

  void _selectOption(int index) {
    if (!_isAnswered) {
      setState(() {
        _isAnswered = true;
        _selectedOption = index;
        if (index == 2) {
          widget.userAnswers[0] = true;
          _score += 10; // Incrementar a pontuação em 10 pontos
        }
      });

      _timer.cancel(); // Cancelar o temporizador
    }
  }

  void _continueToNextQuestion() {
    _timer.cancel();
    _navigateToNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Qual é o maior planeta do Sistema Solar?',
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
                  _buildAnswerButton(0, 'A) Terra'),
                  _buildAnswerButton(1, 'B) Marte'),
                  _buildAnswerButton(2, 'C) Júpiter'),
                  _buildAnswerButton(3, 'D) Vênus'),
                  _buildAnswerButton(4, 'E) Netuno'),
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
          if (_isAnswered)
            ElevatedButton(
              onPressed: _continueToNextQuestion,
              child: const Text('Continuar'),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAnswerButton(int index, String text) {
    bool isSelected = _isAnswered && _selectedOption == index;
    bool isCorrect = index == 2;

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
