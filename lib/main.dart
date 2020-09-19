
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';



void main() {
runApp(new calculator());  
}

class calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " ",
      home: new Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      backgroundColor: Colors.black,
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(children: <Widget>[
           Expanded(
         child: Text(equation ,
         style: TextStyle(
           color: Colors.white,
           fontSize:50.0,
         
         ),
          textAlign: TextAlign.right,
         ),
      
       )
        ],
        ),
        Row(children: <Widget>[
           btn("AC",Colors.green[400]),
           btn("Del",Colors.green[400]),
           btn("^",Colors.green[400]),
           btn("/",Colors.green[400]),
          
        ],
        ),
        Row(children: <Widget>[
         
           btn("7", Colors.white),
           btn("8",Colors.white),
           btn("9",Colors.white),
           btn("x",Colors.green[400]),

        ],),
        Row(children: <Widget>[

           btn("4", Colors.white),
           btn("5",Colors.white),
           btn("6",Colors.white),
           btn("-",Colors.green[400]),

        ],),
        Row(children: <Widget>[
           btn("1", Colors.white),
           btn("2",Colors.white),
           btn("3",Colors.white),
           btn("+",Colors.green[400]),

        ],),

        Row(children: <Widget>[
           btn0("0", Colors.white),
           btn(".",Colors.white),
           btn("=",Colors.green[400]),
        ],)

        ]
      ),
    );
  }


Widget btn(btnval,Color color){
  return Container(
    padding: EdgeInsets.only(bottom:10),
    child : new RaisedButton(
      child: Text(btnval,
      style: TextStyle(
        fontSize:25,
      ),),
      onPressed:(){
        btnclicked(btnval);
      },
      color: color,
      padding: EdgeInsets.all(20.0),
      shape: CircleBorder(),

      )
  );
} 
Widget btn0(btnval,Color color){
  return Container(
    padding: EdgeInsets.only(bottom:10),
    child : new RaisedButton(
      child: Text(btnval,
      style: TextStyle(
        fontSize:30,
      ),),
      onPressed:(){
        btnclicked(btnval);
      },
      color: color,
      padding: EdgeInsets.only(top:20.0 ,bottom:20.0 ,left:78.0 ,right:78.0 ),
      shape: StadiumBorder(),

      )
  );
}





//new logic 

String equation = " ";
String expression = "";
  

btnclicked(String btnval){
setState(() {
    if (btnval == "AC"){
      equation=" ";
     

  }else if (btnval == "Del"){
    equation=equation.substring(0,equation.length-1);
    if (equation==" "){
      equation=" ";

    }

  }else if (btnval == "="){

    expression=equation;
    expression=expression.replaceAll("x", "*");

   
      Parser p = Parser();
      Expression exp =p.parse(expression);
      ContextModel cm = ContextModel();
      equation='${exp.evaluate(EvaluationType.REAL, cm)}';

  }
  
  else {
    equation = equation + btnval;
  }


});
}


}




