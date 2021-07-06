import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyApp.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController value1 = new TextEditingController();
  TextEditingController value2 = TextEditingController();
  TextEditingController operatorController = TextEditingController();
  String value3 = '';
  String value4 = '';
  String operator = '';
  String ans = "";
  bool isValue = true;
  List<String> buttonValues = [
    //  "AC",
    //  "C",
    "7",
    "8",
    "9",
    "/",
    "4",
    "5",
    "6",
    "*",
    "1",
    "2",
    "3",
    "-",
    ".",
    "0",
    "=",
    "+"
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Calculator'),
            centerTitle: true,
            elevation: 0,
          ),
          body: Container(
            color: Colors.black87,
            height: screenHeight,
            width: screenWidth,
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                children: [
                  displayResult(),
                  getDynamicTextField(),
                  getClearButton(),
                  //getRowContainer(),
                  getGridView(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  getRowContainer() {
    return Column(
      children: [
        Row(
          children: [
            boxContainer('AC', () {
              print('AC');
            }),
            boxContainer('C', () {
              print('C');
            }),
          ],
        ),
        /*     Row(
          children: [
            boxContainer('4', () {
              print('4');
            }),
            boxContainer('5', () {
              print('5');
            }),
            boxContainer('6', () {
              print('6');
            }),
            boxContainer('-', () {
              print('-');
            }),
          ],
        ),
        Row(
          children: [
            boxContainer('1', () {
              print('1');
            }),
            boxContainer('2', () {
              print('2');
            }),
            boxContainer('3', () {
              print('3');
            }),
            boxContainer('+', () {
              print('+');
            }),
          ],
        ),
        Row(
          children: [
            boxContainer('.', () {
              print('.');
            }),
            boxContainer('0', () {
              print('0');
            }),
            boxContainer('/', () {
              print('/');
            }),
            boxContainer('=', () {
              print('=');
            }),
          ],
        ),*/
      ],
    );
  }

  displayResult() {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(30),
        //color: Colors.white60,
        width: screenWidth * 0.89,
        height: screenHeight * 0.18,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          color: Colors.black38,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Text(
          ans,
          style: TextStyle(fontSize: 40.0, color: Colors.white),
          textAlign: TextAlign.right,
        ));
  }

  getClearButton() {
    return Container(
      child: Row(
        children: [
          Spacer(),
          Container(
            //Decoration: ShapeDecoration.fromBoxDecoration(),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            //color: Colors.orange,
            child: InkWell(
              child: Text("AC",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0)),
              onTap: () {
                value3 = "";
                value4 = "";
                operator = "";
                ans = "";
                setState(() {});
              },
            ),
          ),
          Spacer(),
          Container(
            height: 50,
            width: 150,
            padding: EdgeInsets.all(10),
            //color: Colors.orange,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            child: InkWell(
              child: Text('C',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0)),
              onTap: () {
                isValue
                    ? value3 = value3.substring(0, value3.length - 1)
                    : value4 = value4.substring(0, value4.length - 1);
                setState(() {});
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  getDynamicTextField() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          Spacer(),
          Container(
            height: 70,
            width: 140,
            //color: Colors.white70,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            child: InkWell(
              child: Text(value3,
                  style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.center),
              onTap: () {
                isValue = true;
                setState(() {});
              },
            ),
          ),
          Spacer(),
          Container(
            height: 70,
            width: 50,
            //color: Colors.white70,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: InkWell(
              child: Text(operator, style: TextStyle(fontSize: 30.0)),
              onTap: () {
                setState(() {});
              },
            ),
          ),
          Spacer(),
          Container(
            height: 70,
            width: 140,
            //color: Colors.white70,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            padding: EdgeInsets.all(15),
            child: InkWell(
              child: Text(value4,
                  style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.center),
              onTap: () {
                isValue = false;
                setState(() {});
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  getGridView() {
    return GridView.builder(
      itemCount: buttonValues.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: screenWidth * 0.01,
        mainAxisSpacing: screenWidth * 0.01,
      ),
      itemBuilder: (context, index) {
        return boxContainer(buttonValues[index], () {
          setValue(buttonValues[index]);
        });
      },
    );
  }

  setValue(value) {
    switch (value) {
      case "1":
        {
          isValue ? value3 = value3 + value : value4 = value4 + value;
          setState(() {});
        }
        break;
      case "2":
        {
          isValue ? value3 = value3 + value : value4 = value4 + value;
          setState(() {});
        }
        break;
      case "3":
        {
          isValue ? value3 = value3 + value : value4 = value4 + value;
          setState(() {});
        }
        break;
      case "4":
        {
          isValue ? value3 = value3 + value : value4 = value4 + value;
          setState(() {});
        }
        break;
      case "5":
        {
          isValue ? value3 = value3 + value : value4 = value4 + value;
          setState(() {});
        }
        break;
      case "6":
        {
          isValue ? value3 = value3 + value : value4 = value4 + value;
          setState(() {});
        }
        break;
      case "7":
        {
          isValue ? value3 = value3 + value : value4 = value4 + value;
          setState(() {});
        }
        break;
      case "8":
        {
          isValue ? value3 = value3 + value : value4 = value4 + value;
          setState(() {});
        }
        break;
      case "9":
        {
          isValue ? value3 = value3 + value : value4 = value4 + value;
          setState(() {});
        }
        break;
      case "0":
        {
          isValue ? value3 = value3 + value : value4 = value4 + value;
          setState(() {});
        }
        break;
      case ".":
        {
          if (isValue == true) {
            if (value3.contains(".") == true) {
              break;
            }
          }
          if (isValue == false) {
            if (value4.contains(".") == true) {
              break;
            }
          }

          isValue ? value3 = value3 + value : value4 = value4 + value;
          setState(() {});
        }
        break;
      case "+":
        {
          operator = value;
          setState(() {});
        }
        break;
      case "-":
        {
          operator = value;
          setState(() {});
        }
        break;
      case "/":
        {
          operator = value;
          setState(() {});
        }
        break;
      case "*":
        {
          operator = value;
          setState(() {});
        }
        break;
      /*case "AC":
        {
          operator = "";
          value3 = "";
          value4 = "";
          setState(() {});
        }
        break;
      case "C":
        {
          isValue ? value3 = "" : value4 = "";
          setState(() {});
        }
        break;*/
      case "=":
        {
          getOperator(operator);
          setState(() {
            print("$ans");
          });
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  getOperator(exp) {
    switch (exp) {
      case "+":
        {
          var v1 = double.parse(value3);
          var v2 = double.parse(value4);
          var answer = v1 + v2;
          ans = answer.toString();
        }
        break;
      case "-":
        {
          var v1 = double.parse(value3);
          var v2 = double.parse(value4);
          var answer = v1 - v2;
          ans = answer.toString();
        }
        break;
      case "*":
        {
          var v1 = double.parse(value3);
          var v2 = double.parse(value4);
          var answer = v1 * v2;
          ans = answer.toString();
        }
        break;
      case "/":
        {
          var v1 = double.parse(value3);
          var v2 = double.parse(value4);
          var answer = v1 / v2;
          ans = answer.toString();
        }
        break;
    }
  }

  boxContainer(String title, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        //color: Colors.tealAccent,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            color: Colors.white60,
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        width: screenWidth * 0.4,
        height: screenHeight * 0.06,
        child: Center(child: Text(title, style: TextStyle(fontSize: 25.0))),
      ),
    );
  }
}
