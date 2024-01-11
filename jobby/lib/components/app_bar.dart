import 'package:flutter/material.dart';


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {

  bool isOnProfilePage = false;

  CustomAppBar({super.key});

    
  CustomAppBar.origin(bool isOnProfilePage){
    this.isOnProfilePage = isOnProfilePage;
  }
  
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {


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
          if(!widget.isOnProfilePage)...<Widget>[
            IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/userProfile');
              },
              icon: const Icon(Icons.person_3, color: Colors.black,))
          ]
          
        ],

    );
  }

}

