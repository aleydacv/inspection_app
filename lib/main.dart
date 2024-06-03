import 'package:flutter/material.dart';
import 'package:inspection_app/screens/login.dart';
import 'package:inspection_app/widget/navigation_bar_app/navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFF6F5FA),
          ),
          home: const LoginPage(),
        );
      },
    );
  }
}
