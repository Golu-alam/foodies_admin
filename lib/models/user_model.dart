import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? userId;
  String? email;
  String? password;
  String? userName;
  // String? createdAt;
  String? address;
  String? userProfileImage;
  GeoPoint? location;

  UserModel({
    this.userId,
    this.email,
    this.password,
    this.userName,
    // this.createdAt,
    this.address,
    this.userProfileImage,
    this.location,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["userId"],
    email: json["email"],
    password: json["password"],
    userName: json["userName"],
    // createdAt: json["created_At"],
    address: json["address"],
    userProfileImage: json["userProfileImage"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "email": email,
    "password": password,
    "userName": userName,
    // "created_At": createdAt,
    "address": address,
    "userProfileImage": userProfileImage,
    "location": location,
  };
}
