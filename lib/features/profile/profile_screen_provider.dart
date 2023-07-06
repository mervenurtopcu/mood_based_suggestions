import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends ChangeNotifier {

  ProfileViewModel() {
    _init();
  }

  Future<void> _init() async {
    /// if your firebase has an authentication,
    /// you must get current user and show the profile photo if it exists in the database
     currentFirebaseUser = FirebaseAuth.instance.currentUser;
    _imageUrl= currentFirebaseUser?.photoURL ?? '';
    // _imageUrl= await FirebaseFirestore.instance
    //     .collection('User')
    //     .doc('yfeXfc0WbZjyeOIAmazV')
    //     .get()
    //     .then((value) => value.data()!['profile_photo']);
    notifyListeners();
  }

  final picker  = ImagePicker();
  File? _image;
  File? get image => _image;

  String _imageUrl ='';
  String get imageUrl => _imageUrl;

  bool _loading = false;
  bool get loading => _loading;

  User? currentFirebaseUser ;
  User? get user => currentFirebaseUser;


  setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  Future pickGalleryImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 100);

    if(pickedFile != null) {
      _image = File(pickedFile.path);
      _uploadImage(context, _image!);
      notifyListeners();
    }

  }

  Future pickCameraImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera,imageQuality: 100);

    if(pickedFile != null) {
      _image = File(pickedFile.path);
      _uploadImage(context, _image!);
      notifyListeners();
    }
  }

  void pickImage(context) {
    showDialog(context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Choose an option'),
          content: SizedBox(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    pickCameraImage(context);
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.camera),
                  title: const Text('Camera'),
                ),
                ListTile(
                  onTap: () {
                    pickGalleryImage(context);
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                ),
              ],
            ),
          ),
        ));
  }
  void _uploadImage(BuildContext context, File imageFile) async {
    setLoading(true);
    // if your firebase has an authentication, you must get current user
    final user = FirebaseAuth.instance.currentUser;
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('userProfilePhotos')
        .child('${user?.uid}.jpg');
    final uploadTask = storageRef.putFile(imageFile);
    final snapshot = await uploadTask.whenComplete(() => null);
    if (snapshot.state == TaskState.success) {
      final downloadURL = await snapshot.ref.getDownloadURL();
      _updateUserProfile(context, downloadURL);
      setLoading(false);
      notifyListeners();

    }
  }
  void _updateUserProfile(BuildContext context, String photoURL) async {
    // if your firebase has an authentication, you must get current user
    final user = FirebaseAuth.instance.currentUser;
    await user?.updatePhotoURL(photoURL);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .update({'profilePhotoUrl': photoURL});
    // await FirebaseFirestore.instance
    //     .collection('User')
    //     .doc('yfeXfc0WbZjyeOIAmazV')
    //     .update({'profile_photo': photoURL});
  }
  void deleteProfilePhoto(BuildContext context) async {
    setLoading(true);
    try {
      /// if your firebase has an authentication, you must get current user
      final user = FirebaseAuth.instance.currentUser;
      final storageRef = FirebaseStorage.instance.ref("userProfilePhotos");
      final profilePhotoRef = storageRef.child("${user?.uid}.jpg");
      // final storageRef = FirebaseStorage.instance.ref();
      // final profilePhotoRef = storageRef.child("profile_photo.jpg");
      await profilePhotoRef.delete();
      _image = null;
      _updateUserProfile(context, '');
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('${e}storage boş');
      }
    }
    setLoading(false);


  }




  // void saveUserData({String? name, String? email, String? uid}) {
  //   setLoading(true);
  //   try {
  //     FirebaseFirestore.instance.collection('users').doc(uid).set({
  //       'email': email ?? '',
  //       'uid': uid,
  //     }).then((value) {
  //       print('Kullanıcı verileri başarıyla kaydedildi.');
  //     }).catchError((error) {
  //       print('Hata: $error');
  //     });
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('${e} veri kaydedilemedi');
  //     }
  //   }
  //   setLoading(false);
  // }

}
final profileViewModel =
ChangeNotifierProvider((ref) => ProfileViewModel());