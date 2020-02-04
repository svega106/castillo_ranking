import 'package:flutter/material.dart';

Widget matchResults(double screenWidth) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10.0),
    width: screenWidth,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
    child: Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 10.0,
                    margin: EdgeInsets.only(
                        right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 10.0,
                    margin: EdgeInsets.only(
                        right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 10.0,
                    margin: EdgeInsets.only(
                        right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 10.0,
                    margin: EdgeInsets.only(
                        right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
