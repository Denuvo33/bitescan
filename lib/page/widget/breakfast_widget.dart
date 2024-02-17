import 'package:flutter/material.dart';

class BreakfastWidget extends StatefulWidget {
  const BreakfastWidget({super.key});

  @override
  State<BreakfastWidget> createState() => _BreakfastWidgetState();
}

class _BreakfastWidgetState extends State<BreakfastWidget> {
  bool showBreakfast = false;
  bool showEggDetails = false;
  bool showPotatoDetails = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
              border: Border.all(width: 1)),
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('images/Breakfast.png'),
              const Text(
                'Breakfast',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              IconButton(
                onPressed: () {
                  if (showBreakfast) {
                    showBreakfast = false;
                    showEggDetails = false;
                    showPotatoDetails = false;
                  } else {
                    showBreakfast = true;
                  }
                  setState(() {});
                },
                icon: Icon(
                  showBreakfast
                      ? Icons.arrow_drop_up_outlined
                      : Icons.arrow_drop_down_outlined,
                  size: 40,
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: showBreakfast,
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
                        '311 cal',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Scramble egg'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('101 cal'),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          if (showEggDetails) {
                            showEggDetails = false;
                          } else {
                            showEggDetails = true;
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
                  visible: showEggDetails,
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text('Fat\n31%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Carbs\n5%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Protein\n27%')
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                ),
                const Text('Mashed Potato'),
                Row(
                  children: [
                    const Text('210 cal'),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          if (showPotatoDetails) {
                            showPotatoDetails = false;
                          } else {
                            showPotatoDetails = true;
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
                  visible: showPotatoDetails,
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text('Fat\n67%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Carbs\n62%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Protein\n7%')
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
