import 'package:flutter/material.dart';
import 'package:my_portfolio/admin/UI/about/about_screen.dart';
import 'package:my_portfolio/admin/UI/experience/work_experience.dart';
import 'package:my_portfolio/admin/UI/intro/admin_intro.dart';
import 'package:my_portfolio/admin/UI/project/admin_project.dart';

class AdminLayout extends StatelessWidget {
  final List<Widget> screens = [
    const AdminIntroScreen(),
    const AdminAboutUsScreen(),
    const AdminWorkExperienceScreen(),
    const AdminProjectsScreen()
  ];
  AdminScreens intialScreen = AdminScreens.intro;
  AdminLayout({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    switch (intialScreen) {
      case AdminScreens.intro:
        return const AdminIntroScreen();
      case AdminScreens.about:
        return const AdminAboutUsScreen();
      case AdminScreens.experience:
        return const AdminWorkExperienceScreen();
      case AdminScreens.projects:
        return const AdminProjectsScreen();
    }
  }
}

enum AdminScreens {
  intro,
  about,
  experience,
  projects,
}
