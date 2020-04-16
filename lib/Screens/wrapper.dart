import 'package:castillo_ranking/Models/player.dart';
import 'package:castillo_ranking/Screens/Authenticate/authenticate.dart';
import 'package:castillo_ranking/Screens/Home/admin_home.dart';
import 'package:castillo_ranking/Screens/Home/home.dart';
import 'package:castillo_ranking/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castillo_ranking/Models/user.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User>(context);

    if (_user != null) {
      return Mid();
    } else {
      return Authenticate();
    }
  }
}

class Mid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User>(context);

    return StreamProvider<Player>.value(
      value: DatabaseService(uid: _user.uid).userData,
      child: Wrapper(),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Player>(context);

    if (userData.admin) {
      return  AdminHome();
    } else {
      return Home();
    }
  }
}
