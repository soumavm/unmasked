import 'package:flutter/material.dart';
import 'package:unmasked/screens/home/settings_form.dart';
import 'package:unmasked/services/auth.dart';
import 'package:unmasked/services/database.dart';
import 'package:provider/provider.dart';
import 'package:unmasked/screens/home/employee_list.dart';
import 'package:unmasked/models/employee.dart';
import 'package:unmasked/screens/settings/navbar.dart';
import 'package:unmasked/screens/authenticate/add_user.dart';

class Logout extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {


    return StreamProvider<List<Employee>>.value(
      value: DatabaseService().employees,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
            title: Text('Settings Panel'),
            backgroundColor: Colors.red,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async{
                  await _auth.signOut();
                },
              ),
            ]
        ),
              ),
    );
  }
}
