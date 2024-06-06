import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const MyListTile({super.key,required this.icon,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        leading: Icon(
          icon,
        ),
        title: Text(title),
      ),
    );
  }
}
