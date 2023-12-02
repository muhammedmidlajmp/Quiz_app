import 'dart:convert';

import 'package:artiftioa_solutions_test/model/api_model/quiz_model.dart';
import 'package:artiftioa_solutions_test/model/hive_model/hive_model.dart';
import 'package:artiftioa_solutions_test/view/eding_page/ending_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class QuizProvider with ChangeNotifier {
  final String apiUrl = 'https://nice-lime-hippo-wear.cyclic.app/api/v1/quiz';
  List<QuizQuestion> _quizzes = [];
  bool _isLoading = false;
  String? _error;

  List<QuizQuestion> get quizzes => _quizzes;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool _shouldShowNextButton = false;
  int _currentQuestionIndex = 0;
  int get currentQuastion => _currentQuestionIndex;

  bool get shouldShowNextButton => _shouldShowNextButton;
  Future<void> fetchQuizzes() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        _quizzes = jsonList.map((json) => QuizQuestion.fromJson(json)).toList();
        _error = null;
      } else {
        _error = 'Failed to load quizzes';
      }
    } catch (e) {
      _error = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void resetNextButton() {
    _shouldShowNextButton = false;
    notifyListeners();
  }

  void goToNextQuestion(BuildContext context) {
    // Check if there are more questions
    if (_currentQuestionIndex < _quizzes.length - 1) {
      // Increment the current question index
      _currentQuestionIndex++;

      // Reset the visibility of the "Next" button
      resetNextButton();

      notifyListeners();
    } else {
      // No more questions, navigate to the next page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EndingPage()), // Replace NextPage() with your actual page
      );
    }
  }

  static const String boxName = 'HiveModel';
  Future<Box<HiveModel>> openBox() async {
    return Hive.box(boxName);
  }

  Future saveDataToHive(
      bool isCorrect, String correctCount, String wrongAnswers) async {
    final box = await Hive.openBox(boxName);

    final hiveModel = HiveModel(
      isCorrect: isCorrect,
      // correctCount: correctCount,
      // wrongAnswers: wrongAnswers,
    );

    await box.add(hiveModel);
  }

  Future<List<HiveModel>> getDataFromHive() async {
    final box = await openBox();

    final List<HiveModel> data = box.values.toList();
    return data;
  }
}
