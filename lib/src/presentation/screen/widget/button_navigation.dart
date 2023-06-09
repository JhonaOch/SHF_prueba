// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helpers/configuration_helper.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: SvgPicture.asset(
            'assets/vector/map.svg',
            width: 24,
            height: 24,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: SvgPicture.asset(
            'assets/vector/book.svg',
            width: 24,
            height: 24,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: SvgPicture.asset(
            'assets/vector/heart.svg',
            width: 24,
            height: 24,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: SvgPicture.asset(
            'assets/vector/profile.svg',
            width: 24,
            height: 24,
          ),
        ),
      ],
      selectedItemColor: OpColor.colorProgressIndicator,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(
          color: OpColor.colorProgressIndicator, size: 24.0),
      unselectedIconTheme: const IconThemeData(color: Colors.grey, size: 24.0),
    );
  }
}
