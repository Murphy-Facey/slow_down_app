import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:slow_down_app/models/authentication_model.dart';
import 'package:slow_down_app/ui/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void navigateToSignUpScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: <Widget>[
                Spacer(),
                if (MediaQuery.of(context).viewInsets.bottom == 0)
                  Image.asset(
                    "assets/images/logo.png",
                    height: 190.0,
                    fit: BoxFit.contain,
                  ),
                Spacer(),
                Text(
                  "LOGIN",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                      letterSpacing: 2.0),
                ),
                Container(
                  width: 50.0,
                  height: 5.0,
                  margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.red),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 15.0),
                            prefixIcon: Icon(Icons.account_circle_outlined,
                                color: Colors.red, size: 25.0),
                            hintText: "Email",
                            hintStyle: TextStyle(
                                fontFamily: "Montserrat", fontSize: 16.0),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.grey[300]),
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15.0))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.5, color: Colors.red),
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15.0)))),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 15.0),
                            prefixIcon: Icon(
                              Icons.lock_open_outlined,
                              color: Colors.red,
                              size: 25.0,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontFamily: "Montserrat", fontSize: 16.0),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.grey[300]),
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(15.0))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.5, color: Colors.red),
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(15.0)))),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          context.read<AuthenticateModel>().signIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              context: context);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(vertical: 15.0)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(15.0)))),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account? ",
                        style:
                            TextStyle(fontFamily: "Montserrat", fontSize: 14.0),
                      ),
                      GestureDetector(
                          onTap: () {
                            navigateToSignUpScreen();
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.red[600],
                                fontFamily: "Montserrat",
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
