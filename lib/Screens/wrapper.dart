import 'package:castillo_ranking/Models/player.dart';
import 'package:castillo_ranking/Screens/Authenticate/authenticate.dart';
import 'package:castillo_ranking/Screens/Home/admin_home.dart';
import 'package:castillo_ranking/Screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castillo_ranking/Models/user.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User>(context);

    final players = Provider.of<List<Player>>(context) ?? [];

    bool _admin = false;

    //Return home or signin() if sign or not\
    if (_user != null) {
      players.forEach((f) {
        if (f.id == _user.uid) {
          if (f.admin) {
            setState(() => _admin = true);
          } else {
            setState(() => _admin = false);
          }
        }
      });
    }
    
    if (_user != null) {
      if (_admin) {
        return AdminHome();
      } else {
        return Home();
      }
    } else {
      return Authenticate();
    }
  }
}
