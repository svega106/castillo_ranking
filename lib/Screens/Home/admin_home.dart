import 'package:castillo_ranking/Services/auth.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  var currentTime = DateTime.now();

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: () => _auth.signOut(),
      ),
    );
  }
}