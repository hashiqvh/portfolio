import 'package:my_portfolio/core/models/experience_model.dart';
import 'package:my_portfolio/core/models/project_model.dart';

class DataResponse {
  final Map<String, dynamic> aboutUsData;
  final Map<String, dynamic> introductoryContent;
  final List<ProjectModel> projects;
  final List<String> skills;
  final List<ExperienceModel> workExperiences;

  DataResponse({
    required this.aboutUsData,
    required this.introductoryContent,
    required this.projects,
    required this.skills,
    required this.workExperiences,
  });
}
