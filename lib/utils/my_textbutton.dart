import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String title;
  final String routeName;
  final bool isActive;
  final Function(String) onTap;

  const MyTextButton({
    super.key,
    required this.title,
    required this.routeName,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth > 600 ? 20 : 16; // Adjust font size based on screen width

    return TextButton(
      onPressed: () {
        onTap(routeName);
        Navigator.pushNamed(context, routeName);
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize, 
          color: isActive ? Colors.green : Colors.white,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          decoration: isActive ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}
