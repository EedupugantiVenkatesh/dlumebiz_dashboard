import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'widgets/sidebar.dart';
import 'widgets/topbar.dart';

void main() {
  runApp(const DlumeBizApp());
}

class DlumeBizApp extends StatelessWidget {
  const DlumeBizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DlumeBiz Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF8FAFB),
      ),
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
    );
  }
}
