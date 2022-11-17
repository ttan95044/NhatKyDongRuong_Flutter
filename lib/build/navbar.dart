import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhatkydongruong/page/index.dart';
import 'package:nhatkydongruong/page/suggestions.dart';

late User loggedInUser;

class navBar extends StatefulWidget{
  const navBar({Key? key}) :super (key: key);
  static const String id = 'navbar';
  @override
  State<navBar> createState() => _navBarState();
}
class _navBarState extends State<navBar> {
  final navbar = [
    const index(),
    const suggestions(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navbar[
      _selectedIndex
      ],
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Colors.white,
        unSelectedColor: Colors.white,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        unselectedIconSize: 25,
        selectedIconSize: 35,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 0,
        indicatorType: IndicatorType.Top,
        gradient: const LinearGradient(
          colors: [Colors.green, Colors.green],
        ),
        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Trang Chủ',
            icon: Icons.home,
          ),
          CustomBottomBarItems(
            label: 'Gợi Ý',
            icon: Icons.announcement,
          ),
        ],
      ),
    );
  }
}

