import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

Future<void> sendGetRequest(String uuid) async {
  // Define the URL with the user ID parameter
  print(uuid);
  String u = uuid.replaceAll('"', ''); // Remove quotation marks from the UUID
  String url = "https://mis-hub-backend-git-main-amrit-sundarkas-projects.vercel.app/profile/get_profile/?user_id=$u";
  print("URL: $url");

  final response = await http.get(Uri.parse(url));

  // Handle the response
  if (response.statusCode == 200) {
    print('Request successful: ${response.body}');
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

