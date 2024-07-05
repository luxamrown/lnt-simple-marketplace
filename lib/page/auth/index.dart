import 'package:flutter/material.dart';
import 'package:lnt_simple_marketplace/page/auth/login/index.dart';
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
}