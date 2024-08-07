import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/common_navbar.dart';

class Skills extends StatefulWidget {
  static const routeName = '/skills';
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  String activeRoute = Skills.routeName;

  void _handleNavTap(String routeName) {
    setState(() {
      activeRoute = routeName;
    });
  }

  Widget _buildSkillsSection(BuildContext context, String title, List<String> imagePaths) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10), // Only vertical padding
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16), // Compact layout
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16), // Increased space between title and logos
              Row( // Use Row for a single-line layout
                mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                children: imagePaths.map((imagePath) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16), // Add spacing between icons
                    child: Image.asset(
                      imagePath,
                      height: 120, // Increase the size of the logos
                      width: 120,  // Ensure logos are square for uniformity
                      fit: BoxFit.contain, // Fit the image within the given dimensions
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212529), // Page background color
      body: LayoutBuilder(
        builder: (context, constraints) {
          double horizontalPadding = 200;
          double maxWidth = constraints.maxWidth;

          // Adjust the padding based on the screen width to match the navbar
          if (maxWidth < 800) {
            horizontalPadding = 16; // Reduce padding for smaller screens
          }

          return Column(
            children: [
              CommonNavbar(
                activeRoute: activeRoute,
                onTap: _handleNavTap,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSkillsSection(
                          context,
                          'Languages',
                          [
                            'assets/images/dart.png',
                            'assets/images/java.png',
                            'assets/images/python.png',
                            'assets/images/r.png',
                            'assets/images/jsp.png',
                            'assets/images/html.png',
                            'assets/images/css.png',
                          ],
                        ),
                        _buildSkillsSection(
                          context,
                          'Databases',
                          [
                            'assets/images/mysql.png',
                            'assets/images/mongodb.png',
                            'assets/images/firebase.png',
                          ],
                        ),
                        _buildSkillsSection(
                          context,
                          'Frameworks',
                          [
                            'assets/images/react.png',
                            'assets/images/flutter.png',
                            'assets/images/tensorflow.png',
                            'assets/images/scikit-learn.jpeg',
                          ],
                        ),
                        _buildSkillsSection(
                          context,
                          'Tools',
                          [
                            'assets/images/git.png',
                            'assets/images/github.png',
                            'assets/images/jupyter.png',
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
