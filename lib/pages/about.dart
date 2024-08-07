import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utils/common_navbar.dart';

class About extends StatefulWidget {
  static const routeName = '/about';
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  String activeRoute = About.routeName;

  void _handleNavTap(String routeName) {
    setState(() {
      activeRoute = routeName;
    });
  }

  Widget infoTile(IconData icon, String title, String subtitle) {
    return Row(
      children: <Widget>[
        Icon(icon, color: Colors.green),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget interestTile(IconData icon, String title) {
    return Expanded(
      child: Card(
        color: Colors.blue[900],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, color: Colors.green, size: 30),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  title,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
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
      body: Column(
        children: [
          CommonNavbar(
            activeRoute: activeRoute,
            onTap: _handleNavTap,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 10),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.black,
                          child: Image.asset(
                            "assets/images/pp.jpeg",
                            fit: BoxFit.cover,
                            width: 100,
                            height: 400,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Currently pursuing a Master’s in Computer Science at Northeastern University\'s Khoury College of Computer Sciences in Boston, I am a passionate and driven graduate student dedicated to continuous skill development and innovation. With a strong foundation in software development and problem-solving, I excel at quickly mastering new technologies. Proficient in Dart, Java, Python, R, Object-Oriented Programming, Data Structures, and Algorithms, consistently emphasizing clean code and best practices to deliver high-quality solutions.',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Eager for growth, I’m actively seeking Software Development Engineer or Data Science or Machine Learning internship/co-op roles for Spring/Summer 2025. If you know any relevant positions or wish to connect, please reach out.',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(child: infoTile(Icons.cake, 'Birthday: ', '21 May 2002')),
                                  Expanded(child: infoTile(Icons.location_city, 'City: ', 'Boston, MA')),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(child: infoTile(Icons.phone, 'Phone: ', '+91 799-385-8870')),
                                  Expanded(child: infoTile(Icons.email, 'Email: ', 'nuthalapati.p@northeastern.edu')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'INTERESTS',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      interestTile(Icons.android_outlined, 'Software Development'),
                      interestTile(Icons.pie_chart, 'Data Science'),
                      interestTile(Icons.account_tree_outlined, 'Machine Learning'),
                      interestTile(Icons.code, 'Algorithms'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
