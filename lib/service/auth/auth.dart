import 'package:firebase_auth/firebase_auth.dart';
import 'package:lnt_simple_marketplace/model/profile.dart';
import 'package:lnt_simple_marketplace/service/index.dart';

class AuthService extends FirebaseService {
  
  Future<User?> signIn(Map<String, String> userData) async {
    try {
      UserCredential credential = await authService().signInWithEmailAndPassword(email: userData['email'] as String, password: userData['password'] as String);
      
      return credential.user;

    } catch (e) {
      return null;
    }
  }

  Future<User?> signUp(Profile userData) async {
    try {
      UserCredential credential = await authService().createUserWithEmailAndPassword(email: userData.email as String, password: userData.password as String);

      if(credential.user == null) {
        throw Exception("Register Failed");
      }
      
      return credential.user;
    } catch (e) {
      return null;
    }
  }
}