import 'package:flutter/material.dart';
import 'package:unmasked/screens/account_page/account_page.dart';
import 'package:unmasked/screens/authenticate/add_user.dart';
import 'package:unmasked/screens/home/home.dart';
import 'package:unmasked/screens/dashboard/dashboard.dart';
import 'package:unmasked/screens/settings/settingsPage.dart';
import 'package:unmasked/screens/authenticate/add_employee.dart';
import 'package:unmasked/screens/settings/logout.dart';


class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int _currentIndex = 0;

  final tabs =[
    Center(child: DashBoardPage()),
    Center(child: Home()),
    Center(child: AccountPage()),
    Center(child: Logout()),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red[900],
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Dashboard'),
           // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('User Database'),
         //   backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Account Info'),
        //    backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
        //    backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index){
          setState((){
            _currentIndex=index;
          });
        }
      ),

    );
  }
}
