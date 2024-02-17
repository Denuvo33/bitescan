import 'package:bitescan/model/food_rec_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class GainWeightPage extends StatefulWidget {
  const GainWeightPage({super.key});

  @override
  State<GainWeightPage> createState() => _GainWeightPageState();
}

class _GainWeightPageState extends State<GainWeightPage> {
  List<FoodRecModel> foodList = [];
  bool showList = false;

  void getData() async {
    DatabaseReference db =
        FirebaseDatabase.instance.ref('foodRecommended/gainWeight');
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
      appBar: AppBar(title: const Text('Gain Weight')),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Visibility(
          visible: showList,
          replacement: const Center(child: CircularProgressIndicator()),
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
