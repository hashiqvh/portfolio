import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/models/project_model.dart';
import 'package:my_portfolio/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Import your ProjectModel class

class ProjectsProvider extends ChangeNotifier {
  List<ProjectModel> _projects = [];

  bool isLoadingProjects = false;
  List<ProjectModel> get projects => _projects;
  addProjects(ProjectModel projectModel, BuildContext context) async {
    PostgrestResponse response = await supabase.from('project').upsert(
        projectModel.toJson(),
        options: const FetchOptions(forceResponse: true));
    if (response.status == 201) {
      log("Successfully added");
      fetchProjects();
      Navigator.pop(context);
    } else {
      log("Something went wrong");
    }
  }

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
    PostgrestResponse response = await supabase
        .from('project')
        .select('*', const FetchOptions(forceResponse: true));

    if (response.status == 200) {
      _projects = [];

      _projects = List<ProjectModel>.from(
          response.data.map((x) => ProjectModel.fromJson(x)));
    } else {
      _projects = [];
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
      final projectsData = projects.map((project) => project.toJson()).toList();

      await projectsCollection.doc(docSnapshot.docs.first.id).update({
        'projects': projectsData,
      });
    }
    _projects = updatedProjects;
    notifyListeners();
  }
}
