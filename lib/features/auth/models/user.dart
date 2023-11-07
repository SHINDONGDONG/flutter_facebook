// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_facebook/core/constants/firebase_filed_names.dart';

@immutable
class UserModel {
  final String fullName;
  final DateTime birthDay;
  final String gender;
  final String email;
  final String password;
  final String profilePicUrl;
  final String uid;
  final List<String> friends;
  final List<String> sentRequests;
  final List<String> receivedRequests;

  UserModel(
      {required this.fullName,
      required this.birthDay,
      required this.gender,
      required this.email,
      required this.password,
      required this.profilePicUrl,
      required this.uid,
      required this.friends,
      required this.sentRequests,
      required this.receivedRequests});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FirebaseFieldNames.fullName: fullName,
      FirebaseFieldNames.birthDay: birthDay.millisecondsSinceEpoch,
      FirebaseFieldNames.gender: gender,
      FirebaseFieldNames.email: email,
      FirebaseFieldNames.password: password,
      FirebaseFieldNames.profilePicUrl: profilePicUrl,
      FirebaseFieldNames.uid: uid,
      FirebaseFieldNames.friends: friends,
      FirebaseFieldNames.sentRequests: sentRequests,
      FirebaseFieldNames.receivedRequests: receivedRequests,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: [FirebaseFieldNames.fullName] as String,
      birthDay: DateTime.fromMillisecondsSinceEpoch(
          map[FirebaseFieldNames.birthDay] as int),
      gender: [FirebaseFieldNames.gender] as String,
      email: [FirebaseFieldNames.email] as String,
      password: [FirebaseFieldNames.password] as String,
      profilePicUrl: [FirebaseFieldNames.profilePicUrl] as String,
      uid: [FirebaseFieldNames.uid] as String,
      friends:
          List<String>.from((map[FirebaseFieldNames.friends] as List<String>)),
      sentRequests: List<String>.from(
          (map[FirebaseFieldNames.sentRequests] as List<String>)),
      receivedRequests: List<String>.from(
          (map[FirebaseFieldNames.receivedRequests] as List<String>)),
    );
  }
}
