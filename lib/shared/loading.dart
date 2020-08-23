import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:unmasked/screens/home/home.dart';
import 'package:unmasked/screens/settings/navbar.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.white,
      child: Center(
        child: SpinKitSquareCircle( //Creating a spin
          color: Colors.red,
          size: 50.0,
        )
      ),
    );
  }
}
