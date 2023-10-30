import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/models/project_model.dart'; // Import your ProjectModel class

class ProjectsProvider extends ChangeNotifier {
  List<ProjectModel> _projects = [];

  bool isLoadingProjects = false;
  List<ProjectModel> get projects => _projects;
  Future<void> createInitialProjects() async {
    final firestore = FirebaseFirestore.instance;
    final projectsCollection = firestore.collection("projects");

    final initialData = [];

    await projectsCollection.add({'projects': initialData});

    _projects = [];

    notifyListeners();
  }

  // Function to fetch the "Projects" data from Firestore
  Future<void> fetchProjects() async {
    isLoadingProjects = true;
    final firestore = FirebaseFirestore.instance;
    final projectsCollection = firestore.collection("projects");

    final querySnapshot = await projectsCollection.get();

    if (querySnapshot.docs.isNotEmpty) {
      final projectsData = querySnapshot.docs.first['projects'];

      _projects = projectsData == []
          ? []
          : List<ProjectModel>.from(
              projectsData.map((data) => ProjectModel.fromMap(data)));
    } else {
      await createInitialProjects();
    }
    isLoadingProjects = false;
    notifyListeners();
  }

  // Function to update the "Projects" data in Firestore
  Future<void> updateProjects(List<ProjectModel> updatedProjects) async {
    final firestore = FirebaseFirestore.instance;
    final projectsCollection = firestore.collection("projects");

    final docSnapshot = await projectsCollection.get();

    if (docSnapshot.docs.isNotEmpty) {
      final projectsData = projects.map((project) => project.toMap()).toList();

      await projectsCollection.doc(docSnapshot.docs.first.id).update({
        'projects': projectsData,
      });
    }
    _projects = updatedProjects;
    notifyListeners();
  }
}
