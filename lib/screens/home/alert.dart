import 'package:flutter/material.dart';
import 'package:unmasked/screens/authenticate/add_employee.dart';
import 'package:unmasked/screens/authenticate/add_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unmasked/screens/home/home.dart';
import 'package:unmasked/screens/settings/navbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;



class Alert extends StatefulWidget {
  @override
  AlertState createState() {
    return AlertState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class AlertState extends State<Alert> {
  final databaseReference = Firestore.instance;

  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  String email;

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
        child:  Form(
            key: _formKey,
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
                  SizedBox(height:20),
                  Text(
                    'Potential Covid-19 Transmitter',
                    style: TextStyle(color: Colors.black87, fontSize:20),
                  ),
                  SizedBox(height:30),
                  Text(
                    'Enter Email:',
                    style: TextStyle(color: Colors.black45, fontSize:12),
                  ),
                  SizedBox(height:0),
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Please enter email' : null,
                    onChanged: (val) => setState(() => email = val),
                  ),
                  SizedBox(height:50),
                  GestureDetector(
                    child: Container(
                      width: 1000,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:Colors.red),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white)
                        ),
                      ),
                    ),
                    onTap: () {
                      sendHttp(email);
                      navigateToSearchPage(context);
                    },
                  ),
                ]
            )
        ),
      ),
    );

  }


  void sendHttp(String email) async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = 'https://samsonwhua81421.api.stdlib.com/unmasked-api@dev/?email=' + email;

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void addEmployee(String name, String email) async {
    await databaseReference.collection("employees")
        .document("1")
        .setData({
      'name': name,
      'email': email,
    });

    DocumentReference ref = await databaseReference.collection("employees")
        .add({
      'name': name,
      'email': email
    });
    print(ref.documentID);
  }

}

Future navigateToSearchPage(context) async {
  Navigator.pop(context, MaterialPageRoute(builder: (context) => NavBar()));
}




