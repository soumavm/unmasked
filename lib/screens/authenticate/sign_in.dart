import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unmasked/services/auth.dart';
import 'package:unmasked/shared/constants.dart';
import 'package:unmasked/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password ='';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red[200], Colors.white],
              end: FractionalOffset.topCenter,
              begin: FractionalOffset.bottomCenter,
              stops: [0.0,1.0],
              tileMode: TileMode.clamp,
            )
        ),
        child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  "Sign in to Unmasked",
                  style: TextStyle(color: Colors.grey[700], fontSize: 17)
              ),
              SizedBox(height:30),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged:(val){
                  setState(() => email = val);
                }
              ),
              SizedBox(height:10),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val){
                    setState(() => password = val);
                  },
              ),
              SizedBox(height:30),
              GestureDetector(
                child: Container(
                  width: 1000,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
                onTap: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                     if(result==null){
                       setState(() {
                         error = 'Could not sign in with those credentials';
                         loading = false;
                       });
                     }
                  }
                },
              ),
              SizedBox(height:12),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize:14),
               ),
            ]
          )
        ),
      ),
    );
  }
}
