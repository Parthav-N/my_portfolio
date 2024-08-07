import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:my_portfolio/pages/education.dart';
import 'package:my_portfolio/utils/common_navbar.dart';

class Experience extends StatefulWidget {
  static const routeName = '/experience';
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  String activeRoute = Experience.routeName;

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

  Widget experienceCard(String org, String role, String startdate, String enddate, List<String> expList) {
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
            org,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 5, 254, 13),
              fontSize: 22,
              fontWeight: FontWeight.bold,
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

          const SizedBox(height: 16,),

          Text(
            role,
            style: GoogleFonts.lato(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w300,
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
            children: expList.map((course) => courseText(course)).toList(),
          ),
        ],
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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 10),
                child: Column(
                  children: [
                    experienceCard(
                      "Ahex Technologies",
                      "Flutter Developer Intern",
                      "May 2024",
                      "June 2024",
                      [
                        'Pioneered the development of an end-to-end chat application using Flutter, featuring a highly intuitive user interface and robust performance.',
                        'Engineered advanced media sharing capabilities, enabling seamless support for a wide variety of media formats, significantly enhancing user interaction.',
                        'Integrated sophisticated search functionality for messages and media, leveraging efficient algorithms to provide swift and accurate search results.',
                        'Utilized Firebase as the backend to ensure real-time data synchronization and reliable cloud storage, paired with SQLite for local data management, optimizing both performance and scalability of the application.'
                      ],
                    ),
                    const SizedBox(height: 20),
                    experienceCard(
                      "Indian National Center for Ocean Information Services",
                      "ML Research Intern",
                      "Feb 2024",
                      "May 2024",
                      [
                        'Collaborated with Dr. Siva Srinivas to process ocean surface wind maps from the ERA5 dataset, focusing on the Indian Ocean, by masking out irrelevant areas using Bathymetry data from INCOIS. ',
                        'Achieved super-resolution of ERA5 data, downscaling it to 1 degree and then upscaling back to .25 degree using Bicubic Interpolation and SRCNN methods, with SRCNN outperforming significantly based on RMSE comparison. ',
                        'Successfully mapped the paths of various cyclones that occurred in the Arabian Sea and the Bay of Bengal in the 2019-2020 timeline.  ',
                        'Utilized the CMIP6 dataset to successfully predict wave height at any point in time using the Shallow Water Equations. ',
                      ],
                    ),
                    const SizedBox(height: 20),
                    experienceCard(
                      "VNR Vignana Jyothi Institute of Engineering and Technology",
                      "Academic Research",
                      "Feb 2023",
                      "March 2024",
                      [
                        'Collaborated with Dr. Sandhya on developing a Smart Parking Lot System for VNRVJIET using Deep Learning algorithms, leading to the department’s best societal impact project. ',
                        ' Contributed to a pioneering project on Cyberbullying Detection using BERT model under Dr. Sitanath Biswas.',
                        'Worked under Mr. Kishan Babu to conduct a comparative study of CNN models for malaria parasite detection, resulting in the acceptance of our research at the IEEE GCITC conference in Bangalore, and it got published in IEEE Xplore. '
                      ],
                    ),

                    const SizedBox(height: 20),
                    experienceCard(
                      "Vistan NextGen",
                      "Data Science Intern",
                      "Nov 2022",
                      "Jan 2023",
                      [
                        'Collaborated closely with the data science team to ideate and develop cutting-edge object detection and tracking system for a prominent client. ',
                        'Spearheaded web scraping initiatives to collect and curate diverse datasets, demonstrating proficiency in data acquisition techniques.  ',
                        'Trained the object detection algorithm to achieve real-time detection with a 95% accuracy rate using YOLOv5.'
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