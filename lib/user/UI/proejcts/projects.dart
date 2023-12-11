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
            ? Text(
                'PROJECTS',
                style: TextStyle(
                  color: const Color(0xFFE2E8F0),
                  fontSize: getFontSizeForScreen(
                      tabSize: 25,
                      phoneSize: 20,
                      webSize: 25,
                      currentScreen: currentScreen),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  //   height: 0.10,
                  letterSpacing: 1.40,
                ),
              )
            : const SizedBox(),
        currentScreen == Screens.phone || currentScreen == Screens.tablet
            ? const SizedBox(
                height: 20,
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
