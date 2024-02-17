import 'package:bitescan/model/food_rec_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class LoseWeightPage extends StatefulWidget {
  const LoseWeightPage({super.key});

  @override
  State<LoseWeightPage> createState() => _LoseWeightPageState();
}

class _LoseWeightPageState extends State<LoseWeightPage> {
  List<FoodRecModel> foodList = [];
  bool showList = false;
  void getData() {
    DatabaseReference db =
        FirebaseDatabase.instance.ref('foodRecommended/loseWeight');
    db.onValue.listen((event) {
      var data = event.snapshot.value;
      foodList = [];
      if (data != null && data is Map) {
        data.forEach(
          (key, value) {
            var cal = value['cal'];
            var name = value['name'];
            setState(() {
              foodList.add(FoodRecModel(cal: cal, name: name));
            });
          },
        );
        setState(() {
          showList = true;
        });
      }
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lose Weight')),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Visibility(
          visible: showList,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
            itemCount: foodList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(foodList[index].name.toString()),
                    subtitle: Text('${foodList[index].cal} cal'),
                  ),
                  const Divider(
                    color: Colors.black,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
