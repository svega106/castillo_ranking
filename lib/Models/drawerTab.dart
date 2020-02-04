import 'package:castillo_ranking/Screens/Home/settings.dart';
import 'package:flutter/material.dart';

Widget drawerTab(String text, IconData icon, BuildContext context,String routeName) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, routeName);
    },
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.lightGreen, size: 30.0),
          SizedBox(
            width: 20.0,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.lightGreen,fontSize: 20.0),
          ),
        ],
      ),
    ),
  );
}
