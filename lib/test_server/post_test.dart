import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendPostRequest() async {
  // Define the URL to which the POST request will be sent
  final String url = "https://mis-hub-backend-git-main-amrit-sundarkas-projects.vercel.app/profile/set_profile/";

  // Define the JSON body
  final Map<String, dynamic> requestBody = {
    "displayName": "Piyush 22MIS0041",
    "email": "piyush@gmail.com",
    "photoURL": "https://example.com/photo.jpg",
    "uid": "VcK19tm1uKXyeuARUhWmsOBARyv2",
    "metadata": {
      "creationTime": "2024-06-06T00:00:00Z",
      "lastSignInTime": "2024-06-07T00:00:00Z"
    }
  };

  // Send the POST request
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(requestBody),
  );

  // Handle the response
  if (response.statusCode == 200) {
    print('Request successful: ${response.body}');
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

