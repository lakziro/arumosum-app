import 'package:arumosum/components/colors.dart';
import 'package:arumosum/pages/login.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: orrangeColor,
        appBar: new AppBar(
          title: new Text("Sign Up"),
          backgroundColor: orrangeColor,
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36.0, 8.0, 36.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextFormField(
                          // isPassword: false,
                          //controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.email),
                            hintText: "enter email here...",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value))
                                return 'Enter Valid Email';
                              else
                                return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36.0, 8.0, 36.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextFormField(
                          // isPassword: false,
                          //controller: email,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.person),
                            hintText: "enter full name here...",
                          ),
                          validator: (value) {
                            if (value.length < 5) {
                              return 'Enter Valid Name';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36.0, 8.0, 36.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextFormField(
                          // isPassword: false,
                          //controller: email,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.phone),
                            hintText: "enter phone number here...",
                          ),
                          validator: (value) {
                            Pattern pattern =
                                r'^(?:[+0]9)?[0-9]{10}$';
                            RegExp regex = new RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return 'Enter Valid Phone Number';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36.0, 8.0, 36.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextFormField(
                          // isPassword: false,
                          controller: passwordTextController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.lock),
                            hintText: "enter pasword here...",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "password required";
                            } else if (value.length < 6) {
                              return "the password has to be at least 6 characters";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36.0, 8.0, 36.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextFormField(
                          // isPassword: false,
                          // controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.lock),
                            hintText: "re-enter pasword here...",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "password required";
                            } else if (value.length < 6) {
                              return "the password has to be at least 6 characters";
                            } else if (passwordTextController.text != value) {
                              return "the password not match";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36.0),
                    child: MaterialButton(
                      textColor: Colors.orange,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      minWidth: MediaQuery.of(context).size.width,
                      elevation: 0.0,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }
                        return null;
                      },
                      color: Colors.white,
                      child: Text("Log in"),
                    ),
                  ),
                       Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Alredy signed in? "),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (context) =>LogIn()));
                            },
                            child: new Text(
                              "Log In Here",
                              style: new TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ],
          ),
        ));
  }
}
