// ignore_for_file: file_names

import 'package:digital_resume/Contollers_folder/link_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ResumePage extends StatelessWidget {
  ResumePage({super.key});
  final UrlController controller = Get.put(UrlController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Mamta Kumari',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 8,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: InkWell(
                        onTap: () => controller.makePhoneCall('+917807713653'),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.phone, size: 18, color: Colors.black),
                            SizedBox(width: 6),
                            Text(
                              '+91 7807713653',
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: InkWell(
                        onTap: () =>
                            controller.sendEmail('mamta26121998@gmail.com'),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.email, size: 18, color: Colors.black),
                            SizedBox(width: 6),
                            Text(
                              'mamta26121998@gmail.com',
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on, size: 18),
                        SizedBox(width: 6),
                        Text('Mohali, Punjab'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 24,
                runSpacing: 12,
                children: [
                  _buildLinkRow(
                    icon: FontAwesomeIcons.linkedin,
                    text: 'linkedin.com/in/mamta-kumari-178843239/',
                    url: 'https://www.linkedin.com/in/mamta-kumari-178843239/',
                    controller: controller,
                  ),
                  _buildLinkRow(
                    icon: FontAwesomeIcons.github,
                    text: 'github.com/mamta2345',
                    url: 'https://github.com/mamta2345',
                    controller: controller,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('Career Objective'),
              _buildParagraph(
                "To work with an organization where I can learn new skills and increase my abilities for the organizational goals as well as myself.",
              ),
              _buildSectionTitle('Education'),
              _buildEduItem(
                'Govt. PG College, Dharamshala (70%)',
                'Bachelor of Technology in Computer Science Engineering',
                'Aug 2021 - July 2024',
                context,
              ),
              _buildEduItem(
                'Govt. Polytechnic, Kangra (69%)',
                'Computer Science Engineering (Diploma)',
                'Aug 2019 - July 2021',
                context,
              ),
              _buildSectionTitle('Experience'),
              _buildExperienceItem(
                'CDAC Mohali',
                'Flutter Developer (Intern)',
                'Aug 2024 – Present',
                [
                  'Working on Flutter-based mobile applications, focusing on Android/iOS.Developing and integrating APIs, push notifications, and animations.',
                  'Built features like user login, course listing, and progress tracking.',
                  'Implemented features like authentication, course management, and progress tracking.',
                ],
              ),
              _buildExperienceItem(
                'Novem Control',
                'Android Developer (Trainee)',
                'Jan 2024 – June 2024',
                [
                  'Personal budget tracker Android app for tracking income, expenses, and goal setting.',
                  'Provides real-time financial insights and updates.',
                ],
              ),
              _buildSectionTitle('Technical Skills'),
              _buildParagraph(
                'Languages: Dart, XML, Java (Basic), HTML\nFrameworks/Libraries: Flutter, Firebase, GetX\nTools: VS Code, GitHub, Android Studio, Postman, Swagger\nPlatform: Android, Web\nArea of Expertise: Mobile App Development, API Integration, Real-time UI/UX, Firebase',
              ),
              _buildSectionTitle('Projects'),
              _buildProjectItem(
                'Work-Base Learning Program',
                'Flutter, Dart, Apis | Live Project',
                'Aug 2024 - Present',
                [
                  'Built a responsive web/mobile app using Flutter and Dart.',
                  'Integrated APIs for user access and reporting.',
                ],
              ),
              _buildProjectItem(
                'Personal Budget Tracker',
                'XML, Java, MYSQL | Source Code',
                'Jan 2024 - June 2024',
                [
                  'Android app for income/expense tracking and goal setting.',
                  'Built using Java/XML with MYSQL.',
                  'User-friendly financial dashboards.',
                ],
              ),
              _buildSectionTitle('Strength'),
              _buildBulletList([
                'Team Work',
                'Time Management',
                'Creativity',
                'Good Communication',
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildParagraph(String content) {
    final lines = content.split('\n');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        final parts = line.split(':');
        if (parts.length >= 2) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 15, color: Colors.black),
                children: [
                  TextSpan(
                    text: '${parts[0]}:',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' ${parts.sublist(1).join(":").trim()}'),
                ],
              ),
            ),
          );
        } else {
          return Text(line); // fallback if no colon found
        }
      }).toList(),
    );
  }

  Widget _buildEduItem(
    String institute,
    String course,
    String date,
    BuildContext context,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isSmallScreen = screenWidth < 600;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isSmallScreen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      institute,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(date, style: const TextStyle(color: Colors.black)),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      institute,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(date, style: const TextStyle(color: Colors.black)),
                  ],
                ),
          const SizedBox(height: 4),
          Text(
            course,
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(
    String company,
    String role,
    String date,
    List<String> bullets,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(company, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(date),
            ],
          ),
          Text(role, style: TextStyle(fontStyle: FontStyle.italic)),
          ...bullets.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text('\u2022 $e'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectItem(
    String title,
    String techStack,
    String date,
    List<String> bullets,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(date),
            ],
          ),
          Text(techStack, style: TextStyle(fontStyle: FontStyle.italic)),
          ...bullets.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text('\u2022 $e'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text('\u2022 $item'),
            ),
          )
          .toList(),
    );
  }

  Widget _buildLinkRow({
    required IconData icon,
    required String text,
    required String url,
    required UrlController controller,
  }) {
    return InkWell(
      onTap: () => controller.openLink(url),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.black),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
