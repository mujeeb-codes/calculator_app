import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator_app/button.dart';
import 'package:calculator_app/history_screen.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Myapp()));
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  var userinfo = "";
  var answer = "";
  List<String> history = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.9),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.withOpacity(.9),
        title: Text(
          "Calculator",
          style: TextStyle(
            fontFamily: "PlayFairDisplay",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryScreen(history: history),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 80),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(width: 300),
                  Text(
                    userinfo.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 90),
                  Text(
                    answer.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      children: [
                        button(
                          title: "1",
                          onpress: () {
                            userinfo += "1";
                            setState(() {});
                          },
                          mycolor: Colors.blueGrey,
                        ),
                        button(
                          title: "2",
                          onpress: () {
                            userinfo += "2";
                            setState(() {});
                          },
                          mycolor: Colors.blueGrey,
                        ),
                        button(
                          title: "3",
                          onpress: () {
                            userinfo += "3";
                            setState(() {});
                          },
                          mycolor: Colors.blueGrey,
                        ),
                        button(
                          title: "+",
                          onpress: () {
                            userinfo += "+";
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      children: [
                        button(
                          title: "4",
                          onpress: () {
                            userinfo += "4";
                            setState(() {});
                          },
                          mycolor: Colors.blueGrey,
                        ),
                        button(
                          title: "5",
                          onpress: () {
                            userinfo += "5";
                            setState(() {});
                          },
                          mycolor: Colors.blueGrey,
                        ),
                        button(
                          title: "6",
                          onpress: () {
                            userinfo += "6";
                            setState(() {});
                          },
                          mycolor: Colors.blueGrey,
                        ),
                        button(
                          title: "-",
                          onpress: () {
                            userinfo += "-";
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      children: [
                        button(
                          title: "7",
                          onpress: () {
                            userinfo += "7";
                            setState(() {});
                          },
                          mycolor: Colors.blueGrey,
                        ),
                        button(
                          title: "8",
                          onpress: () {
                            userinfo += "8";
                            setState(() {});
                          },
                          mycolor: Colors.blueGrey,
                        ),
                        button(
                          title: "9",
                          onpress: () {
                            userinfo += "9";
                            setState(() {});
                          },
                          mycolor: Colors.blueGrey,
                        ),
                        button(
                          title: "x",
                          onpress: () {
                            userinfo += "x";
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      children: [
                        button(
                          title: "AC",
                          onpress: () {
                            userinfo = "";
                            answer = "";
                            setState(() {});
                          },
                          mycolor: Colors.blueGrey,
                        ),
                        button(
                          title: "DEL",
                          onpress: () {
                            if (userinfo.isNotEmpty) {
                              userinfo = userinfo.substring(
                                0,
                                userinfo.length - 1,
                              );
                            }
                            setState(() {});
                          },
                          mycolor: Colors.blueGrey,
                        ),
                        button(
                          title: "=",
                          onpress: () {
                            try {
                              Parser p = Parser();
                              Expression exp = p.parse(
                                userinfo.replaceAll("x", "*"),
                              );
                              ContextModel cm = ContextModel();
                              double evl = exp.evaluate(
                                EvaluationType.REAL,
                                cm,
                              );
                              answer = evl.toString();

                              history.add("$userinfo = $answer");
                            } catch (e) {
                              answer = "Error";
                            }
                            setState(() {});
                          },
                          mycolor: Colors.blueGrey,
                        ),
                        button(
                          title: "0",
                          onpress: () {
                            userinfo += "0";
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
