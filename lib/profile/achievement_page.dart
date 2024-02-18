import 'package:flutter/material.dart';

class AchievementPage extends StatefulWidget {
  const AchievementPage({super.key});

  @override
  State<AchievementPage> createState() => _AchievementPageState();
}

class _AchievementPageState extends State<AchievementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      child: Card(
                        color: Color.fromARGB(255, 68, 237, 243),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Calories Lost'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '960 cal',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      child: Card(
                        color: Color.fromARGB(255, 68, 237, 243),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Distance'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '15 km',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      child: Card(
                        color: Color.fromARGB(255, 68, 237, 243),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Exercise Time'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '3h 12m',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      child: Card(
                        color: Color.fromARGB(255, 68, 237, 243),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Sleep Time'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '7h 46m',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                color: const Color.fromARGB(255, 68, 237, 243),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                          child: Text(
                        'Your most productive week',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                      const Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            color: const Color.fromRGBO(137, 187, 234, 1),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.all(1),
                              child: const Text(
                                'January,\n2nd\nweek',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(137, 187, 234, 1),
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: 30,
                                          child: Image.asset(
                                            'images/Run.png',
                                            fit: BoxFit.cover,
                                          )),
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      const Text('10 km')
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(137, 187, 234, 1),
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: 30,
                                          child: Image.asset(
                                            'images/Swimming  man.png',
                                            fit: BoxFit.cover,
                                          )),
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      const Text('2h 39m')
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(137, 187, 234, 1),
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: 30,
                                          child: Image.asset(
                                            'images/fire.png',
                                            fit: BoxFit.cover,
                                          )),
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      const Text('876 cal')
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                color: const Color.fromARGB(255, 68, 237, 243),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                          child: Text(
                        'Your most productive month',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                      const Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            color: const Color.fromRGBO(137, 187, 234, 1),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.all(1),
                              child: const Text(
                                'January,\n2024',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(137, 187, 234, 1),
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: 30,
                                          child: Image.asset(
                                            'images/Run.png',
                                            fit: BoxFit.cover,
                                          )),
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      const Text('9.5 km')
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(137, 187, 234, 1),
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: 30,
                                          child: Image.asset(
                                            'images/Swimming  man.png',
                                            fit: BoxFit.cover,
                                          )),
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      const Text('2h 47m')
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(137, 187, 234, 1),
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: 30,
                                          child: Image.asset(
                                            'images/fire.png',
                                            fit: BoxFit.cover,
                                          )),
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      const Text('798 cal')
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
