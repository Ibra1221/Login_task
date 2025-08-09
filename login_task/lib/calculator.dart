import 'package:mdi/mdi.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'dart:async';

void main() async {
  runApp(RestartWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget? child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  State<StatefulWidget> createState() {
    return _RestartWidgetState();
  }
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: key, child: widget.child ?? Container());
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});

  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String inputText = "";
  String resultText = "";
  String operators = "+-%×÷";

  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFDCDE7D),
        appBar: AppBar(
          title: const Text("Calculator"),
          actions: [
            IconButton( 
              onPressed: () => {
                Navigator.pop(context)
              }, 
              icon: Icon(Mdi.closeCircle))
          ],
        ),
        body: Center(
          child: Container(
            height: 400,
            width: 200,
            decoration: BoxDecoration(
              color: Color(0xFF252424),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 200,
                  child: Align(
                    alignment: Alignment(0.75, 1),
                    child: Text(
                      inputText,
                      style: TextStyle(color: Color(0xFF586A8B), fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: Align(
                    alignment: Alignment(0.75, 0.4),
                    child: Text(
                      resultText,
                      style: TextStyle(color: Color(0xFFFAFAFB), fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F1F4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Container(
                          height: 2,
                          width: 80,
                          margin: EdgeInsets.only(top: 10, left: 40, right: 40),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFDFDFE6),
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(90, 45),
                            ),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  resultText = "";
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.alphaC,
                                color: Color(0xFF7D7D7D),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  try {
                                    List<String> tokens = resultText.split(" ");
                                    num x = num.parse(
                                      tokens[tokens.length - 1],
                                    );
                                    resultText = resultText.replaceRange(
                                      resultText.length -
                                          tokens[tokens.length - 1].length,
                                      null,
                                      "",
                                    );
                                    x = x * -1;
                                    resultText += x.toString();
                                  } on Exception {
                                    return;
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.plusMinusVariant,
                                color: Color(0xFF7D7D7D),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  try {
                                    if (resultText.length == 9) {
                                      return;
                                    }
                                    String character = resultText
                                        .substring(resultText.length - 1)
                                        .trim();
                                    if (operators.contains(character)) {
                                      return;
                                    } else {
                                      resultText += " %";
                                    }
                                  } on Exception {
                                    return;
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.percentOutline,
                                color: Color(0xFF7D7D7D),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  try {
                                    if (resultText.length == 9) {
                                      return;
                                    }
                                    String character = resultText
                                        .substring(resultText.length - 1)
                                        .trim();
                                    if (operators.contains(character)) {
                                      return;
                                    } else {
                                      resultText += " ÷";
                                    }
                                  } on Exception {
                                    return;
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.division,
                                color: Color(0xFF6D57F2),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  if (resultText == "" ||
                                      isNumeric(
                                        resultText.substring(
                                          resultText.length - 1,
                                        ),
                                      ) ||
                                      resultText.substring(
                                            resultText.length - 1,
                                          ) ==
                                          ".") {
                                    resultText += "7";
                                  } else {
                                    resultText += " 7";
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.numeric7,
                                color: Color(0xFF647EB0),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  if (resultText == "" ||
                                      isNumeric(
                                        resultText.substring(
                                          resultText.length - 1,
                                        ),
                                      ) ||
                                      resultText.substring(
                                            resultText.length - 1,
                                          ) ==
                                          ".") {
                                    resultText += "8";
                                  } else {
                                    resultText += " 8";
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.numeric8,
                                color: Color(0xFF647EB0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  if (resultText == "" ||
                                      isNumeric(
                                        resultText.substring(
                                          resultText.length - 1,
                                        ),
                                      ) ||
                                      resultText.substring(
                                            resultText.length - 1,
                                          ) ==
                                          ".") {
                                    resultText += "9";
                                  } else {
                                    resultText += " 9";
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.numeric9,
                                color: Color(0xFF647EB0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  try {
                                    if (resultText.length == 9) {
                                      return;
                                    }
                                    String character = resultText
                                        .substring(resultText.length - 1)
                                        .trim();
                                    if (operators.contains(character)) {
                                      return;
                                    } else {
                                      resultText += " ×";
                                    }
                                  } on Exception {
                                    return;
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.close,
                                color: Color(0xFF6D57F2),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  if (resultText == "" ||
                                      isNumeric(
                                        resultText.substring(
                                          resultText.length - 1,
                                        ),
                                      ) ||
                                      resultText.substring(
                                            resultText.length - 1,
                                          ) ==
                                          ".") {
                                    resultText += "4";
                                  } else {
                                    resultText += " 4";
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.numeric4,
                                color: Color(0xFF647EB0),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  if (resultText == "" ||
                                      isNumeric(
                                        resultText.substring(
                                          resultText.length - 1,
                                        ),
                                      ) ||
                                      resultText.substring(
                                            resultText.length - 1,
                                          ) ==
                                          ".") {
                                    resultText += "5";
                                  } else {
                                    resultText += " 5";
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.numeric5,
                                color: Color(0xFF647EB0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  if (resultText == "" ||
                                      isNumeric(
                                        resultText.substring(
                                          resultText.length - 1,
                                        ),
                                      ) ||
                                      resultText.substring(
                                            resultText.length - 1,
                                          ) ==
                                          ".") {
                                    resultText += "6";
                                  } else {
                                    resultText += " 6";
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.numeric6,
                                color: Color(0xFF647EB0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.isEmpty) {
                                    resultText = "-";
                                  }
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  try {
                                    if (resultText.length == 9) {
                                      return;
                                    }
                                    String character = resultText
                                        .substring(resultText.length - 1)
                                        .trim();
                                    if (operators.contains(character)) {
                                      return;
                                    } else {
                                      resultText += " -";
                                    }
                                  } on Exception {
                                    return;
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.minus,
                                color: Color(0xFF6D57F2),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  if (resultText == "" ||
                                      isNumeric(
                                        resultText.substring(
                                          resultText.length - 1,
                                        ),
                                      ) ||
                                      resultText.substring(
                                            resultText.length - 1,
                                          ) ==
                                          ".") {
                                    resultText += "1";
                                  } else {
                                    resultText += " 1";
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.numeric1,
                                color: Color(0xFF647EB0),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  if (resultText == "" ||
                                      isNumeric(
                                        resultText.substring(
                                          resultText.length - 1,
                                        ),
                                      ) ||
                                      resultText.substring(
                                            resultText.length - 1,
                                          ) ==
                                          ".") {
                                    resultText += "2";
                                  } else {
                                    resultText += " 2";
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.numeric2,
                                color: Color(0xFF647EB0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  if (resultText == "" ||
                                      isNumeric(
                                        resultText.substring(
                                          resultText.length - 1,
                                        ),
                                      ) ||
                                      resultText.substring(
                                            resultText.length - 1,
                                          ) ==
                                          ".") {
                                    resultText += "3";
                                  } else {
                                    resultText += " 3";
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.numeric3,
                                color: Color(0xFF647EB0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  try {
                                    if (resultText.length == 9) {
                                      return;
                                    }
                                    String character = resultText
                                        .substring(resultText.length - 1)
                                        .trim();
                                    if (operators.contains(character)) {
                                      return;
                                    } else {
                                      resultText += " +";
                                    }
                                  } on Exception {
                                    return;
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Color(0xFF6D57F2),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 75,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  if (resultText == "" ||
                                      isNumeric(
                                        resultText.substring(
                                          resultText.length - 1,
                                        ),
                                      ) ||
                                      resultText.substring(
                                            resultText.length - 1,
                                          ) ==
                                          ".") {
                                    resultText += "0";
                                  } else {
                                    resultText += " 0";
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: Align(
                                alignment: AlignmentGeometry.xy(-0.8, 0),
                                child: const Icon(
                                  Mdi.numeric0,
                                  color: Color(0xFF647EB0),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (resultText.length == 9) {
                                    return;
                                  }
                                  List<String> tokens = resultText.split(" ");
                                  String lastToken = tokens[tokens.length - 1];
                                  if (isNumeric(
                                        lastToken.substring(
                                          lastToken.length - 1,
                                        ),
                                      ) &&
                                      !(lastToken.contains("."))) {
                                    resultText += ".";
                                  } else {
                                    return;
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFDFDFE6),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: Align(
                                alignment: AlignmentGeometry.xy(0, 0.9),
                                child: const Icon(
                                  Mdi.squareSmall,
                                  color: Color(0xFF272726),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  try {
                                    if (resultText.isEmpty) {
                                      return;
                                    }
                                    String expression = resultText;
                                    expression = expression.replaceAll(
                                      "×",
                                      "*",
                                    );
                                    expression = expression.replaceAll(
                                      "÷",
                                      "/",
                                    );
                                    print(
                                      "'$expression' -> ${expression.interpret()}",
                                    );
                                    num result = expression.interpret();
                                    print(result);
                                    inputText = resultText;
                                    resultText = result.toString();
                                    Timer(Duration(seconds: 3), () {
                                      RestartWidget.restartApp(context);
                                    });
                                  } on Exception {
                                    Timer(Duration(seconds: 3), () {
                                      RestartWidget.restartApp(context);
                                    });
                                  }
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFF2DD3C5),
                                ),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                              ),
                              child: const Icon(
                                Mdi.equal,
                                color: Color(0xFFFFF7FE),
                              ),
                            ),
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
      ),
    );
  }
}
