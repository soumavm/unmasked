import 'package:flutter/material.dart';
import 'package:unmasked/screens/home/settings_form.dart';
import 'package:unmasked/services/auth.dart';
import 'package:unmasked/services/database.dart';
import 'package:provider/provider.dart';
import 'package:unmasked/screens/home/employee_list.dart';
import 'package:unmasked/models/employee.dart';
import 'package:unmasked/screens/settings/navbar.dart';
import 'package:unmasked/screens/authenticate/add_user.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
          child: AddUser(),
        );
      });
    }

    void _showNavBar(){
      Container(
        child: NavBar()
      );
    }


    return StreamProvider<List<Employee>>.value(
      value: DatabaseService().employees,
      child: Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          title: Text('User Database'),
          backgroundColor: Colors.red[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('User Settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ]
        ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/gradient.png'),
                  fit: BoxFit.cover,
              ),
            ),
              child: EmployeeList()
          ),
      ),
    );
  }
}
