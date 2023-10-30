import 'package:flutter/material.dart';
import 'package:my_portfolio/user/UI/components/experience_box.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) => const ExperienceBox());
  }
}
