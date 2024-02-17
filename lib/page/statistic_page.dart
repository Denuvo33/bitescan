import 'package:bitescan/model/glasses_consumed.dart';
import 'package:bitescan/page/meals_page.dart';
import 'package:bitescan/page/question_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  List<GlassConsumed> listGlassed = [];
  var uid = FirebaseAuth.instance.currentUser!.uid;
  final TextEditingController _editValue = TextEditingController();
  DatabaseReference? dbGlasses;
  var glassesConsumed = 0;
  var date = DateTime.now();
  var formmatedDate = '';
  var ml = 0;
  var height = '';
  var weight = '';
  var sleep = '';
  var currentIndex = 0;
  var walking = '';
  String goals = '0';
  String calories = '0';
  String exerciesCal = '0';
  String exerciseHours = '1';
  String sleepTime = '9';
  String napTime = '0';
  String wakeUpTime = '6';

  showEditStatisticDialog(title, String suffixText) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text('Edit $title'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    switch (currentIndex) {
                      case 0:
                        {
                          setState(() {
                            goals = _editValue.text;
                          });
                        }
                        break;
                      case 1:
                        {
                          setState(() {
                            calories = _editValue.text;
                          });
                        }
                        break;
                      case 2:
                        {
                          setState(() {
                            exerciesCal = _editValue.text;
                          });
                        }
                        break;
                      case 3:
                        {
                          setState(() {
                            exerciseHours = _editValue.text;
                          });
                        }
                        break;
                      case 4:
                        {
                          setState(() {
                            sleepTime = _editValue.text;
                          });
                        }
                        break;
                      case 5:
                        {
                          setState(() {
                            napTime = _editValue.text;
                          });
                        }
                        break;
                      case 6:
                        {
                          setState(() {
                            wakeUpTime = _editValue.text;
                          });
                        }
                        break;
                      case 7:
                        {
                          setState(() {
                            height = _editValue.text;
                          });
                        }
                        break;
                      case 8:
                        {
                          setState(() {
                            weight = _editValue.text;
                          });
                        }
                        break;
                      case 9:
                        {
                          setState(() {
                            sleep = _editValue.text;
                          });
                        }
                        break;
                      case 10:
                        {
                          setState(() {
                            walking = _editValue.text;
                          });
                        }
                        break;
                    }
                    Navigator.pop(context);
                    _editValue.clear();
                  },
                  child: const Text('Edit'))
            ],
            content: SizedBox(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _editValue,
                  decoration: InputDecoration(
                      suffixText: suffixText,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10)),
                )),
          );
        }));
  }

  getData() async {
    dbGlasses = FirebaseDatabase.instance.ref('users/$uid');
    setState(() {
      formmatedDate = DateFormat('dd MMMM y').format(date);
    });

    dbGlasses!.onValue.listen((event) {
      var data = event.snapshot.value;
      if (data != null && data is Map) {
        var glasses = data['glasses'];
        sleep = data['sleepLong'] ?? '8';
        weight = data['weight'];
        height = data['height'];
        walking = data['walking'] ?? '1';

        listGlassed = [];

        if (glasses == null) {
          dbGlasses!.update({'glasses': 0});

          glassesConsumed = glasses;
        } else {
          glassesConsumed = glasses;

          for (int i = 0; i < 8; i++) {
            if (i < glassesConsumed) {
              listGlassed.add(GlassConsumed(drinked: true));
            } else {
              listGlassed.add(GlassConsumed(drinked: false));
            }
          }
        }
        if (mounted) {
          setState(() {});
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => const QuestionPage()));
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Statistic'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'Today,$formmatedDate',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                color: const Color.fromARGB(255, 68, 237, 243),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Goals',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('images/Goal.png'),
                              Text(
                                'Goals \n$goals cal',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  currentIndex = 0;
                                  showEditStatisticDialog('Goals', 'cal');
                                },
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('images/calories.png'),
                              Text(
                                'Calories \n$calories cal',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  currentIndex = 1;
                                  showEditStatisticDialog('Calories', 'cal');
                                },
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('images/Exercise.png'),
                              Text(
                                'Exercice \n$exerciesCal cal',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  currentIndex = 2;
                                  showEditStatisticDialog(
                                      'Exercise Cal', 'cal');
                                },
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                color: const Color.fromARGB(255, 68, 237, 243),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Exercise: $exerciseHours hrs',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            currentIndex = 3;
                            showEditStatisticDialog('Exercise hrs', 'hrs');
                          },
                          child: const Text('Edit'))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                color: const Color.fromARGB(255, 68, 237, 243),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  //  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Water Intake',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Recomended 8 glasses/ 2 liter',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('$glassesConsumed of 8 glasses consumed'),
                      Text('${ml = 250 * glassesConsumed} ML / 2 L'),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listGlassed.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 40,
                              child: Column(
                                children: [
                                  Visibility(
                                    visible: !listGlassed[index].drinked!,
                                    replacement: const SizedBox(height: 42),
                                    child: IconButton(
                                      onPressed: () {
                                        if (mounted) {
                                          setState(() {
                                            glassesConsumed++;
                                            listGlassed[index].drinked = true;
                                          });
                                          dbGlasses!.update(
                                              {'glasses': glassesConsumed});
                                        }
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                  ),
                                  Image.asset(listGlassed[index].drinked!
                                      ? 'images/fill bottle.png'
                                      : 'images/blank bottle.png'),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                color: const Color.fromARGB(255, 68, 237, 243),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sleeping Times',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('images/Human sleeping on bed.png'),
                              Text(
                                'Sleep \n$sleepTime PM',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  currentIndex = 4;
                                  showEditStatisticDialog('Sleep Time', 'PM');
                                },
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('images/Relaxing.png'),
                              Text(
                                'Nap \n$napTime hrs',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  currentIndex = 5;
                                  showEditStatisticDialog('Nap Time', 'hrs');
                                },
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('images/Wake up.png'),
                              Text(
                                'Wake Up \n$wakeUpTime AM',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  currentIndex = 6;
                                  showEditStatisticDialog('Wake Up Time', 'PM');
                                },
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                color: const Color.fromARGB(255, 68, 237, 243),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Body',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Row(
                        children: [
                          SizedBox(
                              height: 200,
                              child: Image.asset(
                                'images/Standing Up man.png',
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Height\n$height cm'),
                                    ElevatedButton(
                                        onPressed: () {
                                          currentIndex = 7;
                                          showEditStatisticDialog(
                                              'Height', 'cm');
                                        },
                                        child: const Text('Edit'))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Weight\n$weight KG'),
                                    ElevatedButton(
                                        onPressed: () {
                                          debugPrint('click weight');
                                          currentIndex = 8;
                                          showEditStatisticDialog(
                                              'Weight', 'kg');
                                        },
                                        child: const Text('Edit'))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Mood\nHappy'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Sleep\n$sleep hrs'),
                                    ElevatedButton(
                                        onPressed: () {
                                          debugPrint('click sleep');
                                          currentIndex = 9;
                                          showEditStatisticDialog(
                                              'Sleep hrs', 'hrs');
                                        },
                                        child: const Text('Edit'))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Walking\n$walking KM'),
                                    ElevatedButton(
                                        onPressed: () {
                                          debugPrint('click walk');
                                          currentIndex = 10;
                                          showEditStatisticDialog(
                                              'Walking hrs', 'KM');
                                        },
                                        child: const Text('Edit'))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                color: const Color.fromARGB(255, 68, 237, 243),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Meals',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('images/Breakfast.png'),
                              const Text(
                                'Breakfast',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const Text(
                                '311 cal',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('images/Meal.png'),
                              const Text(
                                'Lunch',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const Text(
                                '410 cal',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('images/Fish.png'),
                              const Text(
                                'Dinner',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const Text(
                                '398 cal',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('images/Snacks.png'),
                              const Text(
                                'Snack',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const Text(
                                '125 cal',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => const MealsPage()));
                              },
                              child: const Text('See more')))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
