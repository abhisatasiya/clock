import 'package:flutter/material.dart';
import 'Live Clock Page.dart';
import 'StopWatch.dart';
void main() {
  runApp(
    const MyApp(),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const StopWatch(),
        'LiveTime': (context) => const LiveWatch(),
      },
    );
  }
}