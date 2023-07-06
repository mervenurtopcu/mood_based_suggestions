import 'package:flutter/material.dart';

class UserModel {

  final String? uid;
  final String? email;
  final String? name;

  UserModel({
    @required this.uid,
    @required this.email,
    @required this.name,

  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
    );
  }


}