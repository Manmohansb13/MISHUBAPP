import 'package:flutter/material.dart';
class SquareBoxes extends StatelessWidget {
  final String imagePath;
  final double height;
  final Function()? onTap;
  const SquareBoxes({super.key,required this.imagePath,required this.height,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(imagePath,height: height,),
      ),
    );
  }
}
