import 'package:arumosum/components/colors.dart';
import 'package:arumosum/pages/homepage.dart';
import 'package:arumosum/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String userEmail;
  String userpassword;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: orrangeColor,
      appBar: new AppBar(
        backgroundColor: orrangeColor,
        title: new Text("Login"),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Container(
        padding: new EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: (screenSize.height - 120) / 2,
                child: Container(
                  child: Image.asset(
                    'images/logo.png',
                    width: (screenSize.width < 500)
                        ? 200.0
                        : (screenSize.width / 4) + 12.0,
                  ),
                ),
              ),
              Container(
                height: (screenSize.height - 120) / 2,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: _emailTextField(),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: _passwordTextField(),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      _materialButton(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have a account? "),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: new Text(
                                "Sign Up Here",
                                style: new TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.email),
        hintText: "enter email here...",
      ),
      validator: (value) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (value.isEmpty)
          return 'email cannot be empty';
        else if (!regex.hasMatch(value))
          return 'Enter Valid Email';
        else
          return null;
      },
      onSaved: (value){
        userEmail=value;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      controller: password,
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
      onSaved: (value){
        userpassword=value;
      },
    );
  }

  Widget _materialButton() {
    return MaterialButton(
      textColor: Colors.orange,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
      minWidth: MediaQuery.of(context).size.width,
      elevation: 0.0,
      onPressed: () {
        signIn();
        print(userEmail);
        print(userpassword);
      },
      color: Colors.white,
      child: Text("Log in"),
    );
  }

  Future signIn() async {
    try {
      final formState = _formKey.currentState;
       if (_formKey.currentState.validate()) {
         formState.save(); 
      final user = await _auth.signInWithEmailAndPassword(
          email:userEmail, password: userpassword);
      if (user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
      print('loged in');
       }
    } catch (e) {}

    
  }
}
