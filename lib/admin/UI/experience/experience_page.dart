import 'package:flutter/material.dart';
import 'package:my_portfolio/core/provider/work_experience_provider.dart';
import 'package:provider/provider.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<WorkExperienceProvider>(
      builder: (context, value, child) => const ListTile(),
    ));
  }
}
