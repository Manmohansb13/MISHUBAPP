import 'package:flutter/material.dart';


class MyCard extends StatelessWidget {
  final color;
  final String title;
  const MyCard({super.key,required this.title,required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(color: Colors.white,fontSize: 70),),
          ],
        ),
      ),
    );
  }
}
