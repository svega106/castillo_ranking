import 'package:castillo_ranking/Screens/Home/home.dart';
import 'package:castillo_ranking/Screens/Pages/Ranking/global_ranking.dart';
import 'package:castillo_ranking/Screens/Pages/settings.dart';
import 'package:castillo_ranking/Screens/wrapper.dart';
import 'package:castillo_ranking/Services/auth.dart';
import 'package:castillo_ranking/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castillo_ranking/Models/user.dart';

import 'Models/player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Player>>.value(
      value: DatabaseService().players,
          child: StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          routes: {
            'Home': (context) => Home(),
            'Settings': (context) => Settings(),
            'Ranking': (context) => GlobalRanking(),
            
          },
          home: Wrapper(),
        ),
      ),
    );
  }
}
