import 'package:demo_ss1/main_page.dart';
import 'package:demo_ss1/route.dart';
import 'package:flutter/material.dart';
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: routes,
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


