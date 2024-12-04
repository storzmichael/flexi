class QuizModel {
  String question;
  List<String> options;
  List<int> correctAnswers;
  String subject;
  int grade;
  String difficulty;

  QuizModel({
    required this.question,
    required this.options,
    required this.correctAnswers,
    required this.subject,
    required this.grade,
    required this.difficulty,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      question: json['question'] ?? '',
      options: List<String>.from(json['options'] ?? []),
      correctAnswers: List<int>.from(json['correct_answers'] ?? []),
      subject: json['subject'] ?? '',
      grade: json['grade'] ?? 0,
      difficulty: json['difficulty'] ?? '',
    );
  }
  
}
