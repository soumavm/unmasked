import 'package:flutter/material.dart';
import 'package:unmasked/screens/authenticate/add_employee.dart';
import 'package:unmasked/screens/authenticate/add_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unmasked/screens/home/home.dart';
import 'package:unmasked/screens/settings/navbar.dart';

class UpdateEmployee extends StatefulWidget {
  @override
  UpdateEmployeeState createState() {
    return UpdateEmployeeState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class UpdateEmployeeState extends State<UpdateEmployee> {
  final databaseReference = Firestore.instance;

  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  String name;
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
                    'Update Employee Information',
                    style: TextStyle(color: Colors.black87, fontSize:25),
                  ),
                  SizedBox(height:30),
                  Text(
                    'Enter Email:',
                    style: TextStyle(color: Colors.black45, fontSize:12),
                  ),
                  SizedBox(height:0),
                  TextFormField(
                   // initialValue: userData.phoneNumber,
                    validator: (val) => val.isEmpty ? 'Please enter email' : null,
                    onChanged: (val) => setState(() => email = val),
                  ),
                  SizedBox(height:18),
                  Text(
                    'Enter Name:',
                    style: TextStyle(color: Colors.black45, fontSize:12),
                  ),
                  SizedBox(height:0),
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Please enter name' : null,
                    onChanged: (val) => setState(() => name = val),
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
                      addEmployee(name, email);
                      navigateToSearchPage(context);
                    },
                  ),
                ]
            )
        ),
      ),
    );

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

  void getData() {
    databaseReference
        .collection("employees")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }

  void updateData(String name, String email) {
    try {
      databaseReference
          .collection('employees')
          .document('1')
          .updateData({
        'name': name,
        'email': email
          });
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteData() {
    try {
      databaseReference
          .collection('employees')
          .document('1')
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}


Future navigateToSearchPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar()));
}

