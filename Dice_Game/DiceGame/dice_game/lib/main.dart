// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
              child: Text(
            'Dice game',
            style: TextStyle(
              fontFamily: 'Pacificao',
              fontSize: 30,
              color: Colors.black87,
            ),
          )),
        ),
        body: DicePage(),
      )));
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void change() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      change();
                    });
                  },
                  child: Image.asset('Images/dice$leftDiceNumber.png'))),
          Expanded(
              flex: 2,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      change();
                    });
                    print('right dice is pressed');
                  },
                  child: Image.asset('Images/dice$rightDiceNumber.png'))),
        ],
      ),
    );
  }
}
