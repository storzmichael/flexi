import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flexi/src/provider/quiz_provider.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    if (quizProvider.quizData == null) {
      quizProvider.loadQuiz();
    }
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    if (quizProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text("Quiz lädt...")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (quizProvider.quizData == null) {
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
              value: quizProvider.selectedSubject,
              onChanged: (newValue) {
                quizProvider.selectedSubject = newValue!;
                quizProvider.loadQuiz(); // Quiz neu laden bei Fachänderung
              },
              items: ["Mathematik", "Deutsch", "Englisch"].map((subject) {
                return DropdownMenuItem<String>(
                  value: subject,
                  child: Text(subject),
                );
              }).toList(),
            ),

            // Auswahl für Klasse
            DropdownButton<int>(
              value: quizProvider.selectedGrade,
              onChanged: (newValue) {
                quizProvider.selectedGrade = newValue!;
                quizProvider.loadQuiz(); // Quiz neu laden bei Klassenänderung
              },
              items: [1, 2, 3, 4, 5, 6].map((grade) {
                return DropdownMenuItem<int>(
                  value: grade,
                  child: Text("Klasse $grade"),
                );
              }).toList(),
            ),

            // Auswahl für Schwierigkeitsgrad
            DropdownButton<String>(
              value: quizProvider.selectedDifficulty,
              onChanged: (newValue) {
                quizProvider.selectedDifficulty = newValue!;
                quizProvider
                    .loadQuiz(); // Quiz neu laden bei Schwierigkeitsgradänderung
              },
              items: ["leicht", "mittel", "schwer"].map((difficulty) {
                return DropdownMenuItem<String>(
                  value: difficulty,
                  child: Text(difficulty),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Button zum Neuladen des Quiz
            ElevatedButton(
              onPressed: quizProvider.loadQuiz,
              child: const Text("Neues Quiz generieren"),
            ),

            const SizedBox(height: 16),

            // Quiz Frage anzeigen
            Text(
              quizProvider.quizData!.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Optionen anzeigen
            ...List.generate(quizProvider.quizData!.options.length, (index) {
              return CheckboxListTile(
                title: Text(quizProvider.quizData!.options[index]),
                value: quizProvider.selectedAnswers[index],
                onChanged: (bool? value) {
                  quizProvider.setSelectedAnswers(
                    quizProvider.selectedAnswers..[index] = value ?? false,
                  );
                },
              );
            }),

            const SizedBox(height: 20),

            // Antworten prüfen Button
            ElevatedButton(
              onPressed: quizProvider.isSubmitButtonActive
                  ? quizProvider.submitAnswers
                  : null,
              child: const Text("Antworten prüfen"),
            ),

            const SizedBox(height: 20),

            Text(
              quizProvider.resultText,
              style: TextStyle(color: quizProvider.resultTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
