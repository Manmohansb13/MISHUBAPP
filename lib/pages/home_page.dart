import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5c5a5a),
        title: Text("Home"),
      ),
      drawer: MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Displaying data
          Text(widget.userEmail),
          Text(widget.userName),
          Image.network(widget.photoUrl),

          TextButton(onPressed: signOut, child: Text("Sign Out")),
        ],
      ),
    );
  }
}