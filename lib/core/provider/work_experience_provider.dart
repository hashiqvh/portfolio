import 'dart:developer';

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

  updateExperience(ExperienceModel experienceModel) {
    // Find the project in the list based on the project name
    int foundIndex = workExperiences.indexWhere(
      (project) => project.name == experienceModel.name,
    );

    workExperiences[foundIndex] = experienceModel;
    updateWorkExperiences();
    notifyListeners();
  }

  updateExperienceProject(String name, Project project) {
    // Find the project in the list based on the project name
    int foundIndex = workExperiences.indexWhere(
      (project) => project.name == name,
    );

    int projectIndex = workExperiences[foundIndex]
        .projects
        .indexWhere((element) => element.projectName == project.projectName);
    workExperiences[foundIndex].projects[projectIndex] = project;
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
      log(experiencesData.toString());
      await experiencesCollection.doc(docSnapshot.docs.first.id).update({
        'experiences': experiencesData,
      });
    }
    notifyListeners();
  }
}
