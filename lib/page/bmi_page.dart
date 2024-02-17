import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _age = TextEditingController();
  var gender = 'Male';

  getGender() {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference db = FirebaseDatabase.instance.ref('users/$uid');
    db.onValue.listen((event) {
      var data = event.snapshot.value;
      if (data != null && data is Map) {
        setState(() {
          gender = data['gender'];
        });
      }
    });
  }

  showingDialogResult(height, weight, age, result) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text('Result'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
            content: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Height (cm)'),
                      Text(height),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Weight (kg)'),
                      Text(weight),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Age'),
                      Text(age),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('Your Body Weight:'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    result,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          );
        }));
  }

  calculateBMI() {
    var parseHeight = num.parse(_height.text) / 100;
    var calculate = num.parse(_weight.text) / (parseHeight * parseHeight);
    if (calculate <= 19) {
      showingDialogResult(_height.text, _weight.text, _age.text, 'UNDERWEIGHT');
    } else if (calculate <= 25) {
      showingDialogResult(_height.text, _weight.text, _age.text, 'IDEAL');
    } else if (calculate <= 30) {
      showingDialogResult(_height.text, _weight.text, _age.text, 'OVERWEIGHT');
    } else {
      showingDialogResult(_height.text, _weight.text, _age.text, 'OBESITY');
    }
  }

  @override
  void initState() {
    getGender();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text(
              gender,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _height,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Height (cm)'),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _weight,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Weight (kg)'),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _age,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Age'),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_weight.text.isNotEmpty &&
                      _age.text.isNotEmpty &&
                      _height.text.isNotEmpty) {
                    calculateBMI();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Fill all required')));
                  }
                },
                child: const Text('Calculate'))
          ],
        ),
      )),
    );
  }
}
