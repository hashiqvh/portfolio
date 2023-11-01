import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/utils.dart';

class UserAboutScreen extends StatelessWidget {
  final Screens currentScreen;
  final String about;
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
                  : 10,
          bottom: currentScreen == Screens.laptop
              ? 142
              : currentScreen == Screens.tablet
                  ? 50
                  : 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            currentScreen == Screens.phone || currentScreen == Screens.tablet
                ? const Text(
                    'ABOUT',
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
            currentScreen == Screens.phone || currentScreen == Screens.tablet
                ? const SizedBox(
                    height: 8,
                  )
                : const SizedBox(),
            Text(
              about,
              style: TextStyle(
                fontSize: currentScreen == Screens.phone ||
                        currentScreen == Screens.tablet
                    ? 30
                    : 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
