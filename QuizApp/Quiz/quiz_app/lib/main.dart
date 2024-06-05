// ignore_for_file: prefer_const_constructors, avoid_print, file_names, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'Quize_Class.dart';
import 'quizeBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Builder(builder: (BuildContext) {
      return QuizPage();
    }),
  ));
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizeBrain myQuize = QuizeBrain();
  List scoreKeeper = [];
  void checkAnswer(BuildContext context, bool userPickedAnswer) {
    bool correctAnswer = myQuize.getAnswer();

    setState(() {
      if (myQuize.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.warning,
          title: "Finished",
          desc: "You have finished the question!",
          buttons: [
            DialogButton(
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  myQuize.reset();
                  Navigator.pop(context);
                });
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
          ],
        ).show();
        myQuize.reset();
        scoreKeeper = [];
      } else if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      myQuize.nextQuestion();
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    myQuize.getQuize(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 3, 99, 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        )),
                    onPressed: () {
                      checkAnswer(context, true);
                    },
                    child: Text(
                      'True',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 196, 16, 3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        )),
                    onPressed: () {
                      checkAnswer(context, false);
                    },
                    child: Text(
                      'False',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  ...scoreKeeper,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
