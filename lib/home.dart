import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';



class Calculator extends StatefulWidget {
  
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

 var display = "";


Widget btns(var texts){
  return ElevatedButton(onPressed: (){
    setState(() {
      display = display + texts;
    });
  }, child: Text(texts), style: ElevatedButton.styleFrom(
    primary: Colors.grey,
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    textStyle: TextStyle(fontWeight: FontWeight.bold,
    fontSize: 15,
    )
  ),);
}

clear() {
  setState(() {
    display = "" ;
  });
}


result() {
  Parser p = Parser();
  Expression exp = p.parse(display);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);

  setState(() {
    display = eval.toString();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(display, style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),),
                
                Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  btns("7"),
                  btns("8"),
                  btns("9"),
                  btns("/"),
                ],),
                 Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  btns("4"),
                  btns("5"),
                  btns("6"),
                  btns("*"),
                ],),
                 Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  btns("1"),
                  btns("2"),
                  btns("3"),
                  btns("-"),
                ],),
                 Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  btns("0"),
                  ElevatedButton(onPressed: clear, child: Text("C"),
                  style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 15,
                  )
                  ),
                  
                  
                  ),
                
                  ElevatedButton(onPressed: result, child: Text("="),
                  style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 15,
                  )
  ),
                  
                  ),
                  btns("+"),
                ],
                
                ),

              ]
            ),
    ),
    );

  }
}



