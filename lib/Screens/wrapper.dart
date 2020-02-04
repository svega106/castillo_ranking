import 'package:cloud_firestore/cloud_firestore.dart';
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

    final jugadores = Provider.of<QuerySnapshot>(context);

    bool _admin = false;

    for (var doc in jugadores.documents) {
      if (_user != null) {
        if (doc.documentID == _user.uid) {
          if (doc.data['Admin'] == true) {
            setState(() => _admin = true);
          } else {
            setState(() => _admin = false);
          }
        }
      }
    }

    //Return home or signin() if sign or not

    if (_user == null) {
      
      return Authenticate();
    } else {
      print(_user.displayName);
      if (_admin) {
        return AdminHome();
      } else {
        return Home();
      }
    }
  }
}
