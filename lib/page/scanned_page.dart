import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScannedPage extends StatefulWidget {
  const ScannedPage({super.key});

  @override
  State<ScannedPage> createState() => _ScannedPageState();
}

class _ScannedPageState extends State<ScannedPage> {
  XFile? _image;

  getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        _image = pickedImage;
      }
      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_image != null)
                SizedBox(
                  child: Card(
                      child: Image.file(
                    File(
                      _image!.path,
                    ),
                    fit: BoxFit.cover,
                  )),
                ),
              if (_image == null)
                const SizedBox(
                  height: 350,
                ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: Text('Choose Image Source'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      getImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Camera')),
                                TextButton(
                                    onPressed: () {
                                      getImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Gallery'))
                              ],
                            );
                          }));
                    },
                    child: Text('Scan')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
