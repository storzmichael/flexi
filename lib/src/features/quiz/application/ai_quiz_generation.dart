import "dart:convert";
import "package:flexi/src/features/quiz/application/api_key.dart";
import "package:flexi/src/features/quiz/domain/quiz_model.dart";
import "package:http/http.dart" as http;

Future<QuizModel?> fetchQuizFromAI(
    String subject, int grade, String difficulty, String? selectedTopic) async {
  final url = Uri.parse(
      "https://api.infomaniak.com/1/ai/$productId/openai/chat/completions");

  final headers = {
    "Authorization": "Bearer $apiKey",
    "Content-Type": "application/json",
  };

  if (selectedTopic!.isEmpty) {
    selectedTopic = null;
  }

  final prompt = """
    Erstelle eine Multiple-Choice-Quizfrage:
    - Fach: $subject
    - Klasse: $grade
    - Schwierigkeitsgrad: $difficulty
    - Themeneingabe (optional, wenn kein Thema mit logik, ignorieren): $selectedTopic
    Ausgabe als JSON im Format:
    {
      "question": "string",
      "options": ["string", "string", "string", "string"],
      "correct_answers": [integer, integer],
      "subject": "string",
      "grade": integer,
      "difficulty": "string"
    }
  """;

  final body = json.encode({
    "messages": [
      {
        "content": prompt,
        "role": "user",
      }
    ],
    "model": "mixtral",
  });

  try {
    final request = http.Request("POST", url);
    request.body = body;
    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final responseBody = await response.stream.bytesToString();

      // print("Raw Response: $responseBody");

      final responseData = jsonDecode(responseBody);
      final content = responseData['choices'][0]['message']['content'];
      final jsonStartIndex = content.indexOf('{');
      final jsonEndIndex = content.lastIndexOf('}');

      if (jsonStartIndex != -1 && jsonEndIndex != -1) {
        final jsonString = content.substring(jsonStartIndex, jsonEndIndex + 1);

        try {
          final quizJson = jsonDecode(jsonString);
          return QuizModel.fromJson(quizJson);
        } catch (e) {
          throw Exception("Fehler beim Dekodieren des Quiz-JSON: $e");
        }
      } else {
        throw Exception("Kein gültiger JSON-Teil in der Antwort gefunden.");
      }
    } else {
      // print("Fehler: ${response.reasonPhrase}");
      return null;
    }
  } catch (e) {
    // print("Exception: $e");
    return null;
  }
}
