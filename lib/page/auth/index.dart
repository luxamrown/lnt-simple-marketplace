import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lnt_simple_marketplace/page/auth/login/index.dart';
import 'package:lnt_simple_marketplace/page/auth/profile/index.dart';
import 'package:lnt_simple_marketplace/page/auth/register/index.dart';
import 'package:lnt_simple_marketplace/service/auth/auth.dart';

class AuthPage {
  final authService = AuthService();
  Widget renderLogin() {
    return LoginPage(authService: authService);
  }

  Widget renderRegister() {
    return RegisterPage(authService: authService);
  }

  Widget renderProfile() {
    final currentUser = authService.getCurrentUser();

    return FutureBuilder(future: authService.getCurrentUser(), builder: (context, snapshot) {
      if(!snapshot.hasData) return CircularProgressIndicator();

      return ProfilePage(authService: authService, currentUser: snapshot.data!);
    });

  }
}