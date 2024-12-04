import 'package:flexi/src/features/quizzes/application/ai_quiz_generation.dart';
import 'package:flexi/src/features/quizzes/domain/quiz_model.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  QuizModel? quizData;
  bool isLoading = true;
  List<bool> selectedAnswers = [];

  String selectedSubject = "Mathematik";
  int selectedGrade = 3;
  String selectedDifficulty = "mittel";

  List<String> subjects = ["Mathematik", "Deutsch", "Englisch"];
  List<int> grades = [1, 2, 3, 4, 5, 6];
  List<String> difficulties = ["leicht", "mittel", "schwer"];
  TextEditingController? topicEditingController = TextEditingController();
  String resultText = "";
  Color resultTextColor = Colors.black;

  bool isSubmitButtonActive = true;

  @override
  void initState() {
    super.initState();
    loadQuiz();
  }

  void loadQuiz() async {
    setState(() {
      isLoading = true;
      resultText = "";
      resultTextColor = Colors.black;
      isSubmitButtonActive = true;
    });
    final data = await fetchQuizFromAI(selectedSubject, selectedGrade,
        selectedDifficulty, topicEditingController!.text);

    if (data != null) {
      setState(() {
        quizData = data;
        selectedAnswers = List.generate(data.options.length, (_) => false);
        isLoading = false;
      });
    } else {
      debugPrint("Fehler beim Laden des Quiz");
      setState(() {
        isLoading = false;
      });
    }
  }

  void submitAnswers() {
    if (quizData == null) return;

    final correctAnswers = quizData!.correctAnswers;
    final selectedIndices = selectedAnswers
        .asMap()
        .entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selectedIndices.isEmpty) {
      setState(() {
        resultTextColor = Colors.orange;
        resultText = "Bitte wähle mindestens eine Antwort.";
      });
      return;
    }

    final isCorrect = correctAnswers.every(selectedIndices.contains) &&
        selectedIndices.every(correctAnswers.contains);

    setState(() {
      isSubmitButtonActive = false;

      resultTextColor = isCorrect ? Colors.green : Colors.red;
      resultText = isCorrect
          ? "Glückwunsch, du hast alle richtigen Antworten gewählt."
          : "Leider falsch. ${correctAnswers.length == 1 ? "Die richtige Antwort wäre:" : "Die richtigen Antworten wären: "}${correctAnswers.map((index) => quizData!.options[index]).join(', ')}.";
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text("Quiz lädt...")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (quizData == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Quiz")),
        body: const Center(child: Text("Fehler beim Laden des Quiz")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Auswahl für Fach
            DropdownButton<String>(
              value: selectedSubject,
              onChanged: (newValue) {
                setState(() {
                  selectedSubject = newValue!;
                });
              },
              items: subjects.map((subject) {
                return DropdownMenuItem<String>(
                  value: subject,
                  child: Text(subject),
                );
              }).toList(),
            ),

            // Auswahl für Klasse
            DropdownButton<int>(
              value: selectedGrade,
              onChanged: (newValue) {
                setState(() {
                  selectedGrade = newValue!;
                });
              },
              items: grades.map((grade) {
                return DropdownMenuItem<int>(
                  value: grade,
                  child: Text("Klasse $grade"),
                );
              }).toList(),
            ),

            // Auswahl für Schwierigkeitsgrad
            DropdownButton<String>(
              value: selectedDifficulty,
              onChanged: (newValue) {
                setState(() {
                  selectedDifficulty = newValue!;
                });
              },
              items: difficulties.map((difficulty) {
                return DropdownMenuItem<String>(
                  value: difficulty,
                  child: Text(difficulty),
                );
              }).toList(),
            ),

            // Auswahl für Thema (optional)
            TextField(
              controller: topicEditingController,
              decoration: const InputDecoration(
                labelText: 'Thema (optional)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // Button zum Neuladen des Quiz
            ElevatedButton(
              onPressed: loadQuiz,
              child: const Text("Neues Quiz generieren"),
            ),

            const SizedBox(height: 16),

            // Quiz Frage anzeigen
            Text(
              quizData!.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Optionen anzeigen
            ...List.generate(quizData!.options.length, (index) {
              return CheckboxListTile(
                title: Text(quizData!.options[index]),
                value: selectedAnswers[index],
                onChanged: (bool? value) {
                  setState(() {
                    selectedAnswers[index] = value ?? false;
                  });
                },
              );
            }),

            const SizedBox(height: 20),

            // Antworten prüfen Button
            ElevatedButton(
              onPressed: isSubmitButtonActive ? submitAnswers : null,
              child: const Text("Antworten prüfen"),
            ),

            const SizedBox(height: 20),

            Text(
              resultText,
              style: TextStyle(color: resultTextColor),
            )
          ],
        ),
      ),
    );
  }
}
