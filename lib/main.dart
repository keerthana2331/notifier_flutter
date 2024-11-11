import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_page.dart';
import 'counter_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CounterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
