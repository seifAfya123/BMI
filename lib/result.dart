import 'package:bmi_v1/moods/moods.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.result,
    required this.ismale,
    required this.age,
  }) : super(key: key);
  static String routname = "result";
  final double result;
  final bool ismale;
  final int age;
  String get resultweight {
    String resultText = '';
    if (result >= 30) {
      resultText = 'Obse';
    } else if (result >= 25 && result < 30) {
      resultText = 'Overweight';
    } else if (result >= 18.5 && result < 24.9) {
      resultText = 'Normal';
    } else {
      resultText = 'Thin';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Gender : ${ismale ? "male" : "female"}",
                style: textStyle_l.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.08),
              ),
              Text(
                "result : ${result.toStringAsFixed(2)}",
                style: textStyle_l.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.08),
              ),
              Text(
                "Healthness : $resultweight",
                style: textStyle_l.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.08),
              ),
              Text(
                "Age : $age",
                style: textStyle_l.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.08),
              )
            ],
          ),
        ),
      ),
    );
  }
}
