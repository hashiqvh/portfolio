import 'dart:developer';

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
      // Sort the items based on their IDs
      _projects.sort((a, b) => a.id!.compareTo(b.id!));
    } else {
      _projects = [];
    }

    isLoadingProjects = false;
    notifyListeners();
  }

  // Function to update the "Projects" data in Firestore
  Future<void> updateProjects(
    ProjectModel projectModel,
    BuildContext context,
    int id,
  ) async {
    PostgrestResponse response = await supabase
        .from('project')
        .update(projectModel.toJson(),
            options: const FetchOptions(forceResponse: true))
        .match({"id": id});
    if (response.status == 204) {
      log("Successfully added");
      fetchProjects();
      Navigator.pop(context);
    } else {
      log("Something went wrong");
    }
    notifyListeners();
  }
}
