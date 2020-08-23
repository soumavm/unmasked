import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unmasked/screens/home/alert.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
              padding: new EdgeInsets.all(100.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.red[200], Colors.white],
                    end: FractionalOffset.topCenter,
                    begin: FractionalOffset.bottomCenter,
                    stops: [0.0,1.0],
                    tileMode: TileMode.clamp,
                  )
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/logo.png"),
                              fit: BoxFit.values[1]
                          ),
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 15.0,
                              spreadRadius: 3.0,
                            ),
                          ]
                      ),
                    ),
                    SizedBox(height:20),
                    Text(
                        "Dashboard",
                        style: TextStyle(color: Colors.grey[700], fontSize: 30, fontWeight: FontWeight.bold)
                    ),
                    SizedBox(height:100),
                    GestureDetector(
                      child: Container(
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:Colors.red),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Text(
                              "SEND ALERT TO EMPLOYEES",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white)
                          ),
                        ),
                      ),
                      onTap: () {
                        navigateToAlert(context);}
                    ),
                    SizedBox(height:20),
                  ]
              )
          )
      )
    );
  }
}

Future navigateToAlert(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Alert()));
}