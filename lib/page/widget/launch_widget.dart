import 'package:flutter/material.dart';

class LaunchWidget extends StatefulWidget {
  const LaunchWidget({super.key});

  @override
  State<LaunchWidget> createState() => _LaunchWidgetState();
}

class _LaunchWidgetState extends State<LaunchWidget> {
  bool showLaunch = false;
  bool showChickenDetails = false;
  bool showRiceDetails = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
              border: Border.all(width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('images/Meal.png'),
              const Text(
                'Launch',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              IconButton(
                onPressed: () {
                  if (showLaunch) {
                    showLaunch = false;
                    showChickenDetails = false;
                    showRiceDetails = false;
                  } else {
                    showLaunch = true;
                  }
                  setState(() {});
                },
                icon: Icon(
                  showLaunch
                      ? Icons.arrow_drop_up_outlined
                      : Icons.arrow_drop_down_outlined,
                  size: 40,
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: showLaunch,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(width: 1),
                      ),
                      child: const Text(
                        '410 cal',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Chicken Breast'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('195 cal'),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          if (showChickenDetails) {
                            showChickenDetails = false;
                          } else {
                            showChickenDetails = true;
                          }
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 40,
                        )),
                    const Spacer(),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(137, 187, 234, 1),
                        border: Border.all(width: 1),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            '-',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(137, 187, 234, 1),
                          border: Border.all(width: 1),
                        ),
                        child: const Center(child: Text('1'))),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(137, 187, 234, 1),
                        border: Border.all(width: 1),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            '+',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: showChickenDetails,
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text('Fat\n37%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Carbs\n0%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Protein\n63%')
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                ),
                const Text('Brown Rice'),
                Row(
                  children: [
                    const Text('215 cal'),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          if (showRiceDetails) {
                            showRiceDetails = false;
                          } else {
                            showRiceDetails = true;
                          }
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 40,
                        )),
                    const Spacer(),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(137, 187, 234, 1),
                        border: Border.all(width: 1),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            '-',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(137, 187, 234, 1),
                          border: Border.all(width: 1),
                        ),
                        child: const Center(child: Text('1'))),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(137, 187, 234, 1),
                        border: Border.all(width: 1),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            '+',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: showRiceDetails,
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text('Fat\n7%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Carbs\n83%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Protein\n9%')
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('+ Add')),
                const Divider(
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
