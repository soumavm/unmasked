import 'package:flutter/material.dart';
import 'package:unmasked/screens/home/settings_form.dart';
import 'package:unmasked/services/auth.dart';
import 'package:unmasked/services/database.dart';
import 'package:provider/provider.dart';
import 'package:unmasked/screens/home/employee_list.dart';
import 'package:unmasked/models/employee.dart';
import 'package:unmasked/screens/settings/navbar.dart';

class SettingsPage extends StatefulWidget {

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
            title: Text(' Settings'),
            backgroundColor: Colors.red[900],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: ()  {
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
                onPressed: () {},
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
            child: SettingsForm()
        ),
      );
  }
}
