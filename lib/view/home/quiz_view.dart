import 'package:artiftioa_solutions_test/controller/quiz_provider/quiz_provider.dart';
import 'package:artiftioa_solutions_test/model/core/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    Color defualtcolor = Colors.transparent;
    Provider.of<QuizProvider>(context, listen: false).fetchQuizzes();
    return Scaffold(
      body: SafeArea(
        child: Consumer<QuizProvider>(
          builder: (context, quizProvider, child) => Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: LinearProgressIndicator(
                  backgroundColor: Color(0xFFC353D5),
                  valueColor: AlwaysStoppedAnimation(Color(0xFF6B2677)),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  value: .8,
                  minHeight: 20,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  quizProvider.quizzes.isNotEmpty
                      ? quizProvider
                          .quizzes[quizProvider.currentQuastion].question
                      : 'No quiz available',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                  maxLines: 3,
                ),
              ),
              box,
              GestureDetector(
                onTap: () {
                  quizProvider.shouldShowNextButton;
                  print(quizProvider.quizzes[quizProvider.currentQuastion]
                      .options[0].isCorrect);
                },
                child: Mytextfield(
                    color: defualtcolor,
                    // color: quizProvider.quizzes.first.options[0].isCorrect
                    //     ? Colors.green
                    //     : Colors.red,
                    labeltext: quizProvider
                        .quizzes[quizProvider.currentQuastion].options[0].text),
              ),
              box,
              GestureDetector(
                onTap: () {
                  quizProvider.shouldShowNextButton;
                },
                child: Mytextfield(
                    color: defualtcolor,
                    labeltext: quizProvider
                        .quizzes[quizProvider.currentQuastion].options[1].text),
              ),
              box,
              GestureDetector(
                onTap: () {
                  quizProvider.shouldShowNextButton;
                },
                child: Mytextfield(
                    color: defualtcolor,
                    labeltext: quizProvider
                        .quizzes[quizProvider.currentQuastion].options[2].text),
              ),
              box,
              GestureDetector(
                onTap: () {
                  quizProvider.shouldShowNextButton;
                },
                child: Mytextfield(
                    color: defualtcolor,
                    labeltext: quizProvider
                        .quizzes[quizProvider.currentQuastion].options[3].text),
              ),
              box,
              ElevatedButton(
                onPressed: () {
                  // Save data to Hive before moving to the next question

                  // Move to the next question
                  quizProvider.goToNextQuestion(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                ),
                child: const Text(
                  '   Next   ',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Mytextfield extends StatelessWidget {
  final controller;
  final String labeltext;
  final Color? color;
  const Mytextfield(
      {super.key, this.controller, required this.labeltext, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        height: 50,
        width: 350,
        child: Container(
          width: double.infinity,
          height: 30,
          decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
            labeltext,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
