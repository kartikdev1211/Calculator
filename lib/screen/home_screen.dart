import 'package:calculator/widget/button_widget.dart';
import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Buttons(
                          title: "AC",
                          onPress: () {
                            setState(() {
                              userInput = '';
                              answer = '0';
                            });
                          },
                        ),
                        Buttons(
                          title: " +/-",
                          onPress: () {},
                        ),
                        Buttons(
                          title: '%',
                          onPress: () {
                            setState(() {
                              userInput += '%';
                            });
                          },
                        ),
                        Buttons(
                          title: '/',
                          onPress: () {
                            setState(() {
                              userInput += '/';
                            });
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Buttons(
                          title: '7',
                          onPress: () {
                            setState(() {
                              userInput += '7';
                            });
                          },
                        ),
                        Buttons(
                          title: '8',
                          onPress: () {
                            setState(() {
                              userInput += '8';
                            });
                          },
                        ),
                        Buttons(
                          title: '9',
                          onPress: () {
                            setState(() {
                              userInput += '9';
                            });
                          },
                        ),
                        Buttons(
                          title: 'x',
                          onPress: () {
                            setState(() {
                              userInput += 'x';
                            });
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Buttons(
                          title: '4',
                          onPress: () {
                            setState(() {
                              userInput += '4';
                            });
                          },
                        ),
                        Buttons(
                          title: '5',
                          onPress: () {
                            setState(() {
                              userInput += '5';
                            });
                          },
                        ),
                        Buttons(
                          title: '6',
                          onPress: () {
                            setState(() {
                              userInput += '6';
                            });
                          },
                        ),
                        Buttons(
                          title: '-',
                          onPress: () {
                            setState(() {
                              userInput += '-';
                            });
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Buttons(
                          title: '1',
                          onPress: () {
                            setState(() {
                              userInput += '1';
                            });
                          },
                        ),
                        Buttons(
                          title: '2',
                          onPress: () {
                            setState(() {
                              userInput += '2';
                            });
                          },
                        ),
                        Buttons(
                          title: '3',
                          onPress: () {
                            setState(() {
                              userInput += '3';
                            });
                          },
                        ),
                        Buttons(
                          title: '+',
                          onPress: () {
                            setState(() {
                              userInput += '+';
                            });
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Buttons(
                          title: '0',
                          onPress: () {
                            setState(() {
                              userInput += '0';
                            });
                          },
                        ),
                        Buttons(
                          title: '.',
                          onPress: () {
                            setState(() {
                              userInput += '.';
                            });
                          },
                        ),
                        Buttons(
                          title: 'DEL',
                          onPress: () {
                            setState(() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          },
                        ),
                        Buttons(
                          title: '=',
                          onPress: () {
                            equalPressed();
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
