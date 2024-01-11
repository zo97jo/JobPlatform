import 'package:flutter/material.dart';
import 'package:jobby/components/app_bar.dart';



class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Center(child: Text("Ide gass")),
          Icon(Icons.gas_meter_outlined)
        ]  
      )
    );
  }
}