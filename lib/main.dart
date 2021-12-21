import 'package:bmi_v1/home.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white, size: 90)),
      routes: {
        MyHomePage.routname: (context) => const MyHomePage(),
      },
      initialRoute: MyHomePage.routname,
    );
  }
}
