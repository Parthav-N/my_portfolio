import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utils/common_navbar.dart';

class Education extends StatefulWidget {
  static const routeName = '/education';
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  String activeRoute = Education.routeName;

  void _handleNavTap(String routeName) {
    setState(() {
      activeRoute = routeName;
    });
  }

  Widget courseText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•   ',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget educationCard(String uni, String course, String startdate, String enddate, List<String> courseList) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 14, 45, 99), // Adjust color as needed
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            uni,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 5, 254, 13),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            course,
            style: GoogleFonts.lato(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "$startdate - $enddate",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Relevant Coursework',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: courseList.map((course) => courseText(course)).toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: const Color(0xFF212529), // Page background color
      body: Column(
        children: [
          CommonNavbar(
            activeRoute: activeRoute,
            onTap: _handleNavTap,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isWideScreen ? 100 : 16,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    educationCard(
                      "Khoury College of Computer Sciences, Northeastern University",
                      "Master of Science in Computer Science",
                      "September 2024",
                      "May 2026",
                      [
                        'Programming Design Paradigm',
                        'Algorithms',
                        'Machine Learning',
                        'Large-Scale Parallel Data Processing',
                        'Information Retrieval',
                        'Web Development',
                      ],
                    ),
                    const SizedBox(height: 20),
                    educationCard(
                      "VNR Vignana Jyothi Institute of Engineering and Technology",
                      "Bachelor of Technology in Computer Science and Engineering - AIML",
                      "December 2020",
                      "May 2024",
                      [
                        'Data Structures',
                        'Image Processing Techniques',
                        'Data Engineering',
                        'Machine Learning and Neural Networks',
                        'Deep Learning for Computer Vision',
                        'Cloud Technologies',
                        'Fundamentals of Natural Language Processing',
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
