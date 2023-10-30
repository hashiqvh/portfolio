import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IntroProvider extends ChangeNotifier {
  Map<String, dynamic> _introductoryContent = {};

  bool isLoading = false;
  Map<String, dynamic> get introductoryContent => _introductoryContent;
  Future<void> createInitialIntroductoryContent() async {
    final firestore = FirebaseFirestore.instance;
    final introductoryContentCollection =
        firestore.collection("introductoryContent");

    final initialData = {
      'title_one': 'Default Title One',
      'title_two': 'Default Title Two',
      'title_three': 'Default Title Three',
    };

    await introductoryContentCollection.add(initialData);

    _introductoryContent = initialData;
  }

  // Function to fetch the "Introductory Content" data from Firestore
  Future<void> fetchIntroductoryContent() async {
    isLoading = true;
    final firestore = FirebaseFirestore.instance;
    final introductoryContentCollection =
        firestore.collection("introductoryContent");

    final querySnapshot = await introductoryContentCollection.get();

    if (querySnapshot.docs.isNotEmpty) {
      final contentData = querySnapshot.docs.first.data();

      _introductoryContent = contentData;
    } else {
      await createInitialIntroductoryContent();
    }
    isLoading = false;
    notifyListeners();
  }

  // Function to update the "Introductory Content" data in Firestore
  Future<void> updateIntroductoryContent(
      Map<String, dynamic> updatedContent) async {
    final firestore = FirebaseFirestore.instance;
    final introductoryContentCollection =
        firestore.collection("introductoryContent");

    final querySnapshot = await introductoryContentCollection.get();
    final docId = querySnapshot.docs.first.id;

    await introductoryContentCollection.doc(docId).set(
          updatedContent,
        );
    _introductoryContent = updatedContent;
    notifyListeners();
  }
}
