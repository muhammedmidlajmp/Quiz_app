import 'package:artiftioa_solutions_test/controller/quiz_provider/quiz_provider.dart';
import 'package:artiftioa_solutions_test/view/home/quiz_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                child: SizedBox(
                  height: 35.h,
                  width: 90.w,
                  child: const Image(
                    image: AssetImage('asset/img/splashimg.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<QuizProvider>(context, listen: false)
                      .fetchQuizzes();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizView(),
                      ));
                },
                style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                      Color.fromARGB(255, 131, 6, 208),
                    ),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: const Text(
                  'Start Quiz',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text(
                      'Poverd by',
                      style: TextStyle(color: Colors.white38),
                    ),
                  ],
                ),
              ),
              const SizedBox(),
              const Text('www.artifitia.com',
                  style: TextStyle(color: Colors.white38)),
            ],
          ),
        );
      },
    );
  }
}
