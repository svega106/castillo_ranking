import 'package:castillo_ranking/Models/player.dart';
import 'package:castillo_ranking/Models/player_tile.dart';
import 'package:castillo_ranking/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class RankingCatC extends StatefulWidget {
  @override
  _RankingCatCState createState() => _RankingCatCState();
}

class _RankingCatCState extends State<RankingCatC> {

  //Variables
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final players = Provider.of<List<Player>>(context);

    //Initiating the variables
    players.forEach(
      (player) {
        if (player.id == user.uid) {}
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categoria C',
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),actions: <Widget>[IconButton(icon: Icon(Icons.refresh,color: Colors.white), onPressed: null)],
        backgroundColor: Colors.lightGreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.lightGreen,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.tennis),
              title: Text('Hombres'),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.tennis),
              title: Text('Mujeres'),
            ),
          ]),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(10.0)),
            height: 40.0,
            margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
            child: ListTile(
              title: Text(
                'Nombre',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              trailing: Text(
                'Posicion',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return PlayerTile(player: players[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
