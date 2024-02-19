import 'package:bitescan/page/bmi_page.dart';
import 'package:bitescan/page/gain_weight.dart';
import 'package:bitescan/page/lose_weight.dart';
import 'package:flutter/material.dart';

class FoodRecPage extends StatelessWidget {
  const FoodRecPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Recommendation'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 220,
                width: 220,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const LoseWeightPage()));
                  },
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/gainimage.png'),
                      const Text(
                        'Lose Weight',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 220,
                width: 220,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const GainWeightPage()));
                  },
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/loseimage.png'),
                      const Text(
                        'Gain Weight',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 220,
                width: 220,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => const BMIPage()));
                  },
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/calculate BMI.png'),
                      const Text(
                        'Calculate your BMI',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
