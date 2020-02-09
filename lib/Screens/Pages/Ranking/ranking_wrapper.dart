import 'package:flutter/material.dart';

class RankingWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Ranking Global'),
      ),
      body: Row(
        children: <Widget>[
          ListTile(
            title: Text('Categoria A'),
            trailing: Icon(Icons.arrow_right),
          )
        ],
      ),
    );
  }
}
