import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lnt_simple_marketplace/page/auth/index.dart';
import 'package:lnt_simple_marketplace/service/auth/auth.dart';

class ProfilePage extends StatefulWidget {
  final AuthService authService;
  final User currentUser;

  const ProfilePage(
      {Key? key, required this.authService, required this.currentUser})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void handleLogout() {
    widget.authService.signOut();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => AuthPage().renderLogin())
        // MaterialPageRoute(builder: (_) => IndexPage())
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(28),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text("Hallo ${widget.currentUser.email}"),
            ElevatedButton(
              child: Text(
                "Sign Out",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: handleLogout,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            )
          ],
        ),
      )),
    );
  }
}
