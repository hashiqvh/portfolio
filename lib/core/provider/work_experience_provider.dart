import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/models/experience_model.dart';
import 'package:my_portfolio/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WorkExperienceProvider extends ChangeNotifier {
  List<ExperienceModel> workExperiences = [];

  bool isLoaded = false;

  addExperience(BuildContext context, ExperienceModel experienceModel) async {
    PostgrestResponse response = await supabase.from('experience').upsert(
        experienceModel.toJson(),
        options: const FetchOptions(forceResponse: true));
    if (response.status == 201) {
      log("Successfully added");
      fetchWorkExperiences();
      Navigator.pop(context);
    } else {
      log("Something went wrong");
    }
  }

// Method to fetch work experiences from Firestore
  Future<void> fetchWorkExperiences() async {
    print("Fetching work experiences from Firestore");
    isLoaded = true;
    PostgrestResponse response = await supabase.rpc(
      'get_experiences_with_projects',
      options: const FetchOptions(forceResponse: true),
    );

    if (response.status == 200) {
      workExperiences = [];
      workExperiences = List<ExperienceModel>.from(
          response.data.map((x) => ExperienceModel.fromJson(x)));
    } else {
      workExperiences = [];
    }

    isLoaded = false;
    notifyListeners();
  }

  updateExperience(
      BuildContext context, ExperienceModel experienceModel, int id) async {
    PostgrestResponse response = await supabase
        .from('experience')
        .update(experienceModel.toJson(),
            options: const FetchOptions(forceResponse: true))
        .match({"id": id});
    if (response.status == 204) {
      log("Successfully added");
      fetchWorkExperiences();
      Navigator.pop(context);
    } else {
      log("Something went wrong");
    }
  }
}
