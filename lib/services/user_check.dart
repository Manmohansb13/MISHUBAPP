import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/login.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              //Data retriveal
              User user = snapshot.data!;
              String email = user.email!;
              String name = user.displayName ?? 'No Name';
              String photoUrl = user.photoURL!;
              
              return HomePage(userEmail: email, userName: name, photoUrl: photoUrl);
            } else {
              return const LogIn();
            }
          }

          // While waiting for the stream to connect, show a loading indicator
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
