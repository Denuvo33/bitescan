import 'package:bitescan/data/chart_data.dart';
import 'package:bitescan/model/glasses_consumed.dart';
import 'package:bitescan/page/consultation_page.dart';
import 'package:bitescan/page/food_recomendation.dart';
import 'package:bitescan/page/meals_page.dart';
import 'package:bitescan/page/scanned_page.dart';
import 'package:bitescan/page/statistic_page.dart';
import 'package:bitescan/profile/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name, weight, height, age;
  List<ChartData> chartData = [
    ChartData('blue', 60, Colors.blue),
    ChartData('yellow', 15, Colors.yellow),
    ChartData('grey', 25, Colors.grey),
  ];
  List<GlassConsumed> glassList = [];
  var glassesConsumed = 0;
  var formmatedDate = '';

  void getData() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference db = FirebaseDatabase.instance.ref('users/$uid');
    setState(() {
      formmatedDate = DateFormat('dd MMMM y').format(DateTime.now());
    });
    db.onValue.listen((event) {
      var data = event.snapshot.value;
      if (data != null && data is Map) {
        var glasses = data['glasses'];
        var dbDate = data['date'];
        setState(() {
          name = data['username'];
          weight = data['weight'];
          height = data['height'];
          age = data['age'];

          glassList = [];
          glassesConsumed = glasses;
        });

        if (formmatedDate != dbDate) {
          db.update({
            'date': formmatedDate,
            'glasses': 0,
          });
        }

        for (int i = 0; i < 8; i++) {
          if (i < glassesConsumed) {
            setState(() {
              glassList.add(GlassConsumed(drinked: true));
            });
          } else {
            setState(() {
              glassList.add(GlassConsumed(drinked: false));
            });
          }
        }
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
        title: const Text(
          'BITESCAN',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hi,$name',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => ProfilePage(
                                            name: name.toString(),
                                          )));
                            },
                            icon: const Icon(
                              Icons.account_circle,
                              size: 50,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Today,$formmatedDate',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      color: const Color.fromARGB(255, 68, 237, 243),
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Calories',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SfCircularChart(
                                        margin: const EdgeInsets.all(0),
                                        // backgroundColor: Colors.red,
                                        series: <CircularSeries>[
                                          DoughnutSeries<ChartData, String>(
                                              innerRadius: '75%',
                                              radius: '80%',
                                              endAngle: 220,
                                              startAngle: 220,
                                              dataSource: chartData,
                                              pointColorMapper:
                                                  (ChartData data, _) =>
                                                      data.color,
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y)
                                        ],
                                      ),
                                      const Column(
                                        children: [
                                          Text(
                                            '256',
                                          ),
                                          Text(
                                            'Remaining',
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset('images/Goal.png'),
                                        const Text('Goals \n 1500 cal')
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset('images/calories.png'),
                                        const Text('Calories \n 1244 cal')
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset('images/Exercise.png'),
                                        const Text('Exercise \n 477 cal')
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: Card(
                            color: const Color.fromARGB(255, 68, 237, 243),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Exercise',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Text(
                                      '1 hours',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      child: SizedBox(
                                          width: 35,
                                          child: Image.asset(
                                            'images/Exercise.png',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: Card(
                            color: const Color.fromARGB(255, 68, 237, 243),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Mood',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Text(
                                      'Happy',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      child: SizedBox(
                                          width: 35,
                                          child: Image.asset(
                                            'images/mood.png',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: Card(
                            color: const Color.fromARGB(255, 68, 237, 243),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Walking',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Text(
                                      '10 KM',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      child: SizedBox(
                                          width: 35,
                                          child: Image.asset(
                                            'images/Relaxing Walk.png',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: Card(
                            color: const Color.fromARGB(255, 68, 237, 243),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Sleep',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Text(
                                      '8 hrs',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      child: SizedBox(
                                          width: 35,
                                          child: Image.asset(
                                            'images/Sleepingmask.png',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Card(
                      color: const Color.fromARGB(255, 68, 237, 243),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Water Intake',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Recomended 8 glasses / 2 liter',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 50,
                              child: ListView.builder(
                                itemCount: glassList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 35,
                                    child: Image.asset(glassList[index].drinked!
                                        ? 'images/fill bottle.png'
                                        : 'images/blank bottle.png'),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: Card(
                            color: const Color.fromARGB(255, 68, 237, 243),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Sleep',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Text(
                                      '9 PM',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      child: SizedBox(
                                          width: 35,
                                          child: Image.asset(
                                            'images/Human sleeping on bed.png',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: Card(
                            color: const Color.fromARGB(255, 68, 237, 243),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Wake Up',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Text(
                                      '6 AM',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      child: SizedBox(
                                          width: 35,
                                          child: Image.asset(
                                            'images/Wake up.png',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: Card(
                            color: const Color.fromARGB(255, 68, 237, 243),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Weight',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      '$weight KG',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      child: SizedBox(
                                          width: 35,
                                          child: Image.asset(
                                            'images/weight.png',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: Card(
                            color: const Color.fromARGB(255, 68, 237, 243),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Height',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      '$height CM',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      child: SizedBox(
                                          width: 35,
                                          child: Image.asset(
                                            'images/Height.png',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(137, 187, 234, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const StatisticPage()));
                    },
                    child: Image.asset('images/icon Statistic.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const FoodRecPage()));
                    },
                    child: Image.asset('images/icon food recom.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const ScannedPage()));
                    },
                    child: Image.asset('images/icon scan.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const MealsPage()));
                    },
                    child: Image.asset('images/icon meals.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const ConsultationPage()));
                    },
                    child: Image.asset('images/icon consultation.png'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
