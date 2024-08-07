import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/about.dart';
import 'package:my_portfolio/pages/contact.dart';
import 'package:my_portfolio/pages/education.dart';
import 'package:my_portfolio/pages/experience.dart';
import 'package:my_portfolio/pages/home.dart';
import 'package:my_portfolio/pages/projects.dart';
import 'package:my_portfolio/pages/skills.dart';
import 'package:my_portfolio/utils/my_navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonNavbar extends StatelessWidget {
  final String activeRoute;
  final void Function(String routeName) onTap;

  const CommonNavbar({
    super.key,
    required this.activeRoute,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF09203a), // Navbar background color
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 200.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust alignment to distribute space evenly
        children: [
          const Text(
            "PARTHAV NUTHALAPATI",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              MyNavbar(title: 'Home', isActive: activeRoute == Home.routeName, routeName: Home.routeName, onTap: onTap),
              MyNavbar(title: 'About', isActive: activeRoute == About.routeName, routeName: About.routeName, onTap: onTap),
              MyNavbar(title: 'Education', isActive: activeRoute == Education.routeName, routeName: Education.routeName, onTap: onTap),
              MyNavbar(title: 'Experience', isActive: activeRoute == Experience.routeName, routeName: Experience.routeName, onTap: onTap),
              MyNavbar(title: 'Projects', isActive: activeRoute == Projects.routeName, routeName: Projects.routeName, onTap: onTap),
              MyNavbar(title: 'Skills', isActive: activeRoute == Skills.routeName, routeName: Skills.routeName, onTap: onTap),
              TextButton(
                onPressed: () async {
                  await _launchURL("https://drive.google.com/file/d/1ESq1WtVSuiTFNHYTFsPVMj4ne-Zt7F37/view?usp=drive_link");
                },
                child: const Text(
                  "Resume",
                  style: TextStyle(
                    fontSize: 20,
                    decorationThickness: 2.0,
                    color: Colors.white,
                  ),
                ),
              ),
              MyNavbar(title: 'Contact', isActive: activeRoute == Contact.routeName, routeName: Contact.routeName, onTap: onTap),
            ],
          ),
        ],
      ),
    );

  }

  Future<void> _launchURL(String link) async {
    var url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch URL';
    }
  }
}
