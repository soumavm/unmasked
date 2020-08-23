import 'package:flutter/material.dart';
import 'package:unmasked/screens/authenticate/register.dart';
import 'package:unmasked/screens/authenticate/sign_in.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

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
                      SizedBox(height:30),
                      Text(
                          "WELCOME TO UNMASKED",
                          style: TextStyle(color: Colors.grey[700], fontSize: 17)
                      ),
                      SizedBox(height:20),
                      GestureDetector(
                        child: Container(
                          width: 1000,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:Colors.red),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white)
                            ),
                          ),
                        ),
                        onTap: () {
                          navigateToLoginPage(context);
                        },
                      ),
                      SizedBox(height:20),
                      GestureDetector(
                        child: Container(
                          width: 1000,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:Colors.transparent,
                              border: Border.all(
                                color: Colors.black,
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Sign Up",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white)
                            ),
                          ),
                        ),
                        onTap: () {
                          navigateToRegisterPage(context);
                          },
                      ), SizedBox(height:50),
                      Text(
                          "@2020 Unmasked",
                          style: TextStyle(color: Colors.white, fontSize: 12)
                      ),
                    ]
                )
            )
        )
    );
  }
}

Future navigateToLoginPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
}

Future navigateToRegisterPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
}