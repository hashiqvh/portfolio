import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AboutUsProvider extends ChangeNotifier {
  Map<String, dynamic> _aboutUsData = {};

  bool isLoading = false;

  Map<String, dynamic> get aboutUsData => _aboutUsData;

  Future<void> createInitialAboutUsData() async {
    final firestore = FirebaseFirestore.instance;
    final aboutUsCollection = firestore.collection("aboutUs");

    final initialData = {
      'content': 'Default About Us Content',
    };

    await aboutUsCollection.add(initialData);

    _aboutUsData = initialData;
    notifyListeners();
  }

  // Function to fetch the "About Us" data from Firestore
  Future<void> fetchAboutUsData() async {
    isLoading = true;
    final firestore = FirebaseFirestore.instance;
    final aboutUsCollection = firestore.collection("aboutUs");

    final querySnapshot = await aboutUsCollection.get();

    if (querySnapshot.docs.isNotEmpty) {
      final contentData = querySnapshot.docs.first.data();

      _aboutUsData = contentData;
    } else {
      await createInitialAboutUsData();
    }
    isLoading = false;
    notifyListeners();
  }

  // Function to update the "About Us" data in Firestore
  Future<void> updateAboutUsData(Map<String, dynamic> updatedData) async {
    final firestore = FirebaseFirestore.instance;
    final aboutUsCollection = firestore.collection("aboutUs");

    final querySnapshot = await aboutUsCollection.get();
    final docId = querySnapshot.docs.first.id;

    await aboutUsCollection.doc(docId).set(
          updatedData,
        );
    _aboutUsData = updatedData;
    notifyListeners();
  }
}
