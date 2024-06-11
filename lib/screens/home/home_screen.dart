import 'package:flutter/material.dart';
import 'package:inspection_app/widget/app_bar_images.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarImages(),
      ),
      body: const Center(child: Text("Home Screen")),
    );
  }
}
