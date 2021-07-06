import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyApp.dart';

class CalculatorScreen1 extends StatefulWidget {
  @override
  _CalculatorScreen1State createState() => _CalculatorScreen1State();
}

class _CalculatorScreen1State extends State<CalculatorScreen1> {
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
    "images/7.jpg",
    "images/8.jpg",
    "images/9.jpg",
    "images/divide.jpg",
    "images/4.jpg",
    "images/5.jpg",
    "images/6.jpg",
    "images/multiply.jpg",
    "images/1.jpg",
    "images/2.jpg",
    "images/3.jpg",
    "images/subtract.jpg",
    "images/decimal.jpg",
    "images/0.jpg",
    "images/equal.jpg",
    "images/add.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Calculator'),
            centerTitle: true,
            elevation: 0,
          ),
          body: Container(
            color: Colors.black,
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
            boxContainer(
              'AC',
              () {
                print('AC');
              },
            ),
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
          color: Colors.blueGrey,
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
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
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
          // Image.asset(buttonValues[index]);
          setValue(buttonValues[index]);
        });
      },
    );
  }

  setValue(value) {
    switch (value) {
      case "images/1.jpg":
        {
          isValue ? value3 = value3 + "1" : value4 = value4 + "1";
          setState(() {});
        }
        break;
      case "images/2.jpg":
        {
          isValue ? value3 = value3 + "2" : value4 = value4 + "2";
          setState(() {});
        }
        break;
      case "images/3.jpg":
        {
          isValue ? value3 = value3 + "3" : value4 = value4 + "3";
          setState(() {});
        }
        break;
      case "images/4.jpg":
        {
          isValue ? value3 = value3 + "4" : value4 = value4 + "4";
          setState(() {});
        }
        break;
      case "images/5.jpg":
        {
          isValue ? value3 = value3 + "5" : value4 = value4 + "5";
          setState(() {});
        }
        break;
      case "images/6.jpg":
        {
          isValue ? value3 = value3 + "6" : value4 = value4 + "6";
          setState(() {});
        }
        break;
      case "images/7.jpg":
        {
          isValue ? value3 = value3 + "7" : value4 = value4 + "7";
          setState(() {});
        }
        break;
      case "images/8.jpg":
        {
          isValue ? value3 = value3 + "8" : value4 = value4 + "8";
          setState(() {});
        }
        break;
      case "images/9.jpg":
        {
          isValue ? value3 = value3 + "9" : value4 = value4 + "9";
          setState(() {});
        }
        break;
      case "images/0.jpg":
        {
          isValue ? value3 = value3 + "0" : value4 = value4 + "0";
          setState(() {});
        }
        break;
      case "images/decimal.jpg":
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

          isValue ? value3 = value3 + "." : value4 = value4 + ".";
          setState(() {});
        }
        break;
      case "images/add.jpg":
        {
          operator = "+";
          setState(() {});
        }
        break;
      case "images/subtract.jpg":
        {
          operator = "-";
          setState(() {});
        }
        break;
      case "images/divide.jpg":
        {
          operator = "/";
          setState(() {});
        }
        break;
      case "images/multiply.jpg":
        {
          operator = "*";
          setState(() {});
        }
        break;

      case "images/equal.jpg":
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
        /* decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            color: Colors.white60,
            borderRadius: BorderRadius.all(Radius.circular(50.0))),*/
        width: screenWidth * 0.4,
        height: screenHeight * 0.06,

        child: Center(
          child: Image.asset(title),
        ),
      ),
    );
  }
}
