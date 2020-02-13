import 'package:castillo_ranking/Models/player.dart';
import 'package:flutter/material.dart';

class PlayerTile extends StatelessWidget {
  //Variables
  final Player player;
  PlayerTile({this.player});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            player.displayName,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          trailing: Text(
            player.position.toString(),
            style: TextStyle(color: Colors.white, fontSize: 35.0),
          ),
        ),
        Divider(
          thickness: 2.0,
        )
      ],
    );
  }
}
