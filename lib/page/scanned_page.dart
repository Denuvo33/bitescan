import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ScannedPage extends StatefulWidget {
  const ScannedPage({super.key});

  @override
  State<ScannedPage> createState() => _ScannedPageState();
}

class _ScannedPageState extends State<ScannedPage> {
  XFile? _image;
  List? _result;

  getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        _image = pickedImage;
        var recognitions = await Tflite.runModelOnImage(
            path: _image!.path, // required
            imageMean: 0.0, // defaults to 117.0
            imageStd: 255.0, // defaults to 1.0
            numResults: 2, // defaults to 5
            threshold: 0.2, // defaults to 0.1
            asynch: true // defaults to true
            );
        _result = recognitions;
      }
      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Map<String, dynamic> extractFruitAndNutrition(String label) {
    List<String> parts = label.split('(');
    String fruit = parts[0].trim();
    String nutritionPart = parts[1].replaceAll(')', '').trim();
    List<String> nutritionValues = nutritionPart.split(',');
    String calories = nutritionValues[0].trim();
    String fat = nutritionValues[1].trim();
    String carbs = nutritionValues[2].trim();
    String protein = nutritionValues[3].trim();
    return {
      'fruit': fruit,
      'calories': calories,
      'fat': fat,
      'carbs': carbs,
      'protein': protein,
    };
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
  }

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    Tflite.close();
    // TODO: implement dispose
    super.dispose();
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
                Image.file(
                  File(
                    _image!.path,
                  ),
                  fit: BoxFit.cover,
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
                              title: const Text('Choose Image Source'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      getImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Camera')),
                                TextButton(
                                    onPressed: () {
                                      getImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Gallery'))
                              ],
                            );
                          }));
                    },
                    child: const Text('Scan')),
              ),
              const SizedBox(
                height: 20,
              ),
              if (_result != null)
                Column(
                  children: _result!.map((result) {
                    String label = result['label'];
                    Map<String, dynamic> fruitAndNutrition =
                        extractFruitAndNutrition(label);
                    return Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 70,
                          child: Card(
                            child: Center(
                              child: Text(
                                fruitAndNutrition['fruit'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                        ), // Widget to display fruit name
                        Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                              height: 60,
                              child: Card(
                                child: Center(
                                  child: Text(
                                    fruitAndNutrition['calories'],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                                child: SizedBox(
                              height: 60,
                              child: Card(
                                child: Center(
                                  child: Text(
                                    fruitAndNutrition['carbs'],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                              height: 60,
                              child: Card(
                                child: Center(
                                  child: Text(
                                    fruitAndNutrition['fat'],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                                child: SizedBox(
                              height: 60,
                              child: Card(
                                child: Center(
                                  child: Text(
                                    fruitAndNutrition['protein'],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ))
                          ],
                        )
                      ],
                    );
                  }).toList(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
