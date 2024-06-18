import 'package:flutter/material.dart';
import 'package:mis_hub/pages/profile_page.dart';
import 'package:mis_hub/pages/search_page.dart';
import 'package:mis_hub/pages/upload_page.dart';

import '../components/list_tile.dart';


class MyDrawer extends StatelessWidget {
  final String drawerProfilePic;
  final void Function()? signOut;
  const MyDrawer({super.key,required this.signOut,required this.drawerProfilePic});

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
                        // Icon(Icons.person,size: 75,),
                        CircleAvatar(
                            backgroundImage: NetworkImage(drawerProfilePic),
                          radius: 40,
                        ),
                        SizedBox(height: 10,),
                        Text("M I S-H U B"),
                      ],
                    ),
                  )
              ),
              MyListTile(icon: Icons.home,title: "H O M E",onTap: ()=>Navigator.pop(context),),
              MyListTile(
                  icon: Icons.search,
                  title: "E X P L O R E",
              onTap:()=>Navigator.push(
                  context,
                MaterialPageRoute(builder: (context)=>SearchPage()),
              ),
              ),
              MyListTile(icon: Icons.history, title: "H I S T O R Y",onTap: (){},),
              MyListTile(
                icon: Icons.upload, title:"U P L O A D",
                onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>UploadPage())),
              ),
              MyListTile(icon: Icons.person, title: "P R O F I L E",onTap: ()=>Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>ProfilePage()),
              ),),
              MyListTile(icon: Icons.info, title: "A B O U T",onTap: (){},),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: MyListTile(icon: Icons.logout, title: "L O G  O U T",onTap: signOut,),
          ),
        ],
      ),
    );
  }
}
