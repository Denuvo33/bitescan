import 'package:flutter/material.dart';

class SnackWidget extends StatefulWidget {
  const SnackWidget({super.key});

  @override
  State<SnackWidget> createState() => _SnackWidgetState();
}

class _SnackWidgetState extends State<SnackWidget> {
  bool showSnack = false;
  bool showOrangeDetails = false;
  bool showYOgurtDetail = false;
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
              Image.asset('images/Snacks.png'),
              const Text(
                'Snack',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              IconButton(
                onPressed: () {
                  if (showSnack) {
                    showSnack = false;
                    showOrangeDetails = false;
                    showYOgurtDetail = false;
                  } else {
                    showSnack = true;
                  }
                  setState(() {});
                },
                icon: Icon(
                  showSnack
                      ? Icons.arrow_drop_up_outlined
                      : Icons.arrow_drop_down_outlined,
                  size: 40,
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: showSnack,
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
                        '125 cal',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Orange'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('62 cal'),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          if (showOrangeDetails) {
                            showOrangeDetails = false;
                          } else {
                            showOrangeDetails = true;
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
                  visible: showOrangeDetails,
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text('Fat\n2%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Carbs\n91%'),
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
                const Text('Plain Yogurt'),
                Row(
                  children: [
                    const Text('63 cal'),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          if (showYOgurtDetail) {
                            showYOgurtDetail = false;
                          } else {
                            showYOgurtDetail = true;
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
                  visible: showYOgurtDetail,
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text('Fat\n22%'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Carbs\n45%'),
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
