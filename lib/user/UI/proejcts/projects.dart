import 'package:flutter/material.dart';
import 'package:my_portfolio/user/UI/components/project_box.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) => const ProjectBox());
  }
}
