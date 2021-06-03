import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/material.dart';

class AuthenticateModel {
  final FirebaseAuth _firebaseAuth;

  AuthenticateModel(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password, BuildContext context}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      Navigator.pushNamed(context, "/");
      return "Signed in";
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password, BuildContext context}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      Navigator.pushNamed(context, "/login");
      return "Signed up";
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }

  Future<String> signOut() async {
    try{
      await _firebaseAuth.signOut();
      return "Signed out";
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }
}