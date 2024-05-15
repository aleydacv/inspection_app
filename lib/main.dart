import 'package:flutter/material.dart';
import 'package:inspection_app/widgets/navigation_bar_app/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF6F5FA),
          ),
      home: const CustomNavigationBar(),
    );
  }
}
