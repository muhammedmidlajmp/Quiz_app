class QuizQuestion {
  String id;
  String question;
  List<QuizOption> options;
  DateTime createdAt;
  DateTime updatedAt;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.createdAt,
    required this.updatedAt,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['_id'],
      question: json['question'],
      options: List<QuizOption>.from(
        json['options'].map((option) => QuizOption.fromJson(option)),
      ),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class QuizOption {
  String text;
  bool isCorrect;
  String id;

  QuizOption({
    required this.text,
    required this.isCorrect,
    required this.id,
  });

  factory QuizOption.fromJson(Map<String, dynamic> json) {
    return QuizOption(
      text: json['text'],
      isCorrect: json['isCorrect'],
      id: json['_id'],
    );
  }
}
