import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unmasked/models/user.dart';
import 'package:unmasked/screens/authenticate/authenticate.dart';
import 'package:unmasked/screens/home/home.dart';
import 'package:unmasked/screens/home/start.dart';
import 'package:unmasked/screens/settings/navbar.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either Home or Authenticate widget
    if (user ==null) {
      return StartPage();
    }else{
      return NavBar();
    }
  }
}
