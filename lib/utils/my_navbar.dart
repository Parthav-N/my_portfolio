import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/my_textbutton.dart';

class MyNavbar extends StatelessWidget {
  final String title;
  final bool isActive;
  final String routeName;
  final Function(String) onTap;
  const MyNavbar({super.key, required this.title, required this.isActive, required this.routeName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MyTextButton(
      title: title, 
      routeName: routeName, 
      isActive: isActive, 
      onTap: onTap
    );
  }
}