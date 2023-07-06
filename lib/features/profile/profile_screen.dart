import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mood_based_suggestions/features/profile/profile_screen_provider.dart';
import 'package:mood_based_suggestions/product/constants/color_constants.dart';
import 'package:mood_based_suggestions/product/theme/index.dart';
import 'package:mood_based_suggestions/product/widget/button/authentication_button.dart';
import 'package:mood_based_suggestions/product/widget/text/authentication_subtitle.dart';
import 'package:mood_based_suggestions/product/widget/text/authentication_title.dart';
import 'package:mood_based_suggestions/product/widget/text_field/authentication_text_field.dart';

import '../../product/constants/padding_constants.dart';
import '../../product/constants/string_constants.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  late final  User? currentUser ;
  User? currentFirebaseUser = FirebaseAuth.instance.currentUser;
  late String _photoUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUser = ref.read(profileViewModel).user;
    _photoUrl = currentFirebaseUser?.photoURL ?? '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Center(
                    child: ref.watch(profileViewModel).loading == false
                        ? Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: _photoUrl != null && ref.watch(profileViewModel).image == null
                      //ref.watch(profileViewModel).image == null
                          ? ClipOval(
                        child: Image.network(
                          _photoUrl,
                          //ref.watch(profileViewModel).imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) =>
                              Image.asset(
                                'assets/png/user_icon.png',
                                fit: BoxFit.cover,
                              ),
                        ),
                      )
                          : ClipOval(
                        child: Image.file(
                          File(ref
                              .watch(profileViewModel)
                              .image!
                              .path),
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) =>
                              Image.asset(
                                'assets/png/user_icon.png',
                                fit: BoxFit.cover,
                              ),
                        ),
                      ),
                    )
                        : const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    ref.read(profileViewModel).pickImage(context);
                  },
                  child: const CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.add,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextButton(
              onPressed: () {
                ref.read(profileViewModel).deleteProfilePhoto(context);
              },
              child: const Text('Delete Profile Photo',style: TextStyle(color: ColorConstants.loginSubtitle),),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(currentUser?.email ?? '',style: TextStyle(color: ref.watch(settingsProvider).isDarkTheme ? ColorConstants.white : ColorConstants.black),),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Center(child: AuthButton(onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            }, text: ' Log Out', isDarkTheme: ref.watch(settingsProvider).isDarkTheme,),),

          ],
        ),
      ),
    );
  }

}

