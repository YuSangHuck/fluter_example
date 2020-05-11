import 'dart:collection';
import 'package:stack/stack.dart';

var digits = <String>['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
var operators = <String>['+', '-', '*', '/', '(', ')'];

var dot = <String>['.'];

class Parser {
  const Parser();

  // 피연산자 두개를 받고 계산후 값을 return
  double _calculate(double op1, double op2, String op) {}

  // 연산자의 우선순위
  num _getPriority(String op) {}

  // 지금 들어온 값이 연산자인지 확인
  bool _isOperator(String op) {
    return operators.contains(op);
  }

  //지금 들어온 값이 숫자인지 확인
  bool _isDigit(String op) {
    return digits.contains(op);
  }

  //지금 들어온 값이 .인지 확인
  bool _isDot(String op) {
    return dot.contains(op);
  }

  ///////////////////////작성부분///////////////////////
  dynamic parseExpression(String expr) {
    Stack<String> stack = Stack();
    Stack<double> doubleStack = Stack();
    Queue<String> queue = new ListQueue<String>();
    double result = 0;

    // 입력된 값을 배열로 저장
    // input : 2.3 + 3
    // tempArray[0] = 2
    // tempArray[1] = .
    // tempArray[2] = 3
    // tempArray[3] = +
    // tempArray[4] = 3
    var tempArray = expr.split(''); 

    //입력받은 값을 후위표기법으로 변환

    print(queue.toString()); // 후기표기법 출력


    // 후위표기법을 계산
    while (queue.isNotEmpty) {

    }

    return result.toStringAsFixed(5);
  }
  ///////////////////////작성부분//////////////////////
}
