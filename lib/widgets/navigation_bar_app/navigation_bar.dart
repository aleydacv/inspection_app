import 'package:flutter/material.dart';
import 'package:inspection_app/screens/home/home_screen.dart';
import 'package:inspection_app/screens/new_inspection/new_inspection_screen.dart';
import 'package:inspection_app/screens/profile/profile_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;
  final screens = const [HomeScreen(), ProfileScreen(), NewInspectionScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
          //backgroundColor: Colors.white,
          elevation: 0,
          selectedIndex: selectedIndex,
          onDestinationSelected: (int newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Inicio',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_2_outlined),
              selectedIcon: Icon(Icons.person),
              label: 'Perfil',
            ),
            NavigationDestination(
              icon: Icon(Icons.edit),
              selectedIcon: Icon(Icons.edit_document),
              label: 'Inspeccionar',
            ),
          ]),
    );
  }
}
