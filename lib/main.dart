import 'package:flutter/material.dart';

import 'parser.dart';

void main() => runApp(new MyApp());
var openBracket = 0;
var closeBracket = 0;

const appName = 'Flutter Calculator';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.tealAccent,
      ),
      home: new Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Display(),
          new Keyboard(),
        ],
      ),
    );
  }
}

var _displayState = new DisplayState();

class Display extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _displayState;
  }
}

class DisplayState extends State<Display> {
  var _expression = '';
  var _result = '';

  @override
  Widget build(BuildContext context) {
    var views = <Widget>[
      new Expanded(
          flex: 1,
          child: new Row(
            children: <Widget>[
              new Expanded(
                  child: new Text(
                _expression,
                textAlign: TextAlign.right,
                style: new TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ))
            ],
          )),
    ];

    if (_result.isNotEmpty) {
      views.add(
        new Expanded(
            flex: 1,
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new Text(
                  _result,
                  textAlign: TextAlign.right,
                  style: new TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ))
              ],
            )),
      );
    }

    return new Expanded(
        flex: 2,
        child: new Container(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            children: views,
          ),
        ));
  }
}

void _addKey(String key) {
  var _expr = _displayState._expression;
  var _result = '';
  if (_displayState._result.isNotEmpty) {
    _expr = '';
    _result = '';
  }

///////////////////////작성부분///////////////////////

/*
  1. 각 버튼이 동작하도록 구현.
  2. 괄호의 갯수가 잘못되어 있다면 값을 계산하지 않고 에러를 호출
  4. C 버튼을 누르면 최근에 입력된 글자 하나가 삭제
  5. clear 버튼을 누르면 전부 삭제
  6. 연산자가 중복해서 나오는 경우는 없다.(최근에 입력 되었던 연산자 덮어쓰기)
  7. 소수점은 연속해서 안찍히게 한다.
  → 6+6*가 입력되어 있는 상황에서 +를 입력하면 6+6*+가 아니라 6+6+ 로 입력
*/


  if (digits.contains(key)){
    _expr += key;
  }
  
///////////////////////작성부분///////////////////////

  // ignore: invalid_use_of_protected_member
  _displayState.setState(() {
    _displayState._expression = _expr;
    _displayState._result = _result;
  });
}

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
        flex: 5,
        child: new Center(
            child: new AspectRatio(
          aspectRatio: 1.0, // To center the GridView
          child: new GridView.count(
            crossAxisCount: 5,
            childAspectRatio: 1.0,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: <String>[
              // @formatter:off
              '7', '8', '9', '/', '(',
              '4', '5', '6', '*', ')',
              '1', '2', '3', '-', 'C',
              '.', '0', '=', '+', 'clear',
              '', '', '', '', '',
              // @formatter:on
            ].map((key) {
              return new GridTile(
                child: new KeyboardKey(key),
              );
            }).toList(),
          ),
        )));
  }
}

class KeyboardKey extends StatelessWidget {
  KeyboardKey(this._keyValue);

  final _keyValue;

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      child: new Text(
        _keyValue,
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26.0,
          color: Colors.black,
        ),
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      onPressed: () {
        _addKey(_keyValue);
      },
    );
  }
}
