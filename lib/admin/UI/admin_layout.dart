import 'package:flutter/material.dart';
import 'package:my_portfolio/admin/UI/about/about_screen.dart';
import 'package:my_portfolio/admin/UI/experience/work_experience.dart';
import 'package:my_portfolio/admin/UI/project/admin_project.dart';

class AdminLayout extends StatelessWidget {
  final List<Widget> screens = [
    AdminAboutUsScreen(),
    const AdminWorkExperienceScreen(),
    const AdminProjectsScreen()
  ];
  AdminScreens intialScreen = AdminScreens.about;
  AdminLayout({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    switch (intialScreen) {
      case AdminScreens.about:
        return AdminAboutUsScreen();
      case AdminScreens.experience:
        return const AdminWorkExperienceScreen();
      case AdminScreens.projects:
        return const AdminProjectsScreen();
    }
  }
}

enum AdminScreens {
  about,
  experience,
  projects,
}
