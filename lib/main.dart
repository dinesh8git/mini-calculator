import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;
  String inputvalue = "";
  String calValue = "";
  String operator = "";
  
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          
          title: Text(
            "CALCULATOR", style: TextStyle(color: Colors.amber,
            height: 1)
        ),
        backgroundColor: Colors.black,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 28),
                alignment: Alignment.bottomRight,

                child: Text(
                  inputvalue,
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40),

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [cal("clear", Colors.black)],
                      ),

                      Row(
                        children: [
                          cal("7", Colors.grey),
                          cal("8", Colors.grey),
                          cal("9", Colors.grey),
                          cal("/", Colors.orange),
                        ],
                      ),
                      Row(
                        children: [
                          cal("4", Colors.grey),
                          cal("5", Colors.grey),
                          cal("6", Colors.grey),
                          cal("*", Colors.orange),
                        ],
                      ),
                      Row(
                        children: [
                          cal("1", Colors.grey),
                          cal("2", Colors.grey),
                          cal("3", Colors.grey),
                          cal("-", Colors.orange),
                        ],
                      ),
                      Row(
                        children: [
                          cal("0", Colors.grey),
                          cal(".", Colors.grey),
                          cal("=", Colors.orange),
                          cal("+", Colors.orange),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  Widget cal(String text, Color bgcolor) {
    return InkWell(
      onTap: () {
        if (text == "clear") {
          setState(() {
            inputvalue = "";
            operator="";
            inputvalue="";

          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          setState(() {
            calValue = inputvalue;
            inputvalue = "";
            operator = text;
          });
        } else if (text == "=") {
          setState(() {
            if(calValue.isEmpty|| inputvalue.isEmpty||inputvalue=="error"){
              return;
            }
            double cal = double.parse(calValue);
            double inp = double.parse(inputvalue);
            if (operator == "+") {
              inputvalue = (cal + inp).toString();
            } else if (operator == "-") {
              inputvalue = (cal - inp).toString();
            } else if (operator == "*") {
              inputvalue = (cal * inp).toString();
            } else if (operator == "/") {
              if(inp!=0){
              inputvalue = (cal / inp).toString();
              }
              else{
                inputvalue="error";
                calValue="";
                operator="";
                return;

              }
           
          }
          operator="";
          }
           
            

          );
        } else {
          setState(() {
            inputvalue = inputvalue + text;
          });
        }
      },

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: bgcolor,
        ),
        margin: EdgeInsets.all(10),
        height: size,
        width: size,

        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
