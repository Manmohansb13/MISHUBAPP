import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mis_hub/components/my_text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final storage = new FlutterSecureStorage();
  String _username = '';
  String _regNo = '';
  String _imageUrl='';
//Extracting Data from API
  Future<void> getUUID() async {
    try {
      bool containsKey = await storage.containsKey(key: 'uuid');
      if (containsKey) {
        String? uid = await storage.read(key: 'uuid');
        String? u = uid?.replaceAll('"', ''); // Remove quotation marks from the UUID
        String url = "https://mis-hub-backend-git-main-amrit-sundarkas-projects.vercel.app/profile/get_profile/?user_id=$u";

        final response = await http.get(Uri.parse(url));
        //Mapping Data
        Map data = jsonDecode(response.body);
        print(data);
        _username = data['user_name'];
        _regNo = data['registration_number'];
        _imageUrl=data['profile_pic'];
        // Handle the response
        if (response.statusCode == 200) {
          print('Request successful: ${response.body}');
        } else {
          print('Request failed with status: ${response.statusCode}');
        }
      } else {
        print('Key "uuid" does not exist.');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<Map<String, String>> getDetails() async {
    await getUUID();
    return {'username': _username, 'regNo': _regNo,'photoUrl':_imageUrl};
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Profile Page"),
      ),
      body: FutureBuilder<Map<String, String>>(
        future: getDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            String student_name=snapshot.data!['username'] ?? 'No username';
            String imageURL=snapshot.data!['photoUrl']?? 'No photo';
            String sRegistrationNumber=snapshot.data!['regNo'] ?? 'No registration number';
            return ListView(
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(imageURL),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text("My Details",style: TextStyle(color: Colors.grey[600],fontSize: 20),),
                ),

                MyTextBox(sectionName: "Name:", text: student_name),
                SizedBox(height: 20,),

                MyTextBox(sectionName: "Registration Number:", text: sRegistrationNumber),

                ],
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
