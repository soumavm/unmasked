import 'package:flutter/material.dart';
import 'package:unmasked/screens/authenticate/add_employee.dart';
import 'package:unmasked/screens/authenticate/add_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unmasked/screens/home/home.dart';
import 'package:unmasked/screens/settings/navbar.dart';

class AccountPage extends StatefulWidget {
  @override
  AccountPageState createState() {
    return AccountPageState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red[200], Colors.white],
              end: FractionalOffset.topCenter,
              begin: FractionalOffset.bottomCenter,
              stops: [0.0,1.0],
              tileMode: TileMode.clamp,
            )
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        width: 500,
        child:  Form(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                  SizedBox(height:10),
                  Text(
                    'Your Company',
                    style: TextStyle(color: Colors.black87, fontSize:25),
                  ),
                  SizedBox(height:100),

                  SizedBox(height:0),

                  SizedBox(height:50),

                ]
            )
        ),
      ),
    );

  }

}
