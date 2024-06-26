import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


Future<String?> postProfile(User user) async{

  final url=Uri.parse("https://mis-hub-backend-git-main-amrit-sundarkas-projects.vercel.app/profile/set_profile/");
  final response=await http.post(url,
  headers: {
    'Content-Type':'application/json'
  },
    body: json.encode({
      'displayName':user.displayName,
      "email":user.email,
      "photoURL":user.photoURL,
      "uid":user.uid,
      "metadata":{
        'creationTime':user.metadata.creationTime.toString(),
        'lastSignInTime':user.metadata.lastSignInTime.toString(),
      }
    })

  );
  if(response.statusCode==200){
    print("Profile Set successfully");
    String uuid=response.body;
    print(response.body);
    return uuid;

  }
  else{
    print('Failed to set profile: ${response.body}');
  }

}