import 'package:flutter/material.dart';
import 'package:my_portfolio/user/UI/components/project_box.dart';
import 'package:my_portfolio/utils/utils.dart';

class Projects extends StatelessWidget {
  final Screens currentScreen;
  const Projects({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        currentScreen == Screens.phone || currentScreen == Screens.tablet
            ? const Text(
                'PROJECTS',
                style: TextStyle(
                  color: Color(0xFFE2E8F0),
                  fontSize: 29,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  //   height: 0.10,
                  letterSpacing: 1.40,
                ),
              )
            : const SizedBox(),
        ListView.builder(
            primary: false,
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) => ProjectBox(
                  currentScreen: currentScreen,
                )),
      ],
    );
  }
}
