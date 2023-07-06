import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends ChangeNotifier {
  final picker = ImagePicker();
  File? _image;
  File? get image => _image;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  Future pickGalleryImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _uploadImage(context, _image!);
      notifyListeners();
    }
  }

  Future pickCameraImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _uploadImage(context, _image!);
      notifyListeners();
    }
  }

  void pickImage(context) {
    showDialog(
        context: context,
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
    final user = FirebaseAuth.instance.currentUser;
    setLoading(true);
    try {
      FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'email': user?.email ?? '',
        'uid': user?.uid ?? '',
      }).then((value) {
        print('Kullanıcı verileri başarıyla kaydedildi.');
      }).catchError((error) {
        print('Hata: $error');
      });
    } catch (e) {
      if (kDebugMode) {
        print('${e} veri kaydedilemedi');
      }
    }
    setLoading(false);
    await user?.updatePhotoURL(photoURL);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .update({'profilePhotoUrl': photoURL});
  }

  void deleteProfilePhoto(BuildContext context) async {
    setLoading(true);
    try {
      final user = FirebaseAuth.instance.currentUser;
      final storageRef = FirebaseStorage.instance.ref("userProfilePhotos");
      final profilePhotoRef = storageRef.child("${user?.uid}.jpg");
      await profilePhotoRef.delete();
      _image = null;
      _updateUserProfile(context, '');
      notifyListeners();
    } catch (e) {
      print(e.toString() + 'storage boş');
    }

    setLoading(false);
  }
}

final profileScreenProvider = ChangeNotifierProvider((ref) => ProfileViewModel());
