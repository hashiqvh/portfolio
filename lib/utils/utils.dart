import 'dart:developer';

import 'package:flutter/material.dart';

double calculatePaddingHeight(Screens currentScreen) {
  if (currentScreen == Screens.laptop) {
    return 174;
  } else if (currentScreen == Screens.tablet) {
    return 50;
  } else {
    return 30;
  }
}

double calculatePaddingWidth(Screens currentScreen) {
  if (currentScreen == Screens.laptop) {
    return 150;
  } else if (currentScreen == Screens.tablet) {
    return 100;
  } else {
    return 30;
  }
}

EdgeInsets getCustomPadding({
  bool isSmallScreen = false,
  bool isPortrait = true,
}) {
  if (isSmallScreen) {
    return const EdgeInsets.all(16.0); // Default padding for small screens
  } else if (!isPortrait) {
    return const EdgeInsets.symmetric(
        horizontal: 32.0, vertical: 16.0); // Landscape padding
  } else {
    return const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 16.0); // Default padding for large screens in portrait mode
  }
}

// A function to determine the screen size based on width
Screens getScreenSize(double screenWidth) {
  if (screenWidth >= 1200) {
    log("Current Screen laptop");
    return Screens.laptop;
  } else if (screenWidth >= 600) {
    log("Current Screen tablet");
    return Screens.tablet;
  } else {
    log("Current Screen mobile");
    return Screens.phone;
  }
}

String truncateTextAfterWords(String text, int maxWords) {
  // Split the text into words
  List<String> words = text.split(' ');

  // Check if the text has more words than the maximum allowed
  if (words.length > maxWords) {
    // Join the first 'maxWords' words and add ellipses
    return '${words.take(maxWords).join(' ')}...';
  } else {
    // Return the original text if it has fewer words
    return text;
  }
}

enum Screens {
  laptop,
  tablet,
  phone,
}
