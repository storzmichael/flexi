import 'package:flutter/material.dart';
import 'package:flexi/src/features/quiz/domain/quiz_model.dart';
import 'package:flexi/src/features/quiz/application/ai_quiz_generation.dart';

class QuizProvider with ChangeNotifier {
  QuizModel? _quizData;
  bool _isLoading = false;
  List<bool> _selectedAnswers = [];

  String selectedSubject = "Mathematik";
  int selectedGrade = 3;
  String selectedDifficulty = "mittel";
  String resultText = "";
  Color resultTextColor = Colors.black;
  bool isSubmitButtonActive = true;

  QuizModel? get quizData => _quizData;
  bool get isLoading => _isLoading;
  List<bool> get selectedAnswers => _selectedAnswers;

  void setSelectedAnswers(List<bool> answers) {
    _selectedAnswers = answers;
    notifyListeners();
  }

  void loadQuiz() async {
    _isLoading = true;
    resultText = "";
    resultTextColor = Colors.black;
    isSubmitButtonActive = true;
    notifyListeners();

    final data = await fetchQuizFromAI(
        selectedSubject, selectedGrade, selectedDifficulty, "");

    if (data != null) {
      _quizData = data;
      _selectedAnswers = List.generate(data.options.length, (_) => false);
    } else {
      _quizData = null;
    }

    _isLoading = false;
    notifyListeners();
  }

  void submitAnswers() {
    if (_quizData == null) return;

    final correctAnswers = _quizData!.correctAnswers;
    final selectedIndices = _selectedAnswers
        .asMap()
        .entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selectedIndices.isEmpty) {
      resultTextColor = Colors.orange;
      resultText = "Bitte wähle mindestens eine Antwort.";
      notifyListeners();
      return;
    }

    final isCorrect = Set<int>.from(correctAnswers)
        .difference(Set<int>.from(selectedIndices))
        .isEmpty;

    isSubmitButtonActive = false;

    resultTextColor = isCorrect ? Colors.green : Colors.red;
    resultText = isCorrect
        ? "Glückwunsch, du hast alle richtigen Antworten gewählt."
        : "Leider falsch. ${correctAnswers.length == 1 ? "Die richtige Antwort wäre:" : "Die richtigen Antworten wären:"}${correctAnswers.map((index) => _quizData!.options[index]).join(', ')}.";

    notifyListeners();
  }
}
