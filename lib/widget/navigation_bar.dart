import 'package:flutter/material.dart';
import 'package:inspection_app/screens/home/home_screen.dart';
import 'package:inspection_app/screens/login_screen.dart';
import 'package:inspection_app/screens/new_inspection/new_inspection_screen.dart';
import 'package:inspection_app/screens/profile/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;
  final screens = const [
    HomeScreen(),
    ProfileScreen(),
    NewInspectionScreen(),
  ];

  void _goTo() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  void _itemTapped(int index) async {
    if (index == 3) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');
      await prefs.remove('user_data');
      _goTo();
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar( 
          backgroundColor: Colors.grey.shade50,
          //indicatorColor: Theme.of(context).colorScheme.onPrimary,
          elevation: 5,
          shadowColor: Colors.red,
          selectedIndex: selectedIndex,
          onDestinationSelected: _itemTapped,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Inicio',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Perfil',
            ),
            NavigationDestination(
              icon: Icon(Icons.description_outlined),
              selectedIcon: Icon(Icons.description),
              label: 'Inspeccionar',
            ),
            NavigationDestination(
                icon: Icon(Icons.logout_outlined), label: "Salir")
          ]),
    );
  }
}
