import 'package:flutter/material.dart';
import 'package:microclimat_monitoring_app/features/home_page/home.dart';
import 'package:microclimat_monitoring_app/features/settings_pages/setting_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

var selectedIndex = 0;

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (selectedIndex == 0) {
            return const HomePage();
          } else {
            return  SettingsPage();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black38,
        onTap: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
            ),
            label: "DATA",
          ),
        ],
      ),
    );
  }
}


