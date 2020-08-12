import 'package:flutter/material.dart';
import 'package:spp_app/services/auth.dart';
import 'package:spp_app/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final FocusNode confirmPasswordFocus = FocusNode();
  String fullname = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 125.0, 0.0, 0.0),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.fromLTRB(300.0, 125.0, 0.0, 0.0),
                            child: Text(
                              '.',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff0129ba),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 25.0),
                      child: Form(
                        key: _formKey,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                textCapitalization:
                                    TextCapitalization.characters,
                                textInputAction: TextInputAction.next,
                                validator: NameValidator.validate,
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).nextFocus(),
                                onChanged: (value) {
                                  setState(() => fullname = value);
                                },
                                style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'FULL NAME',
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
                              SizedBox(height: 20.0),
                              TextFormField(
                                textCapitalization:
                                    TextCapitalization.characters,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: EmailValidator.validate,
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).nextFocus(),
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
                              SizedBox(height: 20.0),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                /* validator: (value) => value.length < 8
                                    ? 'Password needs to be atleast 8 characters.'
                                    : null, */
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Password cannot be empty';
                                  } else if (value.length < 8) {
                                    return 'Password needs to be at least 8 characters';
                                  } else {
                                    return null;
                                  }
                                },
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(confirmPasswordFocus),
                                onChanged: (value) {
                                  setState(() => password = value);
                                },
                                decoration: InputDecoration(
                                  labelText: 'PASSWORD',
                                  labelStyle: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff0129ba)),
                                  ),
                                ),
                                obscureText: true,
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                focusNode: confirmPasswordFocus,
                                textInputAction: TextInputAction.done,
                                onChanged: (value) {
                                  setState(() => confirmPassword = value);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Field cannot be empty';
                                  } else if (value != password) {
                                    return "Passwords don't match";
                                  } else {
                                    return null;
                                  }
                                },
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).unfocus(),
                                decoration: InputDecoration(
                                  labelText: 'CONFIRM PASSWORD',
                                  labelStyle: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff0129ba)),
                                  ),
                                ),
                                obscureText: true,
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
                                        setState(() {
                                          loading = true;
                                        });
                                        dynamic result = await _auth
                                            .createUserWithEmailAndPassword(
                                                email, password, fullname);
                                        if (result == null) {
                                          setState(() {
                                            error =
                                                "Error signing up, contact administrator to solve the issue.";
                                            loading = false;
                                          });
                                        }
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        'SIGN UP',
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
                                    "Already have an account?",
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
                                      'Sign In',
                                      style: TextStyle(
                                        color: Color(0xff0129ba),
                                        fontFamily: 'ProximaNova',
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )
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
                  ],
                ),
              ),
            ),
          );
  }
}
