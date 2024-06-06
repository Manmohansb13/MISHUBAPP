import 'package:flutter/material.dart';

import '../components/list_tile.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff3a8dff),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Icon(Icons.person,size: 75,),
                        SizedBox(height: 10,),
                        Text("M I S-H U B"),
                      ],
                    ),
                  )
              ),
              MyListTile(icon: Icons.home,title: "H O M E",),
              MyListTile(icon: Icons.search, title: "B R O W S E"),
              MyListTile(icon: Icons.history, title: "H I S T O R Y"),
              MyListTile(icon: Icons.info, title: "A B O U T"),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: MyListTile(icon: Icons.logout, title: "L O G  O U T"),
          ),
        ],
      ),
    );
  }
}
