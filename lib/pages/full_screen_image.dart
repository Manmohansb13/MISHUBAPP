import 'dart:io';

import 'package:flutter/material.dart';

class FullScreenImagePage extends StatelessWidget {
  final File image;
  const FullScreenImagePage({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Preview"),
      ),
      body: Center(
        child:Image.file(image),
      ),
    );
  }
}
