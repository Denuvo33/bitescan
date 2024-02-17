import 'package:bitescan/page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int currentIndex = 3;
  String gender = '';
  final TextEditingController _age = TextEditingController();
  final TextEditingController _tall = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _alergiesName = TextEditingController();
  final TextEditingController _alergiesLevel = TextEditingController();
  final TextEditingController _foodRestriction = TextEditingController();

  void showDelayDialog(BuildContext ctx) async {
    var date = DateTime.now();
    var formmatedDate = DateFormat('dd MMMM y').format(date);
    var uid = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference db = FirebaseDatabase.instance.ref('users/$uid');
    showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: ((ctx) {
          return const AlertDialog(
            content: SizedBox(
              height: 100,
              child: Center(
                  child: Column(
                children: [
                  Text('Saving your Data'),
                  CircularProgressIndicator()
                ],
              )),
            ),
          );
        }));
    if (FirebaseAuth.instance.currentUser!.displayName != null) {
      await db.update({
        'weight': _weight.text,
        'height': _tall.text,
        'age': _age.text,
        'gender': gender,
        'username': FirebaseAuth.instance.currentUser!.displayName.toString(),
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'glasses': 0,
        'completeQuestion': true,
        'date': formmatedDate,
        'alergiesName': _alergiesName.text,
        'alergiesLevel': _alergiesLevel.text,
        'foodRestriction': _foodRestriction.text,
      });
    } else {
      await db.update({
        'weight': _weight.text,
        'height': _tall.text,
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'age': _age.text,
        'gender': gender,
        'glasses': 0,
        'completeQuestion': true,
        'date': formmatedDate,
        'alergiesName': _alergiesName.text,
        'alergiesLevel': _alergiesLevel.text,
        'foodRestriction': _foodRestriction.text,
      });
    }

    await Future.delayed(const Duration(seconds: 2));
    if (!ctx.mounted) return;
    Navigator.pop(ctx);
    Navigator.pushReplacement(
        ctx, MaterialPageRoute(builder: (ctx) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                const Text('Let us know your goals! Select one answer'),
                const Divider(),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                    'Please select which sex we should use to calculate your calorie needs'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              currentIndex == 1
                                  ? Colors.blueGrey
                                  : Colors.white),
                        ),
                        onPressed: () {
                          gender = 'Male';
                          setState(() {
                            currentIndex = 1;
                          });
                        },
                        child: const Text(
                          'Male',
                        )),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              currentIndex == 2
                                  ? Colors.blueGrey
                                  : Colors.white),
                        ),
                        onPressed: () {
                          gender = 'Female';
                          setState(() {
                            currentIndex = 2;
                          });
                        },
                        child: const Text(
                          'Female',
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _alergiesName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Do you have allergies? What’s name?')),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _alergiesLevel,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Your allergies level (1-5)')),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _foodRestriction,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Are there any food restrictions?')),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _age,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('How old are you?')),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _tall,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixText: 'cm',
                      label: Text('How tall are you? (cm)')),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _weight,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      suffixText: 'kg',
                      border: OutlineInputBorder(),
                      label: Text('How much do you weight? (kg)')),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_age.text.isEmpty ||
                              _tall.text.isEmpty ||
                              _weight.text.isEmpty ||
                              _alergiesLevel.text.isEmpty ||
                              _alergiesName.text.isEmpty ||
                              _foodRestriction.text.isEmpty ||
                              gender == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Fill all question')));
                          } else {
                            showDelayDialog(context);
                          }
                        },
                        child: const Text('Continue')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
