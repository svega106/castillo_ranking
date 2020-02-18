import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//Loading screen widget
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}