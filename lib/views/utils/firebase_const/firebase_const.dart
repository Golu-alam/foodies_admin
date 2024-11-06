import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseConst{
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static String currentUser = FirebaseAuth.instance.currentUser.toString();
  static String currentUserId = FirebaseAuth.instance.currentUser!.uid;

}