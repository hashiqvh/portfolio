import 'package:flutter/material.dart';
import 'package:my_portfolio/core/provider/work_experience_provider.dart';
import 'package:my_portfolio/user/UI/components/experience_box.dart';
import 'package:my_portfolio/user/UI/components/view_resume.dart';
import 'package:my_portfolio/utils/utils.dart';
import 'package:provider/provider.dart';

class Experience extends StatelessWidget {
  final Screens currentScreen;
  const Experience({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        currentScreen == Screens.phone || currentScreen == Screens.tablet
            ? Text(
                'EXPERIENCE',
                style: TextStyle(
                  color: const Color(0xFFE2E8F0),
                  fontSize: getFontSizeForScreen(
                      tabSize: 25,
                      phoneSize: 20,
                      webSize: 25,
                      currentScreen: currentScreen),

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
        Consumer<WorkExperienceProvider>(
          builder: (context, provider, child) {
            return provider.isLoaded
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      ListView.builder(
                          primary: false,
                          itemCount: provider.workExperiences.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ExperienceBox(
                                currentScreen: currentScreen,
                                experienceModel:
                                    provider.workExperiences[index],
                              )),
                      const SizedBox(
                        height: 20,
                      ),
                      const ViewResumeTile(),
                      SizedBox(
                        height: currentScreen == Screens.phone ? 20 : 20,
                      ),
                    ],
                  );
          },
        )
      ],
    );
  }
}
