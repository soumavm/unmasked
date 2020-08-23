import 'package:flutter/material.dart';
import 'package:unmasked/screens/authenticate/add_employee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unmasked/screens/home/settings_form.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final databaseReference = Firestore.instance;


  //form values
  String _currentEmployeeId;
  String _currentName;
  String _currentEmail;
  String _currentPhoneNumber;
  String _currentImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Settings'),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
                        "Add Employee",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
              onTap: () {
                navigateToAddEmployee(context);
                },
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
                        "Update Employee Card",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
                onTap: () {
                  navigateToAddEmployee(context);
                },
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
                        "Delete Employee",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
                onTap: () {
                  navigateToAddEmployee(context);
                },
              ),
              SizedBox(height:20),
            ],
          )), //center
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
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
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

  void updateData() {
    try {
      databaseReference
          .collection('employees')
          .document('1')
          .updateData({'description': 'Head First Flutter'});
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



Future navigateToAddEmployee(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => AddEmployee()));
}

