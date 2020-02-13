import 'package:castillo_ranking/Screens/Pages/Ranking/ranking_cat_C.dart';
import 'package:flutter/material.dart';

class RankingWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Ranking Global'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: Colors.lightGreen,
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                title: Text('Categoria A'),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: Colors.lightGreen,
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                title: Text('Categoria C'),
                trailing: Icon(Icons.arrow_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RankingCatC(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
