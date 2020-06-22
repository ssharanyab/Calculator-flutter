import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calculator',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Calculator- Made by Sharanya'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double n1 = 0.0;
  double n2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "Clear") {
      _output = "0";
      n1 = 0.0;
      n2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      n1 = double.parse(output);
      operand = buttonText;
      _output = "0";
      output = n1 as String;
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimal");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      n2 = double.parse(output);
      if (operand == "+") {
        _output = (n1 + n2).toString();
      }
      if (operand == "-") {
        _output = (n1 - n2).toString();
      }
      if (operand == "x") {
        _output = (n1 * n2).toString();
      }
      if (operand == "/") {
        _output = (n1 / n2).toString();
      }
      n1 = 0.0;
      n2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget button(String buttontext) {
    return new Expanded(
      child: new MaterialButton(
        padding: new EdgeInsets.all(27),
        shape: new RoundedRectangleBorder(),
        child: new Text(
          buttontext,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        color: Colors.lime,
        onPressed: () => {buttonPressed(buttontext)},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
          child: new Column(
        children: <Widget>[
          new Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: new Text(
                output,
                style: new TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
          new Expanded(
            child: new Divider(),
          ),
          new Column(
            children: [
              new Row(children: [
                button("7"),
                button("8"),
                button("9"),
                button("+")
              ]),
              new Row(children: [
                button("4"),
                button("5"),
                button("6"),
                button("/")
              ]),
              new Row(children: [
                button("1"),
                button("2"),
                button("3"),
                button("x")
              ]),
              new Row(children: [
                button("0"),
                button("00"),
                button("."),
                button("-")
              ]),
              new Row(children: [button("Clear"), button("=")]),
            ],
          ),
        ],
      )),
    );
  }
}
