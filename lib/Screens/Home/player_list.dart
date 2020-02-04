import 'package:castillo_ranking/Models/player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerList extends StatefulWidget {
  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  @override
  Widget build(BuildContext context) {

    final jugadores = Provider.of<List<Players>>(context) ?? [];
    jugadores.forEach((f) {
      print(f.displayName);
      print(f.socio);
      print(f.position);
    });
  return Container();
    
  }
}