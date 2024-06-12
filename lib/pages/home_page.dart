import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mis_hub/pages/search_page.dart';
import 'package:mis_hub/test_server/get_test.dart';

import '../search_subjects/subjects.dart';
import '../subject_page/subject_page_file.dart';
import 'drawer.dart';


class HomePage extends StatefulWidget {
  final String userEmail;
  final String userName;
  final String photoUrl;
  const HomePage({super.key,required this.userEmail,required this.userName,required this.photoUrl});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Subjects List


  // Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final storage = new FlutterSecureStorage();

  Future<void> signOut() async {
    try {
      print('Attempting to sign out...');
      await _auth.signOut();
      print('Firebase sign-out successful');
      await _googleSignIn.signOut();
      print('Google sign-out successful');
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  Future<void> test() async {
    try {
      bool containsKey = await storage.containsKey(key: 'uuid');
      if (containsKey) {
        String? uid = await storage.read(key: 'uuid');
        print("User uid: ");
        print(uid);
      } else {
        print('Key "uuid" does not exist.');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<void> getter() async {
    try {
      bool containsKey = await storage.containsKey(key: 'uuid');
      if (containsKey) {
        String? uid = await storage.read(key: 'uuid');
        sendGetRequest(uid!);
      } else {
        print('Key "uuid" does not exist.');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5c5a5a),
        title: Text("Home"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              color: Colors.white,
             onPressed: ()=>Navigator.push(
                 context,
                 MaterialPageRoute(
                   //Route to subject Page
                     builder: (context)=>SearchPage(),
                 )
             ),
              icon: Icon(Icons.search),
            ),
          ),

        ],
      ),
      drawer: MyDrawer(signOut: signOut,drawerProfilePic: widget.photoUrl,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Displaying data
          Text(widget.userEmail),
          Text(widget.userName),
          Image.network(widget.photoUrl),
          SizedBox(height: 20,),
          TextButton(onPressed: () async{
            await test();
          }, child: Text("Get data")),
          TextButton(onPressed: () async{
            await getter();
          }, child: Text("Get All")),
        ],
      ),
    );

  }

}