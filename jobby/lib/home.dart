import 'package:flutter/material.dart';



class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ovo je home page",)),
      body: ListView(
        children: [
          Center(child: Text("Ide gass")),
          Icon(Icons.oil_barrel)
        ]  
      )
    );
  }
}