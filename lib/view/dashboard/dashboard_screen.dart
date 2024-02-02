
import 'package:farm/app/controller/dashboard/dashboard_controller.dart';
import 'package:farm/view/dashboard/setting/drawer_screen.dart';
import 'package:farm/view/dashboard/setting/user_profile.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController _dashboardCtrl = DashboardController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dashboardCtrl.userProfileApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          UserProfile(),
        ],
      ),
    );
  }
}
