import 'package:calculatorapp/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQustion = '';
  var userAnswer = '';
  final List<String> buttons = [
    'C',
    'Del',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      userQustion,
                      style: TextStyle(fontSize: 20),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      userAnswer,
                      style: TextStyle(fontSize: 20),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return MyButton(
                      buttonTaped: () {
                        setState(() {
                          userQustion = '';
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.green,
                      textColor: Colors.white,
                    );
                  } else if (index == 1) {
                    return MyButton(
                      buttonTaped: () {
                        setState(() {
                          userQustion =
                              userQustion.substring(0, userQustion.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.red,
                      textColor: Colors.white,
                    );
                  } else if (index == buttons.length - 1) {
                    return MyButton(
                      buttonTaped: () {
                        setState(() {
                          equelPressed();
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.red,
                      textColor: Colors.white,
                    );
                  } else {
                    return MyButton(
                      buttonTaped: () {
                        setState(() {
                          userQustion += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.deepPurple[50],
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' ||
        x == '/' ||
        x == '*' ||
        x == '-' ||
        x == '+' ||
        x == '+' ||
        x == '=') {
      return true;
    }
    return false;
  }

  void equelPressed() {
    String fianlQuestion = userQustion;
    fianlQuestion = fianlQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(fianlQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
