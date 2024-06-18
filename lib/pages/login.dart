import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:mis_hub/components/square_boxes.dart';
import 'package:mis_hub/rest_api.dart';
import 'package:mis_hub/services/http_post.dart';
import 'package:mis_hub/services/sign_in.dart';
import 'package:mis_hub/test_server/post_test.dart';
import 'home_page.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}
class _LogInState extends State<LogIn> {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();



  //Sign In
  void onTap() async{
    showDialog(
        context: context,
        builder: (context)=>Center(
          child: CircularProgressIndicator(),
        ),
    );
    try {
      final user=await AuthServices.signInWithGoogle();
      if(user!=null){
        //Retriveing data
        final userEmail=user.email!;
        final userName=user.displayName!;
        final imageUrl=user.photoURL!;
        //Test post
        // sendPostRequest();

        //Passing the user ----

        String? uuid=await postProfile(user);
        print(uuid);
        if (uuid != null) {
          await _secureStorage.write(key: 'uuid', value: uuid);
          print("Secure storage success");
        }



        if(context.mounted){
          Navigator.pop(context);
        }
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context)=>HomePage(
                  userEmail: userEmail,
                  userName: userName,
                  photoUrl: imageUrl,
                )));
      }
    } on FirebaseAuthException catch(e){
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }
  void displayMessage(String message){
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text(message.toUpperCase()),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3d3a3a),
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            LottieBuilder.asset("ass/Animation - 1717558793889.json"),
            SquareBoxes(
                imagePath: "ass/google.png",
                height: 40,
                onTap:onTap
            ),
            SizedBox(height: 20,),
            Text(
              "Sign In with Google",
              style: TextStyle(
                fontFamily: 'Oswald',
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}