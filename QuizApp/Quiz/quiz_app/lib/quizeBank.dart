// ignore_for_file: prefer_final_fields, file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'Quize_Class.dart';

class QuizeBrain {
  int _questionNumber = 0;
  List<Quize> _quizeBank = [
    Quize('Plants can grow', true),
    Quize('Animals can think', false),
    Quize('Animals can eat', false),
    Quize('chair can breath', false),
    Quize('Robots can answer questions', true),
  ];
  void nextQuestion() {
    if (_questionNumber < _quizeBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuize() {
    return _quizeBank[_questionNumber].questions!;
  }

  bool getAnswer() {
    return _quizeBank[_questionNumber].answers!;
  }

  bool isFinished() {
    if (_questionNumber >= _quizeBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
