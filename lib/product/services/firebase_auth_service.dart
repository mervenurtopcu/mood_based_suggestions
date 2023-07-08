import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../global/utils.dart';

class FirebaseAuthService {
  FirebaseAuthService._();
  static FirebaseAuthService? _instance;

  User? get currentUser => auth.FirebaseAuth.instance.currentUser;

  static FirebaseAuthService? get instance {
    _instance ??= FirebaseAuthService._();
    return _instance;
  }

  final _auth = auth.FirebaseAuth.instance;

  FirebaseAuth get authInstance => _auth;

  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on auth.FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on auth.FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      Utils.showSnackBar(e.message);
    }
  }

  Future resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future verificationEmail() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on auth.FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      Utils.showSnackBar(e.message);
    }
  }

  Future emailVerified() async {
    try {
      await _auth.currentUser!.reload();
      await _auth.currentUser!.emailVerified;
    } on auth.FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      Utils.showSnackBar(e.message);
    }
  }

  Future sendEmailVerify() async {
    await _auth.currentUser!.sendEmailVerification();
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }

  Future<void> deleteAccount() async {
    await _auth.currentUser!.delete();
  }
}
