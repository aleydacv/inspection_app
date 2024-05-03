import 'package:flutter/material.dart';
import 'package:inspection_app/screens/home/home_screen.dart';
import 'package:inspection_app/screens/new_inspection/new_inspection_screen.dart';
import 'package:inspection_app/screens/profile/profile_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  final screens = const [HomeScreen(), ProfileScreen(), NewInspectionScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        elevation: 0,
        onTap: (int newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_document), label: "Inspeccionar"),
        ],
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
