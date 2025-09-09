import 'package:boycott_app/models/bottom_bar/view/home.dart';
import 'package:boycott_app/models/bottom_bar/view/profile.dart';
import 'package:boycott_app/models/bottom_bar/view/scan.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 1; // Home sahifasidan boshlaymiz

  final List<Widget> _pages = const [Home(), Scan(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _currentIndex == 1
            ? _pages[0]
            : _currentIndex == 2
            ? _pages[1]
            : _pages[2],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            backgroundColor: AppColor.green,
            onPressed: () {
              setState(() {
                _currentIndex = 2; // Scan sahifasi
              });
            },
            child: FaIcon(
              FontAwesomeIcons.barcode,
              color: AppColor.white,
              size: 26,
            ),
          ),
          const SizedBox(height: 6),
          if (_currentIndex == 2)
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColor.green,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: Colors.white54,
        itemCount: 2,
        tabBuilder: (int index, bool isActive) {
          IconData icon = index == 0 ? Icons.home : Icons.person;
          bool active =
              (index == 0 && _currentIndex == 1) ||
              (index == 1 && _currentIndex == 3);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: active ? AppColor.green : AppColor.grey,
              ),
              const SizedBox(height: 4),
              if (active)
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColor.green,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          );
        },
        activeIndex: _currentIndex == 1
            ? 0
            : _currentIndex == 3
            ? 1
            : -1, // Scan uchun AnimatedBottomNavigationBar-da index yo'q
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        splashSpeedInMilliseconds: 0,
        height: 60,
        gapWidth: 50,
        onTap: (index) {
          setState(() {
            _currentIndex = index == 0 ? 1 : 3; // Home=1, Profile=3
          });
        },
      ),
    );
  }
}
