import 'dart:math';

import 'package:bmi_v1/moods/moods.dart';
import 'package:bmi_v1/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static String routname = "homepage";
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ismale = false;
  double heightvalue = 150;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Body mass index"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    m1container(context, "male"),
                    const SizedBox(
                      width: 10,
                    ),
                    m1container(context, "female"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                ),
                // padding: const EdgeInsets.all(40),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${heightvalue}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "  CM",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Slider(
                      value: heightvalue,
                      onChanged: (val) {
                        heightvalue = val;
                        setState(() {});
                      },
                      min: 90,
                      max: 200,
                      divisions: 110,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    m2container(context, "Weight"),
                    const SizedBox(
                      width: 10,
                    ),
                    m2container(context, "Age"),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 17,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.only(bottom: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  setState(() {
                    // double res = weight / pow(heightvalue / 100, 2);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Result(
                        result: weight / pow(heightvalue / 100, 2),
                        ismale: ismale,
                        age: age,
                      );
                    }));
                  });
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded m1container(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            type == "male" ? ismale = true : ismale = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ismale && type == "male" || !ismale && type == "female"
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                type == "male" ? Icons.male : Icons.female,
              ),
              const SizedBox(height: 20),
              Text(
                type == "male" ? "Male" : "female",
                style: textStyle_l,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2container(BuildContext context, String type) {
    return Expanded(
      child: Container(
        // padding: const EdgeInsets.all(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              type,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              type == "Age" ? '$age' : '$weight',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: type == "Age" ? 'age++' : 'weight++',
                  onPressed: () {
                    setState(() {
                      type == "Age" ? age++ : weight++;
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    size: 25,
                  ),
                ),
                FloatingActionButton(
                  heroTag: type == "Age" ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      type == "Age" ? age-- : weight--;
                    });
                  },
                  child: const Icon(
                    Icons.remove,
                    size: 25,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
