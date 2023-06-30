// import 'package:firebase_auth/firebase_auth.dart' as auth;
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'package:flutter/material.dart';
// import 'package:mood_based_suggestions/product/constants/index.dart';
//
// import '../global/utils.dart';
//
// class FirebaseService {
//
//   FirebaseService._();
//   static FirebaseService? _instance;
//
//
//    User? get currentUser => auth.FirebaseAuth.instance.currentUser;
//
//   static FirebaseService? get instance {
//     _instance ??= FirebaseService._();
//     return _instance;
//   }
//
//   final _auth = auth.FirebaseAuth.instance;
//
//   FirebaseAuth get authInstance => _auth;
//
//   Future logIn(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//     } on auth.FirebaseAuthException catch (e) {
//      Utils.showSnackBar(e.message);
//     }
//
//   }
//   Future signUp(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } on auth.FirebaseAuthException
//      catch (e) {
//       debugPrint(e.toString());
//       Utils.showSnackBar( e.message);
//     }
//   }
//
//   Future resetPassword(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//       Utils.showSnackBar(StringConstants.utilsSnackBarText);
//     } on auth.FirebaseAuthException catch (e) {
//       debugPrint(e.toString());
//       Utils.showSnackBar( e.message);
//     }
//   }
//
//   Future verificationEmail() async {
//     try {
//       await _auth.currentUser!.sendEmailVerification();
//     } on auth.FirebaseAuthException catch (e) {
//       debugPrint(e.toString());
//       Utils.showSnackBar( e.message);
//     }
//   }
//   Future emailVerified() async {
//     try {
//       await _auth.currentUser!.reload();
//       await _auth.currentUser!.emailVerified;
//     } on auth.FirebaseAuthException catch (e) {
//       debugPrint(e.toString());
//       Utils.showSnackBar( e.message);
//     }
//   }
//
//   Future<void> logOut() async {
//     await _auth.signOut();
//   }
//
// }
