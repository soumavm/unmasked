//import 'package:flutter/material.dart';
//
//class SendAlert extends StatefulWidget {
//  @override
//  _SendAlertState createState() => _SendAlertState();
//}
//
//class _SendAlertState extends State<SendAlert> {
//
//  final _formKey = GlobalKey<FormState>();
//
//  //form values
//  String _EmployeeId;
//  String _Date;
//  String _Time;
//
//  Widget _buildEmployeeId() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'Emplotee Id'),
//      validator: (String value) {
//        if (value.isEmpty) {
//          return 'Employee id is required';
//        }
//      },
//      onSaved: (String value) {
//        _EmployeeId = value;
//      },
//    );
//  }
//
//  Widget _buildDate() {
//    return null;
//  }
//
//  Widget _buildTime() {
//    return null;
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(title: Text('Form Demo')),
//        body: Container(
//            margin: EdgeInsets.all(24),
//            child: Form(child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                _buildEmployeeId(),
//              _buildDate(),
//              _buildTime(),
//              SizedBox(height: 100),
//              RaisedButton(
//                  child: Text('Submit', style: TextStyle(color:Colors.blue, fontSize: 16),
//                  ),
//                  onPressed: () => {
//                  if(!_formKey.currentState.validate()){
//                  return;
//                  };
//                  _formKey.currentState.save();
//            },
//            )
//            ]
//        )
//    )
//    )
//    )
//  }
//}
