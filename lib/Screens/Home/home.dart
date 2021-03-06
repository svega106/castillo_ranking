import 'package:castillo_ranking/Models/drawerTab.dart';
import 'package:castillo_ranking/Models/match_results.dart';
import 'package:castillo_ranking/Models/player.dart';
import 'package:castillo_ranking/Models/user.dart';
import 'package:castillo_ranking/Services/auth.dart';
import 'package:castillo_ranking/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User>(context);
    final userData = Provider.of<Player>(context);

    double screenWidth = MediaQuery.of(context).size.width - 60;
    double screenHeight = MediaQuery.of(context).size.height;

    return StreamProvider<List<Player>>.value(
      value: DatabaseService().playerList,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    right: 20.0, left: 20.0, bottom: 0.0, top: 50.0),
                child: Icon(
                  Icons.person,
                  size: 50.0,
                  color: Colors.green,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(
                    right: 20.0, left: 20.0, bottom: 0.0, top: 0.0),
                title: Text(
                  userData.displayName,
                  style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  _user.email,
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.lightGreen,
                indent: 16.0,
                endIndent: 16.0,
              ),
              drawerTab('Inicio', Icons.home, context, 'Home'),
              drawerTab(
                  'Ranking Global', Icons.blur_circular, context, 'Ranking'),
              drawerTab('Llaves de Torneo', Icons.vpn_key, context, 'Settings')
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.lightGreen,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.white,
              onPressed: () async => await _auth.signOut(),
            )
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.lightGreen,
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: screenHeight / 10.0,
                  width: screenWidth,
                  child: Text(
                    'Marcadores\nRecientes',
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: PageController(viewportFraction: 1),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: <Widget>[
                      //TODO Meter los nombres de los jugadores sacados de la base de datos
                      matchResults(),
                      matchResults(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  //TODO Meter los partidos proximos
                  child: Container(
                    width: screenWidth,
                    height: screenHeight / 10,
                    child: Text(
                      'Proximos\nPartidos',
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: screenWidth,
                    height: screenHeight / 5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
