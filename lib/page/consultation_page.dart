import 'package:bitescan/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  List<DoctorModel> doctorList = [];

  getData() {
    doctorList = [];
    doctorList.add(DoctorModel(
        image: 'images/dr florentia.png',
        experience: '5 years',
        name: 'Dr.Florentia',
        pay: 40.000,
        rate: 95));
    doctorList.add(DoctorModel(
        image: 'images/dr perez.png',
        experience: '8 years',
        name: 'Dr. Perez',
        pay: 43.000,
        rate: 95));
    doctorList.add(DoctorModel(
        image: 'images/Dr. Elisha.png',
        experience: '6 years',
        name: 'Dr. Elisha',
        pay: 40.000,
        rate: 95));
    doctorList.add(DoctorModel(
        image: 'images/Dr. Jeremy.png',
        experience: '5 years',
        name: 'Dr. Jeremy',
        pay: 50.000,
        rate: 95));
    doctorList.add(DoctorModel(
        image: 'images/Dr. Richard.png',
        experience: '10 years',
        name: 'Dr.Richard',
        pay: 50.000,
        rate: 95));
    setState(() {});
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
        title: const Text('Consultation'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              DateFormat('d MMMM y').format(DateTime.now()).toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: doctorList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              minRadius: 40,
                              foregroundImage: AssetImage(
                                doctorList[index].image!,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  doctorList[index].name!,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        const Icon(Icons.badge_rounded),
                                        Text(doctorList[index].experience!)
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(doctorList[index].rate.toString())
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      children: [
                                        const Icon(Icons.attach_money),
                                        Text(doctorList[index].pay.toString())
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const Row(
                                  children: [
                                    Text('Online'),
                                    Icon(
                                      Icons.circle,
                                      color: Colors.green,
                                      size: 10,
                                    )
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Chat',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Reservation',
                                      style: TextStyle(fontSize: 12),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
