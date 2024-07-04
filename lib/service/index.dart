import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuthService = FirebaseAuth.instance;
  final CollectionReference _firebaseProductService = FirebaseFirestore.instance.collection("products");

  FirebaseAuth authService() {
    return _firebaseAuthService;
  }

  CollectionReference productService() {
    return _firebaseProductService;
  }
}