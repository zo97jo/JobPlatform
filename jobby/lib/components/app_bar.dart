import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.purple[100],
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
             icon: const Icon(Icons.menu, color: Colors.black,)
            )
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/userProfile');
            },
            icon: const Icon(Icons.person_3, color: Colors.black,))
        ],

    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

