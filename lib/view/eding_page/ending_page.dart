// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EndingPage extends StatelessWidget {
  const EndingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 88, 10, 105),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35)),
                height: 280,
                width: 280,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    //  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 120,
                          width: 250,
                          child: const Image(
                              image: AssetImage("asset/img/ending.png"))),
                      const Text(
                        "90% Score",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      const Text(
                        "Qiez completed Scuessfully....!",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "You attempt 10 Questions and From that 9 answer is corroct.)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ))),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
