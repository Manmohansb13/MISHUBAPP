import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices{
  //Google sign in
  static Future<User?> signInWithGoogle() async{
    //choose account
    final gUser=await GoogleSignIn().signIn();


    //authenticate
    final gAuth=await gUser?.authentication;

    //credentials

    final credential=GoogleAuthProvider.credential(
      accessToken: gAuth?.accessToken,
      idToken: gAuth?.idToken,
    );

    final userCredential=await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential.user;

  }
}