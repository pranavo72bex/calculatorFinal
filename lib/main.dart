
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
      
      // appBar: AppBar(
      //   title:Text("General Calculator"),
      //   backgroundColor: Colors.red[300],
      // ),
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
           btn("AC",Colors.pink[100]),
           btn("Del",Colors.pink[100]),
           btn("^",Colors.pink[100]),
           btn("/",Colors.orange[100]),
          
        ],
        ),
        Row(children: <Widget>[
         
           btn("7", Colors.blueGrey),
           btn("8",Colors.blueGrey),
           btn("9",Colors.blueGrey),
           btn("x",Colors.orange[100]),

        ],),
        Row(children: <Widget>[

           btn("4", Colors.blueGrey),
           btn("5",Colors.blueGrey),
           btn("6",Colors.blueGrey),
           btn("-",Colors.orange[100]),

        ],),
        Row(children: <Widget>[
           btn("1", Colors.blueGrey),
           btn("2",Colors.blueGrey),
           btn("3",Colors.blueGrey),
           btn("+",Colors.orange[100]),

        ],),

        Row(children: <Widget>[
           btn0("0", Colors.blueGrey),
           btn(".",Colors.blueGrey),
           btn("=",Colors.orange[100]),
        ],)

        ]
      ),
    );
  }


// int firstnum ;
// int secondnum ;
// String textToDisplay=" ";
// String res;
// String operatorToPerform;  

//void btnclicked(String btnval){
  // if (btnval == "AC"){
    //  firstnum =0 ;
    //  secondnum=0 ;
    //  textToDisplay =" ";
    //  res = '';
  /// }
   //else if (btnval == "Del"){

    // textToDisplay=int.parse(textToDisplay.substring(0,textToDisplay.length - 1)).toString();
     

   //}



  // else if (btnval == "+"|| btnval == "-"||btnval == "X"||btnval =="/"||btnval=="^"){
   //  firstnum = int.parse(textToDisplay);
   //  res = " ";
  //  operatorToPerform = btnval ;
  // }
   //else if (btnval == "="){
    // secondnum = int.parse(textToDisplay);
    // if (operatorToPerform == "+"){
     //  res=(firstnum+secondnum).toString();   
     // }
     // if (operatorToPerform == "-"){
     //  res=(firstnum-secondnum).toString();   
     // }
     // if (operatorToPerform == "X"){
     //  res=(firstnum*secondnum).toString();   
     // }
      //if (operatorToPerform == "/"){
     //  res=(firstnum/secondnum).toString();   
     // }
      //if (operatorToPerform == "^"){
      // res=(firstnum^secondnum).toString();   
    //  }
     
  // }

//else {
  //res = int.parse(textToDisplay+btnval).toString();

//}

// setState(() {
//   textToDisplay = res;
// });






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
String result = " ";
String expression = "";
  

btnclicked(String btnval){
setState(() {
    if (btnval == "AC"){
      equation=" ";
      result =" ";

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





//}