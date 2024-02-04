import 'package:farm/view/dashboard/setting/drawer_screen.dart';
import 'package:farm/view/dashboard/setting/main_dashboard.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          MainDashboard(),
        ],
      ),
    );
  }
}
