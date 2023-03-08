import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int activeIndex;
  final tabsView = {
    0: const AnalyticsScreen(),
    1: const MainScreen(),
    2: ProfileScreen(),
  };

  @override
  void initState() {
    activeIndex = 1;
    super.initState();
  }

  Future logOutHandler() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabsView[activeIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: activeIndex,
        items: const <Widget>[
          Icon(
            Icons.analytics,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.person_outline, size: 30, color: Colors.white),
        ],
        color: Colors.black,
        buttonBackgroundColor: Colors.redAccent,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
