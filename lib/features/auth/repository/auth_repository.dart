import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook/core/constants/firebase_collection_names.dart';
import 'package:flutter_facebook/core/constants/storage_folder_names.dart';
import 'package:flutter_facebook/core/utils/utils.dart';
import 'package:flutter_facebook/features/auth/models/user.dart';

class AuthRepository {
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;

//SignIn
  Future<UserCredential?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } catch (e) {
      showToastMessage(text: e.toString());
      return null;
    }
  }

  //sign out
  Future<String?> signOut() async {
    try {
      _auth.signOut();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

//create
  Future<UserCredential?> createAccount({
    required String fullName,
    required DateTime birthday,
    required String gender,
    required String email,
    required String password,
    required File? image,
  }) async {
    try {
      //create an account in firebase
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //save image to firebase storage
      final path = _storage
          .ref(StorageFolderNames.profilePics)
          .child(FirebaseAuth.instance.currentUser!.uid);

      if (image == null) {
        return null;
      }

      final taskSnapshot = await path.putFile(image);
      final downloadUrl = await taskSnapshot.ref.getDownloadURL();

      UserModel user = UserModel(
        fullName: fullName,
        birthDay: birthday,
        gender: gender,
        email: email,
        password: password,
        profilePicUrl: downloadUrl,
        uid: FirebaseAuth.instance.currentUser!.uid,
        friends: [],
        sentRequests: [],
        receivedRequests: [],
      );

      //save user to firestore
      await _firestore
          .collection(FirebaseCollectionNames.users)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(user.toMap());

      return credential;
    } catch (e) {
      showToastMessage(text: e.toString());
      return null;
    }
  }

  Future<String?> verifyEmail(String email) async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      if (user != null) {
        user.sendEmailVerification();
      }
      return null;
    } catch (e) {
      showToastMessage(text: e.toString());
      return e.toString();
    }
  }

  //get user info
  Future<UserModel> getUserInfo() async {
    final userData = await _firestore
        .collection(FirebaseCollectionNames.users)
        .doc(_auth.currentUser!.uid)
        .get();

    final user = UserModel.fromMap(userData.data()!);
    return user;
  }
}
