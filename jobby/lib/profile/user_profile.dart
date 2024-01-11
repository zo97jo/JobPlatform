import 'package:flutter/material.dart';
import 'package:jobby/components/app_bar.dart';


class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.origin(true),
      body: ListView(
        children: [
          Image.asset('images/login.png',fit: BoxFit.contain, width: 200, height:200,),
          TextField(
            decoration: InputDecoration(
              labelText: 'Ime'
            ),
          )
      ],
      ),
    );
  }
}

