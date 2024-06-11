import 'package:http/http.dart' as http;
import 'dart:convert';


Future<void> fetch_Data() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    print(data);
    print("Piyush");// Do something with the data
  } else {
    print('Failed to fetch data');
  }
}