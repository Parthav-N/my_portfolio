import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/about.dart';
import 'package:my_portfolio/pages/contact.dart';
import 'package:my_portfolio/pages/education.dart';
import 'package:my_portfolio/pages/experience.dart';
import 'package:my_portfolio/pages/home.dart';
import 'package:my_portfolio/pages/projects.dart';
import 'package:my_portfolio/pages/skills.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        backgroundColor: Color(0xFF212121),
        body:  Home(),
      ),
      routes: {
        Home.routeName: (context) => const Home(),
        About.routeName: (context) => const About(),
        Education.routeName: (context) => const Education(),
        Experience.routeName: (context) => const Experience(),
        Projects.routeName: (context) => const Projects(),
        Skills.routeName: (context) => const Skills(),
        Contact.routeName: (context) => const Contact(),
      },
    );
  }
}
