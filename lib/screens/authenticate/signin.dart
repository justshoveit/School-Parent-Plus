import 'package:flutter/material.dart';
import 'package:spp_app/services/auth.dart';
import 'package:spp_app/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                        height: 30.0,
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).nextFocus(),
                        validator: (value) =>
                            value.isEmpty ? 'Enter an email.' : null,
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
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).unfocus(),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (value.length < 8) {
                            return 'Password needs to be at least 8 characters';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() => password = value);
                        },
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      forgotPassword(),
                      SizedBox(height: 20.0),
                      Container(
                        height: 60.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.deepPurple,
                          elevation: 5.0,
                          child: GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error =
                                        "Couldn't sign in using the credentials provided.";
                                    loading = false;
                                  });
                                }
                              }
                            },
                            child: Center(
                              child: Text(
                                'LOGIN',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                            ),
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              widget.toggleView();
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontFamily: 'ProximaNova',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          error,
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'ProximaNova',
                              fontSize: 15.0),
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
              'Hello',
              style: TextStyle(
                fontFamily: 'ProximaNova',
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 195.0, 0.0, 0.0),
            child: Text(
              'There',
              style: TextStyle(
                fontFamily: 'ProximaNova',
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(210.0, 195.0, 0.0, 0.0),
            child: Text(
              '.',
              style: TextStyle(
                fontFamily: 'ProximaNova',
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Container forgotPassword() {
  return Container(
    alignment: Alignment(1.0, 0.0),
    padding: EdgeInsets.only(top: 15.0, left: 20.0),
    child: InkWell(
      child: Text(
        'Forgot Password?',
        style: TextStyle(
            color: Colors.deepPurple,
            fontFamily: 'ProximaNova',
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline),
      ),
    ),
  );
}
