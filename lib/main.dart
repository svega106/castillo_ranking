import 'package:castillo_ranking/Screens/Home/home.dart';
import 'package:castillo_ranking/Screens/Home/settings.dart';
import 'package:castillo_ranking/Screens/wrapper.dart';
import 'package:castillo_ranking/Services/auth.dart';
import 'package:castillo_ranking/Services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castillo_ranking/Models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().players,
          child: StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          routes: {
            'Home': (context) => Home(),
            'Settings': (context) => Settings(),
            
          },
          home: Wrapper(),
        ),
      ),
    );
  }
}