import 'package:flutter/material.dart';
import 'package:my_portfolio/core/models/data_response.dart';
import 'package:my_portfolio/core/provider/about_provider.dart';
import 'package:my_portfolio/core/provider/intro_provider.dart';
import 'package:my_portfolio/core/provider/project_provider.dart';
import 'package:my_portfolio/core/provider/skills_provider.dart';
import 'package:my_portfolio/core/provider/work_experience_provider.dart';
import 'package:provider/provider.dart';

class DataProvider extends ChangeNotifier {
  DataResponse _dataResponse = DataResponse(
    aboutUsData: {},
    introductoryContent: {},
    projects: [],
    skills: [],
    workExperiences: [],
  );
  bool _isLoading = false;
  DataResponse get dataResponse => _dataResponse;
  bool get isLoading => _isLoading;

  // Fetch all data
  Future<void> fetchData(BuildContext context) async {
    _isLoading = true;
    var introProvider = Provider.of<IntroProvider>(context, listen: false);
    var aboutProvider = Provider.of<AboutUsProvider>(context, listen: false);
    var skillsProvider = Provider.of<SkillsProvider>(context, listen: false);
    var workExperienceProvider =
        Provider.of<WorkExperienceProvider>(context, listen: false);
    var projectsproviderr =
        Provider.of<ProjectsProvider>(context, listen: false);
    try {
      await introProvider.fetchIntroductoryContent();
      await aboutProvider.fetchAboutUsData();
      await skillsProvider.fetchSkills();
      await workExperienceProvider.fetchWorkExperiences();
      await projectsproviderr.fetchProjects();
    } catch (error) {
      print('Error fetching data: $error');
    } finally {
      // Set the response with updated data and loading flags
      _dataResponse = DataResponse(
        aboutUsData: aboutProvider.aboutUsData,
        introductoryContent: introProvider.introductoryContent,
        projects: projectsproviderr.projects,
        skills: skillsProvider.skills,
        workExperiences: workExperienceProvider.workExperiences,
      );
      _isLoading = false;
      notifyListeners();
    }
  }
}
