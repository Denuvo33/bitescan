import 'package:flutter/material.dart';

class DinnerWidget extends StatefulWidget {
  const DinnerWidget({super.key});

  @override
  State<DinnerWidget> createState() => _DinnerWidgetState();
}

class _DinnerWidgetState extends State<DinnerWidget> {
  bool showDinner = false;
  bool showSandWichDetails = false;
  bool showJuiceDetails = false;
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
              Image.asset('images/Fish.png'),
              const Text(
                'Dinner',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              IconButton(
                onPressed: () {
                  if (showDinner) {
                    showDinner = false;
                    showJuiceDetails = false;
                    showSandWichDetails = false;
                  } else {
                    showDinner = true;
                  }
                  setState(() {});
                },
                icon: Icon(
                  showDinner
                      ? Icons.arrow_drop_up_outlined
                      : Icons.arrow_drop_down_outlined,
                  size: 40,
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: showDinner,
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
                        '398 cal',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Turkey sandwich'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('308 cal'),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          if (showSandWichDetails) {
                            showSandWichDetails = false;
                          } else {
                            showSandWichDetails = true;
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
                  visible: showSandWichDetails,
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text('Fat\n27%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Carbs\n36%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Protein\n38%')
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                ),
                const Text('Strawberry juice'),
                Row(
                  children: [
                    const Text('90 cal'),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          if (showJuiceDetails) {
                            showJuiceDetails = false;
                          } else {
                            showJuiceDetails = true;
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
                  visible: showJuiceDetails,
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text('Fat\n14%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Carbs\n83%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Protein\n3%')
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
