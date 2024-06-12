import 'package:flutter/material.dart';


class MyTextBox extends StatelessWidget {
  final String sectionName;
  final String text;
  const MyTextBox({super.key,required this.sectionName,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      padding: EdgeInsets.only(left: 15,bottom: 15),
      margin: EdgeInsets.only(left: 15,right: 15,top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(sectionName),
          SizedBox(height: 15,),
          Text(text),

        ],
      ),
    );
  }
}
