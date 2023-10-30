import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/models/experience_model.dart';

class WorkExperienceProvider extends ChangeNotifier {
  List<ExperienceModel> workExperiences = [];

  bool isLoaded = false;
// Method to create initial work experiences in Firestore
  Future<void> createInitialWorkExperiences() async {
    final firestore = FirebaseFirestore.instance;
    final experiencesCollection = firestore.collection("workExperiences");

    final initialData = [];

    await experiencesCollection.add({'experiences': initialData});

    workExperiences = [];
    notifyListeners();
  }

  // Method to fetch work experiences from Firestore
  Future<void> fetchWorkExperiences() async {
    print("Fetching work experiences from Firestore");
    isLoaded = true;
    final firestore = FirebaseFirestore.instance;
    final experiencesCollection = firestore.collection("workExperiences");

    final querySnapshot = await experiencesCollection.get();

    if (querySnapshot.docs.isNotEmpty) {
      final experiencesData = querySnapshot.docs.first['experiences'];

      workExperiences = experiencesData == null
          ? []
          : List<ExperienceModel>.from(
              experiencesData.map((data) => ExperienceModel.fromMap(data)));
    } else {
      await createInitialWorkExperiences();
    }
    isLoaded = false;
    notifyListeners();
  }

  // Method to update work experiences in Firestore
  Future<void> updateWorkExperiences() async {
    final firestore = FirebaseFirestore.instance;
    final experiencesCollection = firestore.collection("workExperiences");

    final docSnapshot = await experiencesCollection.get();

    if (docSnapshot.docs.isNotEmpty) {
      final experiencesData =
          workExperiences.map((experience) => experience.toMap()).toList();

      await experiencesCollection.doc(docSnapshot.docs.first.id).update({
        'experiences': experiencesData,
      });
    }
  }
}
