import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image:AssetImage('assets/images/Background.png'),
              fit: BoxFit.fill
          ),
        ),
      ),
    );
  }
}