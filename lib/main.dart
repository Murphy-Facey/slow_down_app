import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:provider/provider.dart";
import 'package:slow_down_app/models/authentication_model.dart';
import 'package:slow_down_app/ui/dashboard_screen.dart';


import 'package:slow_down_app/ui/home_screen.dart';
import 'package:slow_down_app/ui/login_screen.dart';
import 'package:slow_down_app/ui/sign_up_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final firebaseUser = context.watch<User>();
    return MultiProvider(
      providers: [
        Provider<AuthenticateModel>(
          create: (_) => AuthenticateModel(FirebaseAuth.instance),
        ),
        StreamProvider(
          initialData: null,
          create: (context) => context.read<AuthenticateModel>().authStateChanges
        )
      ],
      child: MaterialApp(
        title: "Slow dung",
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        initialRoute: "/dashboard",
        routes: {
          "/": (context) => HomeScreen(),
          "/login": (context) => LoginScreen(),
          "/signup": (context) => SignUpScreen(),
          "/dashboard": (context) => DashboardScreen()
        },
      )
    );
  }
}

