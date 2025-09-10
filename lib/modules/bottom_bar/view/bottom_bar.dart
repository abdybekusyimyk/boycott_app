import 'package:boycott_app/modules/home/view/home_view.dart';
import 'package:boycott_app/modules/profile/view/profile_view.dart';
import 'package:boycott_app/modules/scan/view/scan_view.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 1;
  int _tabIndex = 0;

  final List<Widget> _pages = const [HomeView(), ScanView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    final page = _currentIndex == 1
        ? _pages[0]
        : _currentIndex == 2
        ? _pages[1]
        : _pages[2];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: page,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton(
              backgroundColor: AppColor.green,
              elevation: 10,
              splashColor: Colors.green.withValues(alpha: 0.5),
              shape: const CircleBorder(),
              onPressed: () => setState(() => _currentIndex = 2),
              child: Icon(Icons.qr_code_scanner_rounded, size: 24),
            ),
          ),
          const SizedBox(height: 6),
          if (_currentIndex == 2)
            SizedBox(
              width: 6,
              height: 6,
              child: DecoratedBox(
                decoration: BoxDecoration(color: AppColor.green, shape: BoxShape.circle),
              ),
            ),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        shadow: const BoxShadow(color: Color.fromARGB(81, 161, 209, 162), blurRadius: 28, offset: Offset(1, 1)),
        itemCount: 2,
        tabBuilder: (int index, bool isActive) {
          IconData icon = index == 0 ? Icons.home_outlined : Icons.person_outlined;
          final active = (_currentIndex != 2) && (index == _tabIndex);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 24, color: active ? AppColor.green : AppColor.grey),
              const SizedBox(height: 4),
              if (active)
                SizedBox(
                  width: 6,
                  height: 6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: AppColor.green, shape: BoxShape.circle),
                  ),
                ),
            ],
          );
        },
        activeIndex: _tabIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        splashSpeedInMilliseconds: 0,
        height: 50,
        onTap: (index) => setState(() {
          _tabIndex = index;
          _currentIndex = (index == 0) ? 1 : 3;
        }),
      ),
    );
  }
}
