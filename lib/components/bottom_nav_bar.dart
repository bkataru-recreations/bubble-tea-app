import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

List<GButton> tabs = const [
  // shop tab
  GButton(
    icon: Icons.home,
    text: 'Shop',
  ),

  // cart tab
  GButton(
    icon: Icons.shopping_bag,
    text: 'Cart',
  ),
];

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;

  BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        color: Colors.grey[300],
        activeColor: Colors.white,
        tabActiveBorder: Border.all(color: Colors.white),
        gap: 8,
        tabs: tabs,
      ),
    );
  }
}
