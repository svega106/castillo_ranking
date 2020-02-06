import 'package:flutter/material.dart';

Widget matchResults() {
  return Column(
    children: <Widget>[
      Expanded(
        child: Divider(
          indent: 30.0,
          endIndent: 30.0,
          height: 0.5,
          thickness: 3,
          color: Colors.white,
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 30.0, left: 30.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Text(
                    'Sebastian Vega',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    '6  4  3',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 30.0, left: 30.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Text(
                    'Sebastian Vega',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    '6  4  3',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Divider(
          indent: 30.0,
          endIndent: 30.0,
          height: 0.5,
          thickness: 3,
          color: Colors.white,
        ),
      ),
    ],
  );
}
