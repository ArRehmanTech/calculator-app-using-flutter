import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        userInput.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+/-',
                          onPress: () {
                            userInput = userInput + '+/-';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '%',
                          onPress: () {
                            userInput = userInput + '%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '/',
                          color: Colors.orange,
                          onPress: () {
                            userInput = userInput + '/';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onPress: () {
                            userInput = '${userInput}7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '8',
                          onPress: () {
                            // ignore: prefer_interpolation_to_compose_strings
                            userInput = userInput + '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '9',
                          onPress: () {
                            // ignore: prefer_interpolation_to_compose_strings
                            userInput = userInput + '9';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'X',
                          color: Colors.orange,
                          onPress: () {
                            userInput = userInput + 'X';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onPress: () {
                            userInput = userInput + '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '5',
                          onPress: () {
                            userInput = userInput + '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '6',
                          onPress: () {
                            userInput = userInput + '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '-',
                          color: Colors.orange,
                          onPress: () {
                            userInput = userInput + '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onPress: () {
                            userInput = userInput + '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '2',
                          onPress: () {
                            userInput = userInput + '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '3',
                          onPress: () {
                            userInput = userInput + '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+',
                          color: Colors.orange,
                          onPress: () {
                            userInput = userInput + '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          onPress: () {
                            userInput = userInput + '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '.',
                          onPress: () {
                            userInput = userInput + '.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'DEL',
                          onPress: () {
                            userInput = userInput.substring(
                              0,
                              userInput.length - 1,
                            );
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '=',
                          color: Colors.orange,
                          onPress: () {
                            equalPres();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPres() {
    String finalUserInput = userInput.replaceAll('X', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    setState(() {
      answer = eval.toString();
    });
  }
}

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const MyButton({
    super.key,
    this.title = '',
    this.color = const Color.fromARGB(255, 128, 127, 127),
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 50,

            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Center(
              child: Text(title, style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
