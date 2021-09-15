import 'package:flutter/material.dart';

class ConstructionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unfinished"),
        backgroundColor: Colors.redAccent[100],
      ),
      body: Center(
        child: Text("Still under construction..."),
      ),
    );
  }
}
