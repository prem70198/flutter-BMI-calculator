import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI App',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}

