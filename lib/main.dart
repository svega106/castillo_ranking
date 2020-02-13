import 'package:castillo_ranking/Screens/Home/home.dart';
import 'package:castillo_ranking/Screens/Pages/Ranking/ranking_wrapper.dart';
import 'package:castillo_ranking/Screens/Pages/settings.dart';
import 'package:castillo_ranking/Screens/wrapper.dart';
import 'package:castillo_ranking/Services/auth.dart';
import 'package:castillo_ranking/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castillo_ranking/Models/user.dart';
import 'Models/player.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Auth(),
        routes: {
          'Home': (context) => Home(),
          'Settings': (context) => Settings(),
          'Ranking': (context) => RankingWrapper(),
        },
      ),
    );
  }
}
