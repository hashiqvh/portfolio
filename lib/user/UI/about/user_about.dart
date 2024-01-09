import 'package:flutter/material.dart';
import 'package:my_portfolio/core/models/user_model.dart';
import 'package:my_portfolio/user/UI/components/dynamic_text_about.dart';
import 'package:my_portfolio/utils/utils.dart';

class UserAboutScreen extends StatelessWidget {
  final Screens currentScreen;
  final About about;
  const UserAboutScreen(
      {super.key, required this.about, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).sizeeight,
      width: currentScreen == Screens.laptop
          ? 528
          : MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(
          top: currentScreen == Screens.laptop
              ? calculatePaddingHeight(currentScreen)
              : currentScreen == Screens.tablet
                  ? 15
                  : 30,
          bottom: currentScreen == Screens.laptop
              ? 142
              : currentScreen == Screens.tablet
                  ? 50
                  : 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            currentScreen == Screens.phone || currentScreen == Screens.tablet
                ? Text(
                    'ABOUT',
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
            DynamicContentAbout(
              currentScreen: currentScreen,
              paragraph: about.about,
              wordsToHighlight: about.words,
            ),
          ],
        ),
      ),
    );
  }
}
