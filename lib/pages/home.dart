import 'dart:async';
import 'package:my_portfolio/pages/about.dart';
import 'package:my_portfolio/pages/contact.dart';
import 'package:my_portfolio/pages/education.dart';
import 'package:my_portfolio/pages/experience.dart';
import 'package:my_portfolio/pages/projects.dart';
import 'package:my_portfolio/pages/skills.dart';
import 'package:my_portfolio/utils/my_navbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentProfession = 'Software Dev';
  final link1 = "https://www.linkedin.com/in/parthav-n3";
  final link2 = "https://github.com/Parthav-N";
  final yourEmail = 'parthavnuthalapati2019@gmail.com';
  int currentIndex = 0;
  final List<String> professions = ['Coder', 'AI & ML Enthusiast', 'Data Scientist', 'Software Developer'];
  Timer? typingTimer;
  String activeRoute = Home.routeName;

  @override
  void initState() {
    super.initState();
    typingTimer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % professions.length;
        currentProfession = professions[currentIndex];
      });
    });
  }

  @override
  void dispose() {
    typingTimer?.cancel();
    super.dispose();
  }

  Future<void> _launchURL(String link) async {
    var url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch URL';
    }
  }

  Future<void> _launchURLApp(String link) async {
    final url = Uri(scheme: 'mailto', path: link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch email app';
    }
  }

  void _handleNavTap(String routeName) {
    setState(() {
      activeRoute = routeName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isWideScreen ? 260.0 : 20.0,
          vertical: isWideScreen ? 260.0 : 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Parthav Nuthalapati',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "I'm a ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  TextSpan(
                    text: currentProfession,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                MyNavbar(title: 'Home', isActive: activeRoute == Home.routeName, routeName: Home.routeName, onTap: _handleNavTap),
                MyNavbar(title: 'About', isActive: activeRoute == About.routeName, routeName: About.routeName, onTap: _handleNavTap),
                MyNavbar(title: 'Education', isActive: activeRoute == Education.routeName, routeName: Education.routeName, onTap: _handleNavTap),
                MyNavbar(title: 'Experience', isActive: activeRoute == Experience.routeName, routeName: Experience.routeName, onTap: _handleNavTap),
                MyNavbar(title: 'Projects', isActive: activeRoute == Projects.routeName, routeName: Projects.routeName, onTap: _handleNavTap),
                MyNavbar(title: 'Skills', isActive: activeRoute == Skills.routeName, routeName: Skills.routeName, onTap: _handleNavTap),
                TextButton(
                  onPressed: () async {
                    await _launchURL("https://drive.google.com/file/d/1ESq1WtVSuiTFNHYTFsPVMj4ne-Zt7F37/view?usp=drive_link");
                  },
                  child: const Text(
                    "Resume",
                    style: TextStyle(
                      fontSize: 18,
                      decorationThickness: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                MyNavbar(title: 'Contact', isActive: activeRoute == Contact.routeName, routeName: Contact.routeName, onTap: _handleNavTap),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
                  onPressed: () async {
                    await _launchURL(link1);
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white),
                  onPressed: () async {
                    await _launchURL(link2);
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.google, color: Colors.white),
                  onPressed: () async {
                    await _launchURLApp(yourEmail);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
