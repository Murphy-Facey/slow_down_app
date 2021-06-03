import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:slow_down_app/models/authentication_model.dart';
import 'package:slow_down_app/ui/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    TextStyle setUpFonts({fntSize: 16.0, clr: Colors.black, fntWeight: FontWeight.w400, ltrSpacing: 0.0}) {
      return TextStyle(
        fontFamily: "Montserrat",
        fontSize: fntSize,
        fontWeight: fntWeight,
        color: clr,
        letterSpacing: ltrSpacing
      );
    }

    OutlineInputBorder setUpBorder({clr: Colors.red, t: 0.0, b: 0.0}){
      return OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: clr),
        borderRadius: BorderRadius.vertical(top: Radius.circular(t), bottom: Radius.circular(b))
      );
    }

    void navigateToLogInScreen() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: <Widget>[
              Spacer(),
              if(MediaQuery.of(context).viewInsets.bottom == 0)
                Image.asset(
                  "assets/images/logo.png",
                  height: 190.0,
                  fit: BoxFit.contain,
                ),
              Spacer(),
              Text(
                "SIGN UP",
                style: setUpFonts(
                  fntSize: 24.0,
                  fntWeight: FontWeight.w700,
                  ltrSpacing: 2.0
                ),
              ),
              Container(
                width: 50.0,
                height: 5.0,
                margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.red
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          prefixIcon: Icon(
                              Icons.face,
                              color: Colors.red,
                              size: 25.0
                          ),
                          hintText: "Full Name",
                          hintStyle: setUpFonts(),
                          enabledBorder: setUpBorder(clr: Colors.grey[300], t: 15.0),
                          focusedBorder: setUpBorder(clr: Colors.red, t: 15.0)
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          prefixIcon: Icon(
                              Icons.account_circle_outlined,
                              color: Colors.red,
                              size: 25.0
                          ),
                          hintText: "Email",
                          hintStyle: setUpFonts(),
                          enabledBorder: setUpBorder(clr: Colors.grey[300]),
                          focusedBorder: setUpBorder(clr: Colors.red),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          prefixIcon: Icon(
                            Icons.lock_open_outlined,
                            color: Colors.red,
                            size: 25.0,
                          ),
                          hintText: "Password",
                          hintStyle: setUpFonts(),
                          enabledBorder: setUpBorder(clr: Colors.grey[300], b: 15.0),
                          focusedBorder: setUpBorder(clr: Colors.red, b: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  bottom: 15.0
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: (){
                        context.read<AuthenticateModel>().signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            context: context
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 15.0),),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)))
                      ),
                      child: Text(
                        "Sign Up",
                        style: setUpFonts(
                            clr: Colors.white,
                            fntSize: 16.0,
                            fntWeight: FontWeight.w700
                        ),
                      )
                  ),
                ),
              ),
              if(MediaQuery.of(context).viewInsets.bottom == 0)
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account? ",
                        style: setUpFonts(fntSize: 14.0),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateToLogInScreen();
                        },
                        child: Text(
                          "Sign In",
                          style: setUpFonts(
                              clr: Colors.red[600],
                              fntSize: 14.0,
                              fntWeight: FontWeight.w700
                          ),
                        )
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      )
    );
  }
}