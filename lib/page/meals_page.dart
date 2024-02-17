import 'package:bitescan/page/widget/dinner_widget.dart';
import 'package:bitescan/page/widget/breakfast_widget.dart';
import 'package:bitescan/page/widget/launch_widget.dart';
import 'package:bitescan/page/widget/snack_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MealsPage extends StatefulWidget {
  const MealsPage({super.key});

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  var date = DateFormat('d MMMM y').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              const BreakfastWidget(),
              const SizedBox(
                height: 20,
              ),
              const LaunchWidget(),
              const SizedBox(
                height: 20,
              ),
              const DinnerWidget(),
              const SizedBox(
                height: 20,
              ),
              const SnackWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
