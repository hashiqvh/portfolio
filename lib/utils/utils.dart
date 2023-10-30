import 'package:flutter/material.dart';

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
