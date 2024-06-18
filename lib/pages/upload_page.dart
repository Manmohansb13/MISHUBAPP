import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import 'full_screen_image.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  List<File> _selectedImages = [];

  Future<void> pickImage(ImageSource source) async {
    try {
      final returnedImage = await ImagePicker().pickImage(source: source);
      if (returnedImage == null) return;
      setState(() {
        _selectedImages.add(File(returnedImage.path));
      });
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _showImageSourceSelection() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 120,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _openFullScreenImage(File image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImagePage(image: image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Upload"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selectedImages.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: _selectedImages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        _openFullScreenImage(_selectedImages[index]);
                      },
                      child: Image.file(
                        _selectedImages[index],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text('Image ${index + 1}'),
                  );
                },
              ),
            ) :LottieBuilder.asset("ass/upload_animation.json"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showImageSourceSelection,
        child: Icon(Icons.add),
      ),
    );
  }
}
