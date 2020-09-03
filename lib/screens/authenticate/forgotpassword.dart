import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spp_app/screens/authenticate/authenticate.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                headerSection(),
                SizedBox(
                  height: 75.0,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      value.isEmpty ? 'Enter and email' : null,
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff0129ba),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  height: 60.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xff0129ba),
                    elevation: 5.0,
                    child: GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Authenticate()));
                        }
                      },
                      child: Center(
                        child: Text(
                          'SEND EMAIL',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'ProximaNova',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 60.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Text('Go Back',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat')),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container headerSection() {
  return Container(
    child: Align(
      alignment: Alignment.centerLeft,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 125.0, 0.0, 0.0),
            child: Text(
              'Forgot',
              style: TextStyle(
                fontFamily: 'ProximaNova',
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 195.0, 0.0, 0.0),
            child: Text(
              'Password',
              style: TextStyle(
                fontFamily: 'ProximaNova',
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(260.0, 175.0, 0.0, 0.0),
            child: Text(
              '.',
              style: TextStyle(
                fontFamily: 'ProximaNova',
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff0129ba),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
